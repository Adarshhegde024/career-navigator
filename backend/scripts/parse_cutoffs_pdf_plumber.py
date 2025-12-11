import sys
import json
import pdfplumber
import re

# Usage: python parse_cutoffs_pdf_plumber.py <pdf_path>

def extract_rows_from_pdf(pdf_path):
    rows = []
    with pdfplumber.open(pdf_path) as pdf:
        for page in pdf.pages:
            tables = page.extract_tables()
            for table in tables:
                # Assume first row is header or skip if not enough columns
                for row in table[1:]:
                    # Try to extract relevant fields
                    # Heuristic: look for 3-5 columns per row
                    if len(row) >= 4:
                        college, branch, category, cutoff = row[:4]
                        # Clean up values
                        college = (college or '').strip()
                        branch = (branch or '').strip()
                        category = (category or '').strip()
                        cutoff = (cutoff or '').strip()
                        # Only add if cutoff is a number
                        cutoff_num = re.sub(r'[^0-9]', '', cutoff)
                        if college and branch and category and cutoff_num:
                            rows.append({
                                'college': college,
                                'branch': branch,
                                'category': category,
                                'cutoff': int(cutoff_num)
                            })
    return rows

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(json.dumps({"error": "No PDF path provided."}))
        sys.exit(1)
    pdf_path = sys.argv[1]
    try:
        result = extract_rows_from_pdf(pdf_path)
        print(json.dumps(result, ensure_ascii=False))
    except Exception as e:
        print(json.dumps({"error": str(e)}))
        sys.exit(1)
