import json
import re
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parents[1]
DATA_PATH = BASE_DIR / "data" / "colleges_karnataka.json"
SQL_PATH = BASE_DIR / "sql" / "colleges_schema.sql"

ADMIN_EMAIL = "cetnavigator151@gmail.com"
ADMIN_PASSWORD_HASH = "$2y$10$hxSdh6WdHZr.Q.OXKF23uORTDDr6s40fjtnokvxyCKyPL.oD1BTzW"

COLLEGES = [
    {"name": "RV College of Engineering", "city": "Bengaluru", "website": "https://rvce.edu.in/", "tier": 1},
    {"name": "PES University RR Campus", "city": "Bengaluru", "website": "https://www.pes.edu/", "tier": 1},
    {"name": "BMS College of Engineering", "city": "Bengaluru", "website": "https://www.bmsce.ac.in/", "tier": 1},
    {"name": "M.S. Ramaiah Institute of Technology", "city": "Bengaluru", "website": "https://www.msrit.edu/", "tier": 1},
    {"name": "Bangalore Institute of Technology", "city": "Bengaluru", "website": "https://bit-bangalore.edu.in/", "tier": 1},
    {"name": "University Visvesvaraya College of Engineering", "city": "Bengaluru", "website": "https://uvce.ac.in/", "tier": 1},
    {"name": "JSS Science and Technology University (SJCE)", "city": "Mysuru", "website": "https://jssstuniv.in/", "tier": 1},
    {"name": "National Institute of Engineering", "city": "Mysuru", "website": "https://nie.ac.in/", "tier": 1},
    {"name": "Manipal Institute of Technology", "city": "Udupi", "website": "https://manipal.edu/mit/", "tier": 1},
    {"name": "KLE Technological University (BVB)", "city": "Hubballi", "website": "https://www.kletech.ac.in/", "tier": 1},
    {"name": "Sri Jayachamarajendra College of Engineering", "city": "Mysuru", "website": "https://sjce.ac.in/", "tier": 1},
    {"name": "PES College of Engineering Mandya", "city": "Mandya", "website": "https://pescemandya.org/", "tier": 2},
    {"name": "Siddaganga Institute of Technology", "city": "Tumakuru", "website": "https://www.sit.ac.in/", "tier": 2},
    {"name": "Malnad College of Engineering", "city": "Hassan", "website": "https://www.mcehassan.ac.in/", "tier": 2},
    {"name": "Vidya Vardhaka College of Engineering", "city": "Mysuru", "website": "https://vvce.ac.in/", "tier": 2},
    {"name": "Dr. Ambedkar Institute of Technology", "city": "Bengaluru", "website": "https://drait.edu.in/", "tier": 2},
    {"name": "BMS Institute of Technology and Management", "city": "Bengaluru", "website": "https://bmsit.ac.in/", "tier": 2},
    {"name": "Dayananda Sagar College of Engineering", "city": "Bengaluru", "website": "https://dsce.edu.in/", "tier": 2},
    {"name": "Sir M. Visvesvaraya Institute of Technology", "city": "Bengaluru", "website": "https://www.sirmvit.edu/", "tier": 2},
    {"name": "NMAM Institute of Technology Nitte", "city": "Udupi", "website": "https://nmamit.nitte.edu.in/", "tier": 2},
    {"name": "Jain Faculty of Engineering and Technology", "city": "Bengaluru", "website": "https://www.jainuniversity.ac.in/", "tier": 2},
    {"name": "Christ University Faculty of Engineering", "city": "Bengaluru", "website": "https://christuniversity.in/engineering", "tier": 2},
    {"name": "Reva University School of Engineering", "city": "Bengaluru", "website": "https://www.reva.edu.in/", "tier": 2},
    {"name": "SJB Institute of Technology", "city": "Bengaluru", "website": "https://sjbit.edu.in/", "tier": 3},
    {"name": "RNS Institute of Technology", "city": "Bengaluru", "website": "https://www.rnsit.ac.in/", "tier": 3},
    {"name": "CMR Institute of Technology", "city": "Bengaluru", "website": "https://www.cmrit.ac.in/", "tier": 3},
    {"name": "New Horizon College of Engineering", "city": "Bengaluru", "website": "https://newhorizonindia.edu/nhengineering/", "tier": 3},
    {"name": "Nitte Meenakshi Institute of Technology", "city": "Bengaluru", "website": "https://www.nmit.ac.in/", "tier": 3},
    {"name": "Acharya Institute of Technology", "city": "Bengaluru", "website": "https://acharya.ac.in/ait/", "tier": 3},
    {"name": "Alliance College of Engineering and Design", "city": "Bengaluru", "website": "https://www.alliance.edu.in/", "tier": 3},
    {"name": "Presidency University School of Engineering", "city": "Bengaluru", "website": "https://presidencyuniversity.in/", "tier": 3},
    {"name": "Global Academy of Technology", "city": "Bengaluru", "website": "https://www.gat.ac.in/", "tier": 3},
    {"name": "Sapthagiri College of Engineering", "city": "Bengaluru", "website": "https://www.sapthagiri.edu.in/", "tier": 3},
    {"name": "PES Institute of Technology and Management", "city": "Shivamogga", "website": "https://pesitm.ac.in/", "tier": 3},
    {"name": "Jawaharlal Nehru National College of Engineering", "city": "Shivamogga", "website": "https://www.jnnce.ac.in/", "tier": 3},
    {"name": "Sahyadri College of Engineering and Management", "city": "Mangaluru", "website": "https://sahyadri.edu.in/", "tier": 3},
    {"name": "St Joseph Engineering College Mangaluru", "city": "Mangaluru", "website": "https://www.sjec.ac.in/", "tier": 3},
    {"name": "Canara Engineering College", "city": "Mangaluru", "website": "https://www.canaraengineering.in/", "tier": 3},
    {"name": "Alva's Institute of Engineering and Technology", "city": "Moodbidri", "website": "https://aiet.org.in/", "tier": 3},
    {"name": "Srinivas Institute of Technology", "city": "Mangaluru", "website": "https://www.sitmng.ac.in/", "tier": 3},
    {"name": "P.A. College of Engineering", "city": "Mangaluru", "website": "https://www.pace.edu.in/", "tier": 3},
    {"name": "Yenepoya Institute of Technology", "city": "Moodbidri", "website": "https://www.yit.edu.in/", "tier": 3},
    {"name": "SDM College of Engineering and Technology", "city": "Dharwad", "website": "https://www.sdm.ac.in/", "tier": 3},
    {"name": "Basaveshwar Engineering College Bagalkot", "city": "Bagalkot", "website": "https://www.becbgk.edu/", "tier": 3},
    {"name": "Bapuji Institute of Engineering and Technology", "city": "Davangere", "website": "https://bietdvg.edu/", "tier": 3},
    {"name": "University BDT College of Engineering", "city": "Davangere", "website": "https://ubdtce.org/", "tier": 3},
    {"name": "Ballari Institute of Technology and Management", "city": "Ballari", "website": "https://www.bits-bellary.org/", "tier": 3},
    {"name": "Rao Bahadur Y Mahabaleshwarappa Engineering College", "city": "Ballari", "website": "https://rymec.in/", "tier": 3},
    {"name": "Poojya Doddappa Appa College of Engineering", "city": "Kalaburagi", "website": "https://pdaengg.com/", "tier": 3},
    {"name": "KLS Gogte Institute of Technology", "city": "Belagavi", "website": "https://git.edu/", "tier": 3},
    {"name": "Angadi Institute of Technology and Management", "city": "Belagavi", "website": "https://aitmbelagavi.edu.in/", "tier": 3},
    {"name": "Maratha Mandal Engineering College", "city": "Belagavi", "website": "http://www.mmec.edu.in/", "tier": 3},
    {"name": "Guru Nanak Dev Engineering College Bidar", "city": "Bidar", "website": "https://gndecb.ac.in/", "tier": 3},
    {"name": "Khaja Banda Nawaz College of Engineering", "city": "Kalaburagi", "website": "https://kbnce.edu.in/", "tier": 3},
    {"name": "Sri Siddhartha Institute of Technology", "city": "Tumakuru", "website": "https://ssit.edu.in/", "tier": 3},
    {"name": "Adichunchanagiri Institute of Technology", "city": "Chikkamagaluru", "website": "https://www.acitechnology.in/", "tier": 3},
    {"name": "GSSS Institute of Engineering and Technology for Women", "city": "Mysuru", "website": "https://www.geethashishu.in/", "tier": 3},
    {"name": "Vidya Vikas Institute of Engineering and Technology", "city": "Mysuru", "website": "https://vviethmysore.in/", "tier": 3},
    {"name": "Maharaja Institute of Technology Thandavapura", "city": "Mysuru", "website": "https://www.mitmysore.in/", "tier": 3},
    {"name": "Government Engineering College Hassan", "city": "Hassan", "website": "https://www.gechassan.ac.in/", "tier": 4},
    {"name": "Government Engineering College Raichur", "city": "Raichur", "website": "https://gecraichur.ac.in/", "tier": 4},
    {"name": "Government Engineering College Ramanagara", "city": "Ramanagara", "website": "https://gecr.in/", "tier": 4},
    {"name": "Government Engineering College Chamarajanagar", "city": "Chamarajanagar", "website": "https://geccj.ac.in/", "tier": 4},
    {"name": "Government Engineering College Krishnarajpet", "city": "Mandya", "website": "https://gecck.ac.in/", "tier": 4},
    {"name": "Sri Venkateshwara College of Engineering", "city": "Bengaluru", "website": "https://www.srivenkateshwara.org/", "tier": 4},
    {"name": "Jyothy Institute of Technology", "city": "Bengaluru", "website": "https://jyothyit.ac.in/", "tier": 4},
    {"name": "Global Institute of Management and Technology", "city": "Bengaluru", "website": "https://www.gimt.co.in/", "tier": 4},
    {"name": "HKBK College of Engineering", "city": "Bengaluru", "website": "https://hkbk.edu.in/", "tier": 4},
    {"name": "MVJ College of Engineering", "city": "Bengaluru", "website": "https://mvjce.edu.in/", "tier": 4},
    {"name": "East Point College of Engineering and Technology", "city": "Bengaluru", "website": "https://epcet.edu.in/", "tier": 4},
    {"name": "KS Institute of Technology", "city": "Bengaluru", "website": "https://www.ksit.ac.in/", "tier": 4},
    {"name": "Advanced Institute of Technology", "city": "Bengaluru", "website": "https://www.aiet.edu.in/", "tier": 4},
    {"name": "AMC Engineering College", "city": "Bengaluru", "website": "https://www.amcgroup.edu.in/amec/", "tier": 4},
    {"name": "Atria Institute of Technology", "city": "Bengaluru", "website": "https://atria.edu/", "tier": 4},
    {"name": "Cambridge Institute of Technology", "city": "Bengaluru", "website": "https://www.cambridge.edu.in/", "tier": 4},
    {"name": "Don Bosco Institute of Technology Bengaluru", "city": "Bengaluru", "website": "https://www.dbit.co.in/", "tier": 4},
    {"name": "Brindavan College of Engineering", "city": "Bengaluru", "website": "https://www.brindavancollege.com/", "tier": 4},
    {"name": "BTL Institute of Technology", "city": "Bengaluru", "website": "https://btlit.ac.in/", "tier": 4},
    {"name": "Gopalan College of Engineering and Management", "city": "Bengaluru", "website": "https://www.gopalancolleges.com/gcem/", "tier": 4},
    {"name": "Sri Sairam College of Engineering", "city": "Bengaluru", "website": "https://sairamgroup.in/", "tier": 4},
    {"name": "R.L. Jalappa Institute of Technology", "city": "Doddaballapur", "website": "https://rljit.ac.in/", "tier": 4},
    {"name": "Nagarjuna College of Engineering and Technology", "city": "Bengaluru", "website": "https://ncet.co.in/", "tier": 4},
    {"name": "T. John Institute of Technology", "city": "Bengaluru", "website": "https://www.tjohncollege.com/", "tier": 4},
    {"name": "Sri Revana Siddeshwara Institute of Technology", "city": "Bengaluru", "website": "https://srsit.ac.in/", "tier": 4},
    {"name": "Kristu Jayanti College of Engineering and Technology", "city": "Bengaluru", "website": "https://kristujayanti.edu.in/", "tier": 4},
    {"name": "Oxford College of Engineering", "city": "Bengaluru", "website": "https://www.theoxford.edu/", "tier": 4},
    {"name": "G Madegowda Institute of Technology", "city": "Mandya", "website": "https://gmitmandya.in/", "tier": 4},
    {"name": "Kalpataru Institute of Technology", "city": "Tiptur", "website": "https://kit.edu.in/", "tier": 4},
    {"name": "JSS Academy of Technical Education Bengaluru", "city": "Bengaluru", "website": "https://jssateb.ac.in/", "tier": 4},
    {"name": "Government Engineering College Haveri", "city": "Haveri", "website": "https://gechaveri.ac.in/", "tier": 4},
    {"name": "Government Engineering College Kushalnagar", "city": "Kodagu", "website": "https://geckodagu.ac.in/", "tier": 4},
    {"name": "SJM Institute of Technology", "city": "Chitradurga", "website": "https://sjmit.ac.in/", "tier": 4},
    {"name": "Bapuji Academy of Management and Research (Engg)", "city": "Davangere", "website": "https://www.bapujiamr.org/", "tier": 4},
    {"name": "Navkis College of Engineering Hassan", "city": "Hassan", "website": "https://www.navkisce.in/", "tier": 4},
    {"name": "Rajarajeshwari College of Engineering", "city": "Bengaluru", "website": "https://www.rrce.org/", "tier": 4},
    {"name": "East West Institute of Technology", "city": "Bengaluru", "website": "https://www.ewit.edu.in/", "tier": 4},
    {"name": "Bangalore Technological Institute", "city": "Bengaluru", "website": "https://btibangalore.org/", "tier": 4},
    {"name": "Sri Krishna Institute of Technology", "city": "Bengaluru", "website": "https://www.skit.org.in/", "tier": 4},
    {"name": "Acharaya Patashala College of Engineering", "city": "Bengaluru", "website": "https://apsce.ac.in/", "tier": 4},
    {"name": "Government Engineering College Gangavati", "city": "Koppal", "website": "https://gecgvt.ac.in/", "tier": 4},
    {"name": "Government Engineering College Karwar", "city": "Uttara Kannada", "website": "https://geckarwar.karnataka.gov.in/", "tier": 4},
    {"name": "Government Engineering College Bharamasagara", "city": "Chitradurga", "website": "https://gecb.ac.in/", "tier": 4},
    {"name": "Sri Taralabalu Jagadguru Institute of Technology", "city": "Ranebennuru", "website": "https://stjit.ac.in/", "tier": 4},
    {"name": "Anjuman Institute of Technology and Management", "city": "Bhatkal", "website": "https://www.aitmbhatkal.edu.in/", "tier": 4},
    {"name": "Govt Engineering College Krishnagiri (KSITM)", "city": "Yadgir", "website": "https://gecyadgir.ac.in/", "tier": 4},
    {"name": "Jain Institute of Technology Davangere", "city": "Davangere", "website": "https://jitd.in/", "tier": 4},
    {"name": "Channabasaveshwara Institute of Technology", "city": "Gubbi", "website": "https://www.cittumkur.org/", "tier": 4},
    {"name": "Pavana College of Engineering", "city": "Kolar", "website": "https://pavana.org/", "tier": 4},
    {"name": "Sri Krishna School of Engineering and Management", "city": "Bengaluru", "website": "https://srikrisna.org/", "tier": 4},
    {"name": "Visvesvaraya Technological University Regional Centre Kalaburagi", "city": "Kalaburagi", "website": "https://vtu.ac.in/", "tier": 4}
]

