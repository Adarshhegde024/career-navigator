import json
import os
import sys
import time

import google.generativeai as gen

PRIMARY_MODEL = "gemini-1.0-pro"
FALLBACK_MODEL = "gemini-pro"
PROMPT = """
You are given the official KEA cutoff PDF for engineering colleges.
Extract every row that has all of the following fields:
- College (full name)
- Branch/Course (use short names like CSE, ISE, ECE, AIML, ME when possible)
- Category (GM, SC, ST, 2A, 2B, 3A, 3B, CAT-1, etc.)
- Cutoff rank (integer)

Return ONLY valid JSON (no prose) formatted as an array of objects:
[
  {"college": "...", "branch": "...", "category": "...", "cutoff": 12345},
  ...
]

Guidelines:
- Skip rows that do not have a numeric cutoff.
- If branch names are long, map them to common abbreviations (CSE, ECE, etc.).
- Category should match KEA wording (GM, SC, ST, 2A, 3A, etc.).
- Output must be JSON only.
"""


def error_exit(message: str):
    print(json.dumps({"error": message}))
    sys.exit(1)


def main():
    if len(sys.argv) < 2:
        error_exit("No PDF path provided.")

    path = sys.argv[1]
    if not os.path.exists(path):
        error_exit("File not found.")

    api_key = os.environ.get("GEMINI_API_KEY")
    if not api_key:
        error_exit("GEMINI_API_KEY environment variable not set.")

    gen.configure(api_key=api_key)

    try:
        uploaded = gen.upload_file(path=path, display_name=os.path.basename(path))
    except Exception as exc:
        error_exit(f"Upload failed: {exc}")

    while uploaded.state.name == "PROCESSING":
        time.sleep(1)
        uploaded = gen.get_file(uploaded.name)

    if uploaded.state.name != "ACTIVE":
        error_exit(f"File processing failed: {uploaded.state.name}")

    # Try primary model, fallback to another if needed
    for model_name in [PRIMARY_MODEL, FALLBACK_MODEL]:
        try:
            model = gen.GenerativeModel(model_name)
            response = model.generate_content(
                [uploaded, PROMPT],
                request_options={"timeout": 600}
            )
            text = response.text.strip()
            if text:
                break
        except Exception as exc:
            last_error = str(exc)
            text = ''
    else:
        error_exit(f"Gemini call failed: {last_error}")

    if not text:
        error_exit("Gemini returned empty response.")
    if not text:
        error_exit("Gemini returned empty response.")

    text = text.strip("`")
    if text.startswith("json"):
        text = text[4:]
    text = text.strip()

    try:
        data = json.loads(text)
    except json.JSONDecodeError:
        error_exit("Gemini response was not valid JSON.")

    print(json.dumps(data, ensure_ascii=False))


if __name__ == "__main__":
    main()