BRANCHES = ["CSE", "ISE", "ECE", "AIML", "ME"]

CATEGORY_FACTORS = {
    "GM": 1.0,
    "SC": 1.45,
    "ST": 1.35,
    "2A": 1.15,
    "3A": 1.08,
}

FEE_BY_TIER = {
    1: "₹3,00,000",
    2: "₹2,20,000",
    3: "₹1,80,000",
    4: "₹1,40,000",
}

PACKAGES_BY_TIER = {
    1: ("70 LPA", "18 LPA"),
    2: ("40 LPA", "10 LPA"),
    3: ("28 LPA", "7 LPA"),
    4: ("18 LPA", "5 LPA"),
}

CUTOFF_BASE = {
    1: {"CSE": 1500, "ISE": 2200, "ECE": 3200, "AIML": 2000, "ME": 9000},
    2: {"CSE": 4500, "ISE": 6500, "ECE": 9000, "AIML": 5500, "ME": 15000},
    3: {"CSE": 12000, "ISE": 17000, "ECE": 22000, "AIML": 14000, "ME": 35000},
    4: {"CSE": 22000, "ISE": 28000, "ECE": 36000, "AIML": 26000, "ME": 55000},
}


def slugify(name: str, max_length: int = 120) -> str:
    """Generate a URL-friendly slug from college name, truncated to max_length."""
    slug = re.sub(r"[^a-z0-9]+", "-", name.lower())
    slug = slug.strip("-")
    # Truncate to max_length if needed, ensuring we don't cut in the middle of a word
    if len(slug) > max_length:
        # Try to truncate at a hyphen
        truncated = slug[:max_length]
        last_hyphen = truncated.rfind("-")
        if last_hyphen > max_length * 0.8:  # If hyphen is reasonably close to end
            slug = truncated[:last_hyphen]
        else:
            slug = truncated
    return slug


def normalize_name(name: str) -> str:
    """Normalize college name for duplicate detection."""
    # Remove common suffixes, extra spaces, convert to lowercase
    normalized = re.sub(r'\s+', ' ', name.lower().strip())
    # Remove common words that might vary
    normalized = re.sub(r'\b(university|college|institute|of|technology|engineering|and)\b', '', normalized)
    normalized = re.sub(r'\s+', '', normalized)  # Remove all spaces
    return normalized


def build_dataset():
    dataset = []
    seen_names = set()
    seen_slugs = set()

    for idx, college in enumerate(COLLEGES):
        normalized = normalize_name(college["name"])
        if normalized in seen_names:
            print(f"Warning: Skipping duplicate college: {college['name']}")
            continue

        tier = college["tier"]
        slug = slugify(college["name"])

        original_slug = slug
        counter = 1
        while slug in seen_slugs:
            suffix = f"-{counter}"
            max_base = 120 - len(suffix)
            slug = original_slug[:max_base] + suffix
            counter += 1

        seen_names.add(normalized)
        seen_slugs.add(slug)

        fees = college.get("fees") or FEE_BY_TIER[tier]
        high_pkg, avg_pkg = PACKAGES_BY_TIER[tier]
        modifier = (idx % 5) * 600
        cutoffs = {}

        for branch in BRANCHES:
            base_value = CUTOFF_BASE[tier][branch]
            delta = modifier if branch != "ME" else modifier * 3
            branch_base = base_value + delta
            cutoffs[branch] = {}
            for category, factor in CATEGORY_FACTORS.items():
                cutoffs[branch][category] = int(branch_base * factor)

        dataset.append(
            {
                "slug": slug,
                "name": college["name"],
                "location": college["city"],
                "fees": fees,
                "website": college["website"],
                "packages": {"high": high_pkg, "avg": avg_pkg},
                "cutoffs": cutoffs,
            }
        )
    return dataset


def write_json(data):
    DATA_PATH.parent.mkdir(parents=True, exist_ok=True)
    with DATA_PATH.open("w", encoding="utf-8") as fh:
        json.dump(data, fh, indent=2, ensure_ascii=False)


def sql_escape(value: str) -> str:
    return value.replace("'", "''")


def write_sql(data):
    SQL_PATH.parent.mkdir(parents=True, exist_ok=True)
    college_values = []
    cutoff_selects = []
    for entry in data:
        college_values.append(
            "('{slug}', '{name}', '{location}', '{fees}', '{website}', '{high}', '{avg}')".format(
                slug=sql_escape(entry["slug"]),
                name=sql_escape(entry["name"]),
                location=sql_escape(entry["location"]),
                fees=sql_escape(entry["fees"]),
                website=sql_escape(entry["website"]),
                high=sql_escape(entry["packages"]["high"]),
                avg=sql_escape(entry["packages"]["avg"]),
            )
        )
        for branch, categories in entry["cutoffs"].items():
            for category, cutoff in categories.items():
                cutoff_selects.append(
                    "SELECT c.id, '{branch}', '{category}', {cutoff} FROM colleges c WHERE c.slug = '{slug}'".format(
                        slug=sql_escape(entry["slug"]),
                        branch=sql_escape(branch),
                        category=sql_escape(category),
                        cutoff=cutoff,
                    )
                )

    sql_content = """-- Schema for storing CET Navigator college data

CREATE TABLE IF NOT EXISTS colleges (
    id INT AUTO_INCREMENT PRIMARY KEY,
    slug VARCHAR(120) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(120) NOT NULL,
    fees VARCHAR(50) NOT NULL,
    website VARCHAR(255) NOT NULL,
    highest_package VARCHAR(50) NOT NULL,
    avg_package VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS branch_cutoffs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    college_id INT NOT NULL,
    branch VARCHAR(20) NOT NULL,
    category VARCHAR(20) NOT NULL,
    cutoff INT NOT NULL,
    CONSTRAINT fk_branch_college FOREIGN KEY (college_id) REFERENCES colleges (id) ON DELETE CASCADE,
    UNIQUE KEY unique_branch_category (college_id, branch, category)
);

CREATE TABLE IF NOT EXISTS admin_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP NULL DEFAULT NULL
);

INSERT INTO admin_users (email, password_hash)
VALUES ('{admin_email}', '{admin_hash}')
ON DUPLICATE KEY UPDATE password_hash = VALUES(password_hash);

-- Disable foreign key checks temporarily to allow clean deletion and insertion
SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM branch_cutoffs;
DELETE FROM colleges;

INSERT INTO colleges (slug, name, location, fees, website, highest_package, avg_package) VALUES
{colleges};

INSERT INTO branch_cutoffs (college_id, branch, category, cutoff)
{cutoffs};

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
""".format(
        colleges=",\n".join(college_values),
        cutoffs="\nUNION ALL\n".join(cutoff_selects) if cutoff_selects else "SELECT NULL, '', '', 0 WHERE 1=0",
        admin_email=sql_escape(ADMIN_EMAIL),
        admin_hash=sql_escape(ADMIN_PASSWORD_HASH),
    )

    SQL_PATH.write_text(sql_content, encoding="utf-8")


if __name__ == "__main__":
    dataset = build_dataset()
    write_json(dataset)
    write_sql(dataset)
    print(f"Wrote {len(dataset)} colleges to {DATA_PATH.name} and updated {SQL_PATH.name}.")

