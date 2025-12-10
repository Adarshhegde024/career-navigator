-- Schema for storing CET Navigator college data

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
VALUES ('cetnavigator151@gmail.com', '$2y$10$hxSdh6WdHZr.Q.OXKF23uORTDDr6s40fjtnokvxyCKyPL.oD1BTzW')
ON DUPLICATE KEY UPDATE password_hash = VALUES(password_hash);

-- Disable foreign key checks temporarily to allow clean deletion and insertion
SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM branch_cutoffs;
DELETE FROM colleges;

INSERT INTO colleges (slug, name, location, fees, website, highest_package, avg_package) VALUES
('rv-college-of-engineering', 'RV College of Engineering', 'Bengaluru', '₹3,00,000', 'https://rvce.edu.in/', '70 LPA', '18 LPA'),
('pes-university-rr-campus', 'PES University RR Campus', 'Bengaluru', '₹3,00,000', 'https://www.pes.edu/', '70 LPA', '18 LPA'),
('bms-college-of-engineering', 'BMS College of Engineering', 'Bengaluru', '₹3,00,000', 'https://www.bmsce.ac.in/', '70 LPA', '18 LPA'),
('m-s-ramaiah-institute-of-technology', 'M.S. Ramaiah Institute of Technology', 'Bengaluru', '₹3,00,000', 'https://www.msrit.edu/', '70 LPA', '18 LPA'),
('bangalore-institute-of-technology', 'Bangalore Institute of Technology', 'Bengaluru', '₹3,00,000', 'https://bit-bangalore.edu.in/', '70 LPA', '18 LPA'),
('university-visvesvaraya-college-of-engineering', 'University Visvesvaraya College of Engineering', 'Bengaluru', '₹3,00,000', 'https://uvce.ac.in/', '70 LPA', '18 LPA'),
('jss-science-and-technology-university-sjce', 'JSS Science and Technology University (SJCE)', 'Mysuru', '₹3,00,000', 'https://jssstuniv.in/', '70 LPA', '18 LPA'),
('national-institute-of-engineering', 'National Institute of Engineering', 'Mysuru', '₹3,00,000', 'https://nie.ac.in/', '70 LPA', '18 LPA'),
('manipal-institute-of-technology', 'Manipal Institute of Technology', 'Udupi', '₹3,00,000', 'https://manipal.edu/mit/', '70 LPA', '18 LPA'),
('kle-technological-university-bvb', 'KLE Technological University (BVB)', 'Hubballi', '₹3,00,000', 'https://www.kletech.ac.in/', '70 LPA', '18 LPA'),
('sri-jayachamarajendra-college-of-engineering', 'Sri Jayachamarajendra College of Engineering', 'Mysuru', '₹3,00,000', 'https://sjce.ac.in/', '70 LPA', '18 LPA'),
('pes-college-of-engineering-mandya', 'PES College of Engineering Mandya', 'Mandya', '₹2,20,000', 'https://pescemandya.org/', '40 LPA', '10 LPA'),
('siddaganga-institute-of-technology', 'Siddaganga Institute of Technology', 'Tumakuru', '₹2,20,000', 'https://www.sit.ac.in/', '40 LPA', '10 LPA'),
('malnad-college-of-engineering', 'Malnad College of Engineering', 'Hassan', '₹2,20,000', 'https://www.mcehassan.ac.in/', '40 LPA', '10 LPA'),
('vidya-vardhaka-college-of-engineering', 'Vidya Vardhaka College of Engineering', 'Mysuru', '₹2,20,000', 'https://vvce.ac.in/', '40 LPA', '10 LPA'),
('dr-ambedkar-institute-of-technology', 'Dr. Ambedkar Institute of Technology', 'Bengaluru', '₹2,20,000', 'https://drait.edu.in/', '40 LPA', '10 LPA'),
('bms-institute-of-technology-and-management', 'BMS Institute of Technology and Management', 'Bengaluru', '₹2,20,000', 'https://bmsit.ac.in/', '40 LPA', '10 LPA'),
('dayananda-sagar-college-of-engineering', 'Dayananda Sagar College of Engineering', 'Bengaluru', '₹2,20,000', 'https://dsce.edu.in/', '40 LPA', '10 LPA'),
('sir-m-visvesvaraya-institute-of-technology', 'Sir M. Visvesvaraya Institute of Technology', 'Bengaluru', '₹2,20,000', 'https://www.sirmvit.edu/', '40 LPA', '10 LPA'),
('nmam-institute-of-technology-nitte', 'NMAM Institute of Technology Nitte', 'Udupi', '₹2,20,000', 'https://nmamit.nitte.edu.in/', '40 LPA', '10 LPA'),
('jain-faculty-of-engineering-and-technology', 'Jain Faculty of Engineering and Technology', 'Bengaluru', '₹2,20,000', 'https://www.jainuniversity.ac.in/', '40 LPA', '10 LPA'),
('christ-university-faculty-of-engineering', 'Christ University Faculty of Engineering', 'Bengaluru', '₹2,20,000', 'https://christuniversity.in/engineering', '40 LPA', '10 LPA'),
('reva-university-school-of-engineering', 'Reva University School of Engineering', 'Bengaluru', '₹2,20,000', 'https://www.reva.edu.in/', '40 LPA', '10 LPA'),
('sjb-institute-of-technology', 'SJB Institute of Technology', 'Bengaluru', '₹1,80,000', 'https://sjbit.edu.in/', '28 LPA', '7 LPA'),
('rns-institute-of-technology', 'RNS Institute of Technology', 'Bengaluru', '₹1,80,000', 'https://www.rnsit.ac.in/', '28 LPA', '7 LPA'),
('cmr-institute-of-technology', 'CMR Institute of Technology', 'Bengaluru', '₹1,80,000', 'https://www.cmrit.ac.in/', '28 LPA', '7 LPA'),
('new-horizon-college-of-engineering', 'New Horizon College of Engineering', 'Bengaluru', '₹1,80,000', 'https://newhorizonindia.edu/nhengineering/', '28 LPA', '7 LPA'),
('nitte-meenakshi-institute-of-technology', 'Nitte Meenakshi Institute of Technology', 'Bengaluru', '₹1,80,000', 'https://www.nmit.ac.in/', '28 LPA', '7 LPA'),
('acharya-institute-of-technology', 'Acharya Institute of Technology', 'Bengaluru', '₹1,80,000', 'https://acharya.ac.in/ait/', '28 LPA', '7 LPA'),
('alliance-college-of-engineering-and-design', 'Alliance College of Engineering and Design', 'Bengaluru', '₹1,80,000', 'https://www.alliance.edu.in/', '28 LPA', '7 LPA'),
('presidency-university-school-of-engineering', 'Presidency University School of Engineering', 'Bengaluru', '₹1,80,000', 'https://presidencyuniversity.in/', '28 LPA', '7 LPA'),
('global-academy-of-technology', 'Global Academy of Technology', 'Bengaluru', '₹1,80,000', 'https://www.gat.ac.in/', '28 LPA', '7 LPA'),
('sapthagiri-college-of-engineering', 'Sapthagiri College of Engineering', 'Bengaluru', '₹1,80,000', 'https://www.sapthagiri.edu.in/', '28 LPA', '7 LPA'),
('pes-institute-of-technology-and-management', 'PES Institute of Technology and Management', 'Shivamogga', '₹1,80,000', 'https://pesitm.ac.in/', '28 LPA', '7 LPA'),
('jawaharlal-nehru-national-college-of-engineering', 'Jawaharlal Nehru National College of Engineering', 'Shivamogga', '₹1,80,000', 'https://www.jnnce.ac.in/', '28 LPA', '7 LPA'),
('sahyadri-college-of-engineering-and-management', 'Sahyadri College of Engineering and Management', 'Mangaluru', '₹1,80,000', 'https://sahyadri.edu.in/', '28 LPA', '7 LPA'),
('st-joseph-engineering-college-mangaluru', 'St Joseph Engineering College Mangaluru', 'Mangaluru', '₹1,80,000', 'https://www.sjec.ac.in/', '28 LPA', '7 LPA'),
('canara-engineering-college', 'Canara Engineering College', 'Mangaluru', '₹1,80,000', 'https://www.canaraengineering.in/', '28 LPA', '7 LPA'),
('alva-s-institute-of-engineering-and-technology', 'Alva''s Institute of Engineering and Technology', 'Moodbidri', '₹1,80,000', 'https://aiet.org.in/', '28 LPA', '7 LPA'),
('srinivas-institute-of-technology', 'Srinivas Institute of Technology', 'Mangaluru', '₹1,80,000', 'https://www.sitmng.ac.in/', '28 LPA', '7 LPA'),
('p-a-college-of-engineering', 'P.A. College of Engineering', 'Mangaluru', '₹1,80,000', 'https://www.pace.edu.in/', '28 LPA', '7 LPA'),
('yenepoya-institute-of-technology', 'Yenepoya Institute of Technology', 'Moodbidri', '₹1,80,000', 'https://www.yit.edu.in/', '28 LPA', '7 LPA'),
('sdm-college-of-engineering-and-technology', 'SDM College of Engineering and Technology', 'Dharwad', '₹1,80,000', 'https://www.sdm.ac.in/', '28 LPA', '7 LPA'),
('basaveshwar-engineering-college-bagalkot', 'Basaveshwar Engineering College Bagalkot', 'Bagalkot', '₹1,80,000', 'https://www.becbgk.edu/', '28 LPA', '7 LPA'),
('bapuji-institute-of-engineering-and-technology', 'Bapuji Institute of Engineering and Technology', 'Davangere', '₹1,80,000', 'https://bietdvg.edu/', '28 LPA', '7 LPA'),
('university-bdt-college-of-engineering', 'University BDT College of Engineering', 'Davangere', '₹1,80,000', 'https://ubdtce.org/', '28 LPA', '7 LPA'),
('ballari-institute-of-technology-and-management', 'Ballari Institute of Technology and Management', 'Ballari', '₹1,80,000', 'https://www.bits-bellary.org/', '28 LPA', '7 LPA'),
('rao-bahadur-y-mahabaleshwarappa-engineering-college', 'Rao Bahadur Y Mahabaleshwarappa Engineering College', 'Ballari', '₹1,80,000', 'https://rymec.in/', '28 LPA', '7 LPA'),
('poojya-doddappa-appa-college-of-engineering', 'Poojya Doddappa Appa College of Engineering', 'Kalaburagi', '₹1,80,000', 'https://pdaengg.com/', '28 LPA', '7 LPA'),
('kls-gogte-institute-of-technology', 'KLS Gogte Institute of Technology', 'Belagavi', '₹1,80,000', 'https://git.edu/', '28 LPA', '7 LPA'),
('angadi-institute-of-technology-and-management', 'Angadi Institute of Technology and Management', 'Belagavi', '₹1,80,000', 'https://aitmbelagavi.edu.in/', '28 LPA', '7 LPA'),
('maratha-mandal-engineering-college', 'Maratha Mandal Engineering College', 'Belagavi', '₹1,80,000', 'http://www.mmec.edu.in/', '28 LPA', '7 LPA'),
('guru-nanak-dev-engineering-college-bidar', 'Guru Nanak Dev Engineering College Bidar', 'Bidar', '₹1,80,000', 'https://gndecb.ac.in/', '28 LPA', '7 LPA'),
('khaja-banda-nawaz-college-of-engineering', 'Khaja Banda Nawaz College of Engineering', 'Kalaburagi', '₹1,80,000', 'https://kbnce.edu.in/', '28 LPA', '7 LPA'),
('sri-siddhartha-institute-of-technology', 'Sri Siddhartha Institute of Technology', 'Tumakuru', '₹1,80,000', 'https://ssit.edu.in/', '28 LPA', '7 LPA'),
('adichunchanagiri-institute-of-technology', 'Adichunchanagiri Institute of Technology', 'Chikkamagaluru', '₹1,80,000', 'https://www.acitechnology.in/', '28 LPA', '7 LPA'),
('gsss-institute-of-engineering-and-technology-for-women', 'GSSS Institute of Engineering and Technology for Women', 'Mysuru', '₹1,80,000', 'https://www.geethashishu.in/', '28 LPA', '7 LPA'),
('vidya-vikas-institute-of-engineering-and-technology', 'Vidya Vikas Institute of Engineering and Technology', 'Mysuru', '₹1,80,000', 'https://vviethmysore.in/', '28 LPA', '7 LPA'),
('maharaja-institute-of-technology-thandavapura', 'Maharaja Institute of Technology Thandavapura', 'Mysuru', '₹1,80,000', 'https://www.mitmysore.in/', '28 LPA', '7 LPA'),
('government-engineering-college-hassan', 'Government Engineering College Hassan', 'Hassan', '₹1,40,000', 'https://www.gechassan.ac.in/', '18 LPA', '5 LPA'),
('government-engineering-college-raichur', 'Government Engineering College Raichur', 'Raichur', '₹1,40,000', 'https://gecraichur.ac.in/', '18 LPA', '5 LPA'),
('government-engineering-college-ramanagara', 'Government Engineering College Ramanagara', 'Ramanagara', '₹1,40,000', 'https://gecr.in/', '18 LPA', '5 LPA'),
('government-engineering-college-chamarajanagar', 'Government Engineering College Chamarajanagar', 'Chamarajanagar', '₹1,40,000', 'https://geccj.ac.in/', '18 LPA', '5 LPA'),
('government-engineering-college-krishnarajpet', 'Government Engineering College Krishnarajpet', 'Mandya', '₹1,40,000', 'https://gecck.ac.in/', '18 LPA', '5 LPA'),
('sri-venkateshwara-college-of-engineering', 'Sri Venkateshwara College of Engineering', 'Bengaluru', '₹1,40,000', 'https://www.srivenkateshwara.org/', '18 LPA', '5 LPA'),
('jyothy-institute-of-technology', 'Jyothy Institute of Technology', 'Bengaluru', '₹1,40,000', 'https://jyothyit.ac.in/', '18 LPA', '5 LPA'),
('global-institute-of-management-and-technology', 'Global Institute of Management and Technology', 'Bengaluru', '₹1,40,000', 'https://www.gimt.co.in/', '18 LPA', '5 LPA'),
('hkbk-college-of-engineering', 'HKBK College of Engineering', 'Bengaluru', '₹1,40,000', 'https://hkbk.edu.in/', '18 LPA', '5 LPA'),
('mvj-college-of-engineering', 'MVJ College of Engineering', 'Bengaluru', '₹1,40,000', 'https://mvjce.edu.in/', '18 LPA', '5 LPA'),
('east-point-college-of-engineering-and-technology', 'East Point College of Engineering and Technology', 'Bengaluru', '₹1,40,000', 'https://epcet.edu.in/', '18 LPA', '5 LPA'),
('ks-institute-of-technology', 'KS Institute of Technology', 'Bengaluru', '₹1,40,000', 'https://www.ksit.ac.in/', '18 LPA', '5 LPA'),
('advanced-institute-of-technology', 'Advanced Institute of Technology', 'Bengaluru', '₹1,40,000', 'https://www.aiet.edu.in/', '18 LPA', '5 LPA'),
('amc-engineering-college', 'AMC Engineering College', 'Bengaluru', '₹1,40,000', 'https://www.amcgroup.edu.in/amec/', '18 LPA', '5 LPA'),
('atria-institute-of-technology', 'Atria Institute of Technology', 'Bengaluru', '₹1,40,000', 'https://atria.edu/', '18 LPA', '5 LPA'),
('cambridge-institute-of-technology', 'Cambridge Institute of Technology', 'Bengaluru', '₹1,40,000', 'https://www.cambridge.edu.in/', '18 LPA', '5 LPA'),
('don-bosco-institute-of-technology-bengaluru', 'Don Bosco Institute of Technology Bengaluru', 'Bengaluru', '₹1,40,000', 'https://www.dbit.co.in/', '18 LPA', '5 LPA'),
('brindavan-college-of-engineering', 'Brindavan College of Engineering', 'Bengaluru', '₹1,40,000', 'https://www.brindavancollege.com/', '18 LPA', '5 LPA'),
('btl-institute-of-technology', 'BTL Institute of Technology', 'Bengaluru', '₹1,40,000', 'https://btlit.ac.in/', '18 LPA', '5 LPA'),
('gopalan-college-of-engineering-and-management', 'Gopalan College of Engineering and Management', 'Bengaluru', '₹1,40,000', 'https://www.gopalancolleges.com/gcem/', '18 LPA', '5 LPA'),
('sri-sairam-college-of-engineering', 'Sri Sairam College of Engineering', 'Bengaluru', '₹1,40,000', 'https://sairamgroup.in/', '18 LPA', '5 LPA'),
('r-l-jalappa-institute-of-technology', 'R.L. Jalappa Institute of Technology', 'Doddaballapur', '₹1,40,000', 'https://rljit.ac.in/', '18 LPA', '5 LPA'),
('nagarjuna-college-of-engineering-and-technology', 'Nagarjuna College of Engineering and Technology', 'Bengaluru', '₹1,40,000', 'https://ncet.co.in/', '18 LPA', '5 LPA'),
('t-john-institute-of-technology', 'T. John Institute of Technology', 'Bengaluru', '₹1,40,000', 'https://www.tjohncollege.com/', '18 LPA', '5 LPA'),
('sri-revana-siddeshwara-institute-of-technology', 'Sri Revana Siddeshwara Institute of Technology', 'Bengaluru', '₹1,40,000', 'https://srsit.ac.in/', '18 LPA', '5 LPA'),
('kristu-jayanti-college-of-engineering-and-technology', 'Kristu Jayanti College of Engineering and Technology', 'Bengaluru', '₹1,40,000', 'https://kristujayanti.edu.in/', '18 LPA', '5 LPA'),
('oxford-college-of-engineering', 'Oxford College of Engineering', 'Bengaluru', '₹1,40,000', 'https://www.theoxford.edu/', '18 LPA', '5 LPA'),
('g-madegowda-institute-of-technology', 'G Madegowda Institute of Technology', 'Mandya', '₹1,40,000', 'https://gmitmandya.in/', '18 LPA', '5 LPA'),
('kalpataru-institute-of-technology', 'Kalpataru Institute of Technology', 'Tiptur', '₹1,40,000', 'https://kit.edu.in/', '18 LPA', '5 LPA'),
('jss-academy-of-technical-education-bengaluru', 'JSS Academy of Technical Education Bengaluru', 'Bengaluru', '₹1,40,000', 'https://jssateb.ac.in/', '18 LPA', '5 LPA'),
('government-engineering-college-haveri', 'Government Engineering College Haveri', 'Haveri', '₹1,40,000', 'https://gechaveri.ac.in/', '18 LPA', '5 LPA'),
('government-engineering-college-kushalnagar', 'Government Engineering College Kushalnagar', 'Kodagu', '₹1,40,000', 'https://geckodagu.ac.in/', '18 LPA', '5 LPA'),
('sjm-institute-of-technology', 'SJM Institute of Technology', 'Chitradurga', '₹1,40,000', 'https://sjmit.ac.in/', '18 LPA', '5 LPA'),
('bapuji-academy-of-management-and-research-engg', 'Bapuji Academy of Management and Research (Engg)', 'Davangere', '₹1,40,000', 'https://www.bapujiamr.org/', '18 LPA', '5 LPA'),
('navkis-college-of-engineering-hassan', 'Navkis College of Engineering Hassan', 'Hassan', '₹1,40,000', 'https://www.navkisce.in/', '18 LPA', '5 LPA'),
('rajarajeshwari-college-of-engineering', 'Rajarajeshwari College of Engineering', 'Bengaluru', '₹1,40,000', 'https://www.rrce.org/', '18 LPA', '5 LPA'),
('east-west-institute-of-technology', 'East West Institute of Technology', 'Bengaluru', '₹1,40,000', 'https://www.ewit.edu.in/', '18 LPA', '5 LPA'),
('bangalore-technological-institute', 'Bangalore Technological Institute', 'Bengaluru', '₹1,40,000', 'https://btibangalore.org/', '18 LPA', '5 LPA'),
('sri-krishna-institute-of-technology', 'Sri Krishna Institute of Technology', 'Bengaluru', '₹1,40,000', 'https://www.skit.org.in/', '18 LPA', '5 LPA'),
('acharaya-patashala-college-of-engineering', 'Acharaya Patashala College of Engineering', 'Bengaluru', '₹1,40,000', 'https://apsce.ac.in/', '18 LPA', '5 LPA'),
('government-engineering-college-gangavati', 'Government Engineering College Gangavati', 'Koppal', '₹1,40,000', 'https://gecgvt.ac.in/', '18 LPA', '5 LPA'),
('government-engineering-college-karwar', 'Government Engineering College Karwar', 'Uttara Kannada', '₹1,40,000', 'https://geckarwar.karnataka.gov.in/', '18 LPA', '5 LPA'),
('government-engineering-college-bharamasagara', 'Government Engineering College Bharamasagara', 'Chitradurga', '₹1,40,000', 'https://gecb.ac.in/', '18 LPA', '5 LPA'),
('sri-taralabalu-jagadguru-institute-of-technology', 'Sri Taralabalu Jagadguru Institute of Technology', 'Ranebennuru', '₹1,40,000', 'https://stjit.ac.in/', '18 LPA', '5 LPA'),
('anjuman-institute-of-technology-and-management', 'Anjuman Institute of Technology and Management', 'Bhatkal', '₹1,40,000', 'https://www.aitmbhatkal.edu.in/', '18 LPA', '5 LPA'),
('govt-engineering-college-krishnagiri-ksitm', 'Govt Engineering College Krishnagiri (KSITM)', 'Yadgir', '₹1,40,000', 'https://gecyadgir.ac.in/', '18 LPA', '5 LPA'),
('jain-institute-of-technology-davangere', 'Jain Institute of Technology Davangere', 'Davangere', '₹1,40,000', 'https://jitd.in/', '18 LPA', '5 LPA'),
('channabasaveshwara-institute-of-technology', 'Channabasaveshwara Institute of Technology', 'Gubbi', '₹1,40,000', 'https://www.cittumkur.org/', '18 LPA', '5 LPA'),
('pavana-college-of-engineering', 'Pavana College of Engineering', 'Kolar', '₹1,40,000', 'https://pavana.org/', '18 LPA', '5 LPA'),
('sri-krishna-school-of-engineering-and-management', 'Sri Krishna School of Engineering and Management', 'Bengaluru', '₹1,40,000', 'https://srikrisna.org/', '18 LPA', '5 LPA'),
('visvesvaraya-technological-university-regional-centre-kalaburagi', 'Visvesvaraya Technological University Regional Centre Kalaburagi', 'Kalaburagi', '₹1,40,000', 'https://vtu.ac.in/', '18 LPA', '5 LPA');

INSERT INTO branch_cutoffs (college_id, branch, category, cutoff)
SELECT c.id, 'CSE', 'GM', 1500 FROM colleges c WHERE c.slug = 'rv-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 2175 FROM colleges c WHERE c.slug = 'rv-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 2025 FROM colleges c WHERE c.slug = 'rv-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 1724 FROM colleges c WHERE c.slug = 'rv-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 1620 FROM colleges c WHERE c.slug = 'rv-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 2200 FROM colleges c WHERE c.slug = 'rv-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 3190 FROM colleges c WHERE c.slug = 'rv-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 2970 FROM colleges c WHERE c.slug = 'rv-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 2530 FROM colleges c WHERE c.slug = 'rv-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 2376 FROM colleges c WHERE c.slug = 'rv-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 3200 FROM colleges c WHERE c.slug = 'rv-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 4640 FROM colleges c WHERE c.slug = 'rv-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 4320 FROM colleges c WHERE c.slug = 'rv-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 3679 FROM colleges c WHERE c.slug = 'rv-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 3456 FROM colleges c WHERE c.slug = 'rv-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 2000 FROM colleges c WHERE c.slug = 'rv-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 2900 FROM colleges c WHERE c.slug = 'rv-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 2700 FROM colleges c WHERE c.slug = 'rv-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 2300 FROM colleges c WHERE c.slug = 'rv-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 2160 FROM colleges c WHERE c.slug = 'rv-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 9000 FROM colleges c WHERE c.slug = 'rv-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 13050 FROM colleges c WHERE c.slug = 'rv-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 12150 FROM colleges c WHERE c.slug = 'rv-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 10350 FROM colleges c WHERE c.slug = 'rv-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 9720 FROM colleges c WHERE c.slug = 'rv-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 2100 FROM colleges c WHERE c.slug = 'pes-university-rr-campus'
UNION ALL
SELECT c.id, 'CSE', 'SC', 3045 FROM colleges c WHERE c.slug = 'pes-university-rr-campus'
UNION ALL
SELECT c.id, 'CSE', 'ST', 2835 FROM colleges c WHERE c.slug = 'pes-university-rr-campus'
UNION ALL
SELECT c.id, 'CSE', '2A', 2415 FROM colleges c WHERE c.slug = 'pes-university-rr-campus'
UNION ALL
SELECT c.id, 'CSE', '3A', 2268 FROM colleges c WHERE c.slug = 'pes-university-rr-campus'
UNION ALL
SELECT c.id, 'ISE', 'GM', 2800 FROM colleges c WHERE c.slug = 'pes-university-rr-campus'
UNION ALL
SELECT c.id, 'ISE', 'SC', 4060 FROM colleges c WHERE c.slug = 'pes-university-rr-campus'
UNION ALL
SELECT c.id, 'ISE', 'ST', 3780 FROM colleges c WHERE c.slug = 'pes-university-rr-campus'
UNION ALL
SELECT c.id, 'ISE', '2A', 3219 FROM colleges c WHERE c.slug = 'pes-university-rr-campus'
UNION ALL
SELECT c.id, 'ISE', '3A', 3024 FROM colleges c WHERE c.slug = 'pes-university-rr-campus'
UNION ALL
SELECT c.id, 'ECE', 'GM', 3800 FROM colleges c WHERE c.slug = 'pes-university-rr-campus'
UNION ALL
SELECT c.id, 'ECE', 'SC', 5510 FROM colleges c WHERE c.slug = 'pes-university-rr-campus'
UNION ALL
SELECT c.id, 'ECE', 'ST', 5130 FROM colleges c WHERE c.slug = 'pes-university-rr-campus'
UNION ALL
SELECT c.id, 'ECE', '2A', 4370 FROM colleges c WHERE c.slug = 'pes-university-rr-campus'
UNION ALL
SELECT c.id, 'ECE', '3A', 4104 FROM colleges c WHERE c.slug = 'pes-university-rr-campus'
UNION ALL
SELECT c.id, 'AIML', 'GM', 2600 FROM colleges c WHERE c.slug = 'pes-university-rr-campus'
UNION ALL
SELECT c.id, 'AIML', 'SC', 3770 FROM colleges c WHERE c.slug = 'pes-university-rr-campus'
UNION ALL
SELECT c.id, 'AIML', 'ST', 3510 FROM colleges c WHERE c.slug = 'pes-university-rr-campus'
UNION ALL
SELECT c.id, 'AIML', '2A', 2989 FROM colleges c WHERE c.slug = 'pes-university-rr-campus'
UNION ALL
SELECT c.id, 'AIML', '3A', 2808 FROM colleges c WHERE c.slug = 'pes-university-rr-campus'
UNION ALL
SELECT c.id, 'ME', 'GM', 10800 FROM colleges c WHERE c.slug = 'pes-university-rr-campus'
UNION ALL
SELECT c.id, 'ME', 'SC', 15660 FROM colleges c WHERE c.slug = 'pes-university-rr-campus'
UNION ALL
SELECT c.id, 'ME', 'ST', 14580 FROM colleges c WHERE c.slug = 'pes-university-rr-campus'
UNION ALL
SELECT c.id, 'ME', '2A', 12419 FROM colleges c WHERE c.slug = 'pes-university-rr-campus'
UNION ALL
SELECT c.id, 'ME', '3A', 11664 FROM colleges c WHERE c.slug = 'pes-university-rr-campus'
UNION ALL
SELECT c.id, 'CSE', 'GM', 2700 FROM colleges c WHERE c.slug = 'bms-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 3915 FROM colleges c WHERE c.slug = 'bms-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 3645 FROM colleges c WHERE c.slug = 'bms-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 3104 FROM colleges c WHERE c.slug = 'bms-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 2916 FROM colleges c WHERE c.slug = 'bms-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 3400 FROM colleges c WHERE c.slug = 'bms-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 4930 FROM colleges c WHERE c.slug = 'bms-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 4590 FROM colleges c WHERE c.slug = 'bms-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 3909 FROM colleges c WHERE c.slug = 'bms-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 3672 FROM colleges c WHERE c.slug = 'bms-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 4400 FROM colleges c WHERE c.slug = 'bms-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 6380 FROM colleges c WHERE c.slug = 'bms-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 5940 FROM colleges c WHERE c.slug = 'bms-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 5060 FROM colleges c WHERE c.slug = 'bms-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 4752 FROM colleges c WHERE c.slug = 'bms-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 3200 FROM colleges c WHERE c.slug = 'bms-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 4640 FROM colleges c WHERE c.slug = 'bms-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 4320 FROM colleges c WHERE c.slug = 'bms-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 3679 FROM colleges c WHERE c.slug = 'bms-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 3456 FROM colleges c WHERE c.slug = 'bms-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 12600 FROM colleges c WHERE c.slug = 'bms-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 18270 FROM colleges c WHERE c.slug = 'bms-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 17010 FROM colleges c WHERE c.slug = 'bms-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 14489 FROM colleges c WHERE c.slug = 'bms-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 13608 FROM colleges c WHERE c.slug = 'bms-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 3300 FROM colleges c WHERE c.slug = 'm-s-ramaiah-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 4785 FROM colleges c WHERE c.slug = 'm-s-ramaiah-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 4455 FROM colleges c WHERE c.slug = 'm-s-ramaiah-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 3794 FROM colleges c WHERE c.slug = 'm-s-ramaiah-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 3564 FROM colleges c WHERE c.slug = 'm-s-ramaiah-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 4000 FROM colleges c WHERE c.slug = 'm-s-ramaiah-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 5800 FROM colleges c WHERE c.slug = 'm-s-ramaiah-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 5400 FROM colleges c WHERE c.slug = 'm-s-ramaiah-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 4600 FROM colleges c WHERE c.slug = 'm-s-ramaiah-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 4320 FROM colleges c WHERE c.slug = 'm-s-ramaiah-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 5000 FROM colleges c WHERE c.slug = 'm-s-ramaiah-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 7250 FROM colleges c WHERE c.slug = 'm-s-ramaiah-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 6750 FROM colleges c WHERE c.slug = 'm-s-ramaiah-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 5750 FROM colleges c WHERE c.slug = 'm-s-ramaiah-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 5400 FROM colleges c WHERE c.slug = 'm-s-ramaiah-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 3800 FROM colleges c WHERE c.slug = 'm-s-ramaiah-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 5510 FROM colleges c WHERE c.slug = 'm-s-ramaiah-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 5130 FROM colleges c WHERE c.slug = 'm-s-ramaiah-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 4370 FROM colleges c WHERE c.slug = 'm-s-ramaiah-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 4104 FROM colleges c WHERE c.slug = 'm-s-ramaiah-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 14400 FROM colleges c WHERE c.slug = 'm-s-ramaiah-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 20880 FROM colleges c WHERE c.slug = 'm-s-ramaiah-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 19440 FROM colleges c WHERE c.slug = 'm-s-ramaiah-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 16560 FROM colleges c WHERE c.slug = 'm-s-ramaiah-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 15552 FROM colleges c WHERE c.slug = 'm-s-ramaiah-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 3900 FROM colleges c WHERE c.slug = 'bangalore-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 5655 FROM colleges c WHERE c.slug = 'bangalore-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 5265 FROM colleges c WHERE c.slug = 'bangalore-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 4485 FROM colleges c WHERE c.slug = 'bangalore-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 4212 FROM colleges c WHERE c.slug = 'bangalore-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 4600 FROM colleges c WHERE c.slug = 'bangalore-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 6670 FROM colleges c WHERE c.slug = 'bangalore-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 6210 FROM colleges c WHERE c.slug = 'bangalore-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 5290 FROM colleges c WHERE c.slug = 'bangalore-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 4968 FROM colleges c WHERE c.slug = 'bangalore-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 5600 FROM colleges c WHERE c.slug = 'bangalore-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 8120 FROM colleges c WHERE c.slug = 'bangalore-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 7560 FROM colleges c WHERE c.slug = 'bangalore-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 6439 FROM colleges c WHERE c.slug = 'bangalore-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 6048 FROM colleges c WHERE c.slug = 'bangalore-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 4400 FROM colleges c WHERE c.slug = 'bangalore-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 6380 FROM colleges c WHERE c.slug = 'bangalore-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 5940 FROM colleges c WHERE c.slug = 'bangalore-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 5060 FROM colleges c WHERE c.slug = 'bangalore-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 4752 FROM colleges c WHERE c.slug = 'bangalore-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 16200 FROM colleges c WHERE c.slug = 'bangalore-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 23490 FROM colleges c WHERE c.slug = 'bangalore-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 21870 FROM colleges c WHERE c.slug = 'bangalore-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 18630 FROM colleges c WHERE c.slug = 'bangalore-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 17496 FROM colleges c WHERE c.slug = 'bangalore-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 1500 FROM colleges c WHERE c.slug = 'university-visvesvaraya-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 2175 FROM colleges c WHERE c.slug = 'university-visvesvaraya-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 2025 FROM colleges c WHERE c.slug = 'university-visvesvaraya-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 1724 FROM colleges c WHERE c.slug = 'university-visvesvaraya-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 1620 FROM colleges c WHERE c.slug = 'university-visvesvaraya-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 2200 FROM colleges c WHERE c.slug = 'university-visvesvaraya-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 3190 FROM colleges c WHERE c.slug = 'university-visvesvaraya-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 2970 FROM colleges c WHERE c.slug = 'university-visvesvaraya-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 2530 FROM colleges c WHERE c.slug = 'university-visvesvaraya-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 2376 FROM colleges c WHERE c.slug = 'university-visvesvaraya-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 3200 FROM colleges c WHERE c.slug = 'university-visvesvaraya-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 4640 FROM colleges c WHERE c.slug = 'university-visvesvaraya-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 4320 FROM colleges c WHERE c.slug = 'university-visvesvaraya-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 3679 FROM colleges c WHERE c.slug = 'university-visvesvaraya-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 3456 FROM colleges c WHERE c.slug = 'university-visvesvaraya-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 2000 FROM colleges c WHERE c.slug = 'university-visvesvaraya-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 2900 FROM colleges c WHERE c.slug = 'university-visvesvaraya-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 2700 FROM colleges c WHERE c.slug = 'university-visvesvaraya-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 2300 FROM colleges c WHERE c.slug = 'university-visvesvaraya-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 2160 FROM colleges c WHERE c.slug = 'university-visvesvaraya-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 9000 FROM colleges c WHERE c.slug = 'university-visvesvaraya-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 13050 FROM colleges c WHERE c.slug = 'university-visvesvaraya-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 12150 FROM colleges c WHERE c.slug = 'university-visvesvaraya-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 10350 FROM colleges c WHERE c.slug = 'university-visvesvaraya-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 9720 FROM colleges c WHERE c.slug = 'university-visvesvaraya-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 2100 FROM colleges c WHERE c.slug = 'jss-science-and-technology-university-sjce'
UNION ALL
SELECT c.id, 'CSE', 'SC', 3045 FROM colleges c WHERE c.slug = 'jss-science-and-technology-university-sjce'
UNION ALL
SELECT c.id, 'CSE', 'ST', 2835 FROM colleges c WHERE c.slug = 'jss-science-and-technology-university-sjce'
UNION ALL
SELECT c.id, 'CSE', '2A', 2415 FROM colleges c WHERE c.slug = 'jss-science-and-technology-university-sjce'
UNION ALL
SELECT c.id, 'CSE', '3A', 2268 FROM colleges c WHERE c.slug = 'jss-science-and-technology-university-sjce'
UNION ALL
SELECT c.id, 'ISE', 'GM', 2800 FROM colleges c WHERE c.slug = 'jss-science-and-technology-university-sjce'
UNION ALL
SELECT c.id, 'ISE', 'SC', 4060 FROM colleges c WHERE c.slug = 'jss-science-and-technology-university-sjce'
UNION ALL
SELECT c.id, 'ISE', 'ST', 3780 FROM colleges c WHERE c.slug = 'jss-science-and-technology-university-sjce'
UNION ALL
SELECT c.id, 'ISE', '2A', 3219 FROM colleges c WHERE c.slug = 'jss-science-and-technology-university-sjce'
UNION ALL
SELECT c.id, 'ISE', '3A', 3024 FROM colleges c WHERE c.slug = 'jss-science-and-technology-university-sjce'
UNION ALL
SELECT c.id, 'ECE', 'GM', 3800 FROM colleges c WHERE c.slug = 'jss-science-and-technology-university-sjce'
UNION ALL
SELECT c.id, 'ECE', 'SC', 5510 FROM colleges c WHERE c.slug = 'jss-science-and-technology-university-sjce'
UNION ALL
SELECT c.id, 'ECE', 'ST', 5130 FROM colleges c WHERE c.slug = 'jss-science-and-technology-university-sjce'
UNION ALL
SELECT c.id, 'ECE', '2A', 4370 FROM colleges c WHERE c.slug = 'jss-science-and-technology-university-sjce'
UNION ALL
SELECT c.id, 'ECE', '3A', 4104 FROM colleges c WHERE c.slug = 'jss-science-and-technology-university-sjce'
UNION ALL
SELECT c.id, 'AIML', 'GM', 2600 FROM colleges c WHERE c.slug = 'jss-science-and-technology-university-sjce'
UNION ALL
SELECT c.id, 'AIML', 'SC', 3770 FROM colleges c WHERE c.slug = 'jss-science-and-technology-university-sjce'
UNION ALL
SELECT c.id, 'AIML', 'ST', 3510 FROM colleges c WHERE c.slug = 'jss-science-and-technology-university-sjce'
UNION ALL
SELECT c.id, 'AIML', '2A', 2989 FROM colleges c WHERE c.slug = 'jss-science-and-technology-university-sjce'
UNION ALL
SELECT c.id, 'AIML', '3A', 2808 FROM colleges c WHERE c.slug = 'jss-science-and-technology-university-sjce'
UNION ALL
SELECT c.id, 'ME', 'GM', 10800 FROM colleges c WHERE c.slug = 'jss-science-and-technology-university-sjce'
UNION ALL
SELECT c.id, 'ME', 'SC', 15660 FROM colleges c WHERE c.slug = 'jss-science-and-technology-university-sjce'
UNION ALL
SELECT c.id, 'ME', 'ST', 14580 FROM colleges c WHERE c.slug = 'jss-science-and-technology-university-sjce'
UNION ALL
SELECT c.id, 'ME', '2A', 12419 FROM colleges c WHERE c.slug = 'jss-science-and-technology-university-sjce'
UNION ALL
SELECT c.id, 'ME', '3A', 11664 FROM colleges c WHERE c.slug = 'jss-science-and-technology-university-sjce'
UNION ALL
SELECT c.id, 'CSE', 'GM', 2700 FROM colleges c WHERE c.slug = 'national-institute-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 3915 FROM colleges c WHERE c.slug = 'national-institute-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 3645 FROM colleges c WHERE c.slug = 'national-institute-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 3104 FROM colleges c WHERE c.slug = 'national-institute-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 2916 FROM colleges c WHERE c.slug = 'national-institute-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 3400 FROM colleges c WHERE c.slug = 'national-institute-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 4930 FROM colleges c WHERE c.slug = 'national-institute-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 4590 FROM colleges c WHERE c.slug = 'national-institute-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 3909 FROM colleges c WHERE c.slug = 'national-institute-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 3672 FROM colleges c WHERE c.slug = 'national-institute-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 4400 FROM colleges c WHERE c.slug = 'national-institute-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 6380 FROM colleges c WHERE c.slug = 'national-institute-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 5940 FROM colleges c WHERE c.slug = 'national-institute-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 5060 FROM colleges c WHERE c.slug = 'national-institute-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 4752 FROM colleges c WHERE c.slug = 'national-institute-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 3200 FROM colleges c WHERE c.slug = 'national-institute-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 4640 FROM colleges c WHERE c.slug = 'national-institute-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 4320 FROM colleges c WHERE c.slug = 'national-institute-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 3679 FROM colleges c WHERE c.slug = 'national-institute-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 3456 FROM colleges c WHERE c.slug = 'national-institute-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 12600 FROM colleges c WHERE c.slug = 'national-institute-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 18270 FROM colleges c WHERE c.slug = 'national-institute-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 17010 FROM colleges c WHERE c.slug = 'national-institute-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 14489 FROM colleges c WHERE c.slug = 'national-institute-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 13608 FROM colleges c WHERE c.slug = 'national-institute-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 3300 FROM colleges c WHERE c.slug = 'manipal-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 4785 FROM colleges c WHERE c.slug = 'manipal-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 4455 FROM colleges c WHERE c.slug = 'manipal-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 3794 FROM colleges c WHERE c.slug = 'manipal-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 3564 FROM colleges c WHERE c.slug = 'manipal-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 4000 FROM colleges c WHERE c.slug = 'manipal-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 5800 FROM colleges c WHERE c.slug = 'manipal-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 5400 FROM colleges c WHERE c.slug = 'manipal-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 4600 FROM colleges c WHERE c.slug = 'manipal-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 4320 FROM colleges c WHERE c.slug = 'manipal-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 5000 FROM colleges c WHERE c.slug = 'manipal-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 7250 FROM colleges c WHERE c.slug = 'manipal-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 6750 FROM colleges c WHERE c.slug = 'manipal-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 5750 FROM colleges c WHERE c.slug = 'manipal-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 5400 FROM colleges c WHERE c.slug = 'manipal-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 3800 FROM colleges c WHERE c.slug = 'manipal-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 5510 FROM colleges c WHERE c.slug = 'manipal-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 5130 FROM colleges c WHERE c.slug = 'manipal-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 4370 FROM colleges c WHERE c.slug = 'manipal-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 4104 FROM colleges c WHERE c.slug = 'manipal-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 14400 FROM colleges c WHERE c.slug = 'manipal-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 20880 FROM colleges c WHERE c.slug = 'manipal-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 19440 FROM colleges c WHERE c.slug = 'manipal-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 16560 FROM colleges c WHERE c.slug = 'manipal-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 15552 FROM colleges c WHERE c.slug = 'manipal-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 3900 FROM colleges c WHERE c.slug = 'kle-technological-university-bvb'
UNION ALL
SELECT c.id, 'CSE', 'SC', 5655 FROM colleges c WHERE c.slug = 'kle-technological-university-bvb'
UNION ALL
SELECT c.id, 'CSE', 'ST', 5265 FROM colleges c WHERE c.slug = 'kle-technological-university-bvb'
UNION ALL
SELECT c.id, 'CSE', '2A', 4485 FROM colleges c WHERE c.slug = 'kle-technological-university-bvb'
UNION ALL
SELECT c.id, 'CSE', '3A', 4212 FROM colleges c WHERE c.slug = 'kle-technological-university-bvb'
UNION ALL
SELECT c.id, 'ISE', 'GM', 4600 FROM colleges c WHERE c.slug = 'kle-technological-university-bvb'
UNION ALL
SELECT c.id, 'ISE', 'SC', 6670 FROM colleges c WHERE c.slug = 'kle-technological-university-bvb'
UNION ALL
SELECT c.id, 'ISE', 'ST', 6210 FROM colleges c WHERE c.slug = 'kle-technological-university-bvb'
UNION ALL
SELECT c.id, 'ISE', '2A', 5290 FROM colleges c WHERE c.slug = 'kle-technological-university-bvb'
UNION ALL
SELECT c.id, 'ISE', '3A', 4968 FROM colleges c WHERE c.slug = 'kle-technological-university-bvb'
UNION ALL
SELECT c.id, 'ECE', 'GM', 5600 FROM colleges c WHERE c.slug = 'kle-technological-university-bvb'
UNION ALL
SELECT c.id, 'ECE', 'SC', 8120 FROM colleges c WHERE c.slug = 'kle-technological-university-bvb'
UNION ALL
SELECT c.id, 'ECE', 'ST', 7560 FROM colleges c WHERE c.slug = 'kle-technological-university-bvb'
UNION ALL
SELECT c.id, 'ECE', '2A', 6439 FROM colleges c WHERE c.slug = 'kle-technological-university-bvb'
UNION ALL
SELECT c.id, 'ECE', '3A', 6048 FROM colleges c WHERE c.slug = 'kle-technological-university-bvb'
UNION ALL
SELECT c.id, 'AIML', 'GM', 4400 FROM colleges c WHERE c.slug = 'kle-technological-university-bvb'
UNION ALL
SELECT c.id, 'AIML', 'SC', 6380 FROM colleges c WHERE c.slug = 'kle-technological-university-bvb'
UNION ALL
SELECT c.id, 'AIML', 'ST', 5940 FROM colleges c WHERE c.slug = 'kle-technological-university-bvb'
UNION ALL
SELECT c.id, 'AIML', '2A', 5060 FROM colleges c WHERE c.slug = 'kle-technological-university-bvb'
UNION ALL
SELECT c.id, 'AIML', '3A', 4752 FROM colleges c WHERE c.slug = 'kle-technological-university-bvb'
UNION ALL
SELECT c.id, 'ME', 'GM', 16200 FROM colleges c WHERE c.slug = 'kle-technological-university-bvb'
UNION ALL
SELECT c.id, 'ME', 'SC', 23490 FROM colleges c WHERE c.slug = 'kle-technological-university-bvb'
UNION ALL
SELECT c.id, 'ME', 'ST', 21870 FROM colleges c WHERE c.slug = 'kle-technological-university-bvb'
UNION ALL
SELECT c.id, 'ME', '2A', 18630 FROM colleges c WHERE c.slug = 'kle-technological-university-bvb'
UNION ALL
SELECT c.id, 'ME', '3A', 17496 FROM colleges c WHERE c.slug = 'kle-technological-university-bvb'
UNION ALL
SELECT c.id, 'CSE', 'GM', 1500 FROM colleges c WHERE c.slug = 'sri-jayachamarajendra-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 2175 FROM colleges c WHERE c.slug = 'sri-jayachamarajendra-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 2025 FROM colleges c WHERE c.slug = 'sri-jayachamarajendra-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 1724 FROM colleges c WHERE c.slug = 'sri-jayachamarajendra-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 1620 FROM colleges c WHERE c.slug = 'sri-jayachamarajendra-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 2200 FROM colleges c WHERE c.slug = 'sri-jayachamarajendra-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 3190 FROM colleges c WHERE c.slug = 'sri-jayachamarajendra-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 2970 FROM colleges c WHERE c.slug = 'sri-jayachamarajendra-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 2530 FROM colleges c WHERE c.slug = 'sri-jayachamarajendra-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 2376 FROM colleges c WHERE c.slug = 'sri-jayachamarajendra-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 3200 FROM colleges c WHERE c.slug = 'sri-jayachamarajendra-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 4640 FROM colleges c WHERE c.slug = 'sri-jayachamarajendra-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 4320 FROM colleges c WHERE c.slug = 'sri-jayachamarajendra-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 3679 FROM colleges c WHERE c.slug = 'sri-jayachamarajendra-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 3456 FROM colleges c WHERE c.slug = 'sri-jayachamarajendra-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 2000 FROM colleges c WHERE c.slug = 'sri-jayachamarajendra-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 2900 FROM colleges c WHERE c.slug = 'sri-jayachamarajendra-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 2700 FROM colleges c WHERE c.slug = 'sri-jayachamarajendra-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 2300 FROM colleges c WHERE c.slug = 'sri-jayachamarajendra-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 2160 FROM colleges c WHERE c.slug = 'sri-jayachamarajendra-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 9000 FROM colleges c WHERE c.slug = 'sri-jayachamarajendra-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 13050 FROM colleges c WHERE c.slug = 'sri-jayachamarajendra-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 12150 FROM colleges c WHERE c.slug = 'sri-jayachamarajendra-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 10350 FROM colleges c WHERE c.slug = 'sri-jayachamarajendra-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 9720 FROM colleges c WHERE c.slug = 'sri-jayachamarajendra-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 5100 FROM colleges c WHERE c.slug = 'pes-college-of-engineering-mandya'
UNION ALL
SELECT c.id, 'CSE', 'SC', 7395 FROM colleges c WHERE c.slug = 'pes-college-of-engineering-mandya'
UNION ALL
SELECT c.id, 'CSE', 'ST', 6885 FROM colleges c WHERE c.slug = 'pes-college-of-engineering-mandya'
UNION ALL
SELECT c.id, 'CSE', '2A', 5865 FROM colleges c WHERE c.slug = 'pes-college-of-engineering-mandya'
UNION ALL
SELECT c.id, 'CSE', '3A', 5508 FROM colleges c WHERE c.slug = 'pes-college-of-engineering-mandya'
UNION ALL
SELECT c.id, 'ISE', 'GM', 7100 FROM colleges c WHERE c.slug = 'pes-college-of-engineering-mandya'
UNION ALL
SELECT c.id, 'ISE', 'SC', 10295 FROM colleges c WHERE c.slug = 'pes-college-of-engineering-mandya'
UNION ALL
SELECT c.id, 'ISE', 'ST', 9585 FROM colleges c WHERE c.slug = 'pes-college-of-engineering-mandya'
UNION ALL
SELECT c.id, 'ISE', '2A', 8164 FROM colleges c WHERE c.slug = 'pes-college-of-engineering-mandya'
UNION ALL
SELECT c.id, 'ISE', '3A', 7668 FROM colleges c WHERE c.slug = 'pes-college-of-engineering-mandya'
UNION ALL
SELECT c.id, 'ECE', 'GM', 9600 FROM colleges c WHERE c.slug = 'pes-college-of-engineering-mandya'
UNION ALL
SELECT c.id, 'ECE', 'SC', 13920 FROM colleges c WHERE c.slug = 'pes-college-of-engineering-mandya'
UNION ALL
SELECT c.id, 'ECE', 'ST', 12960 FROM colleges c WHERE c.slug = 'pes-college-of-engineering-mandya'
UNION ALL
SELECT c.id, 'ECE', '2A', 11040 FROM colleges c WHERE c.slug = 'pes-college-of-engineering-mandya'
UNION ALL
SELECT c.id, 'ECE', '3A', 10368 FROM colleges c WHERE c.slug = 'pes-college-of-engineering-mandya'
UNION ALL
SELECT c.id, 'AIML', 'GM', 6100 FROM colleges c WHERE c.slug = 'pes-college-of-engineering-mandya'
UNION ALL
SELECT c.id, 'AIML', 'SC', 8845 FROM colleges c WHERE c.slug = 'pes-college-of-engineering-mandya'
UNION ALL
SELECT c.id, 'AIML', 'ST', 8235 FROM colleges c WHERE c.slug = 'pes-college-of-engineering-mandya'
UNION ALL
SELECT c.id, 'AIML', '2A', 7014 FROM colleges c WHERE c.slug = 'pes-college-of-engineering-mandya'
UNION ALL
SELECT c.id, 'AIML', '3A', 6588 FROM colleges c WHERE c.slug = 'pes-college-of-engineering-mandya'
UNION ALL
SELECT c.id, 'ME', 'GM', 16800 FROM colleges c WHERE c.slug = 'pes-college-of-engineering-mandya'
UNION ALL
SELECT c.id, 'ME', 'SC', 24360 FROM colleges c WHERE c.slug = 'pes-college-of-engineering-mandya'
UNION ALL
SELECT c.id, 'ME', 'ST', 22680 FROM colleges c WHERE c.slug = 'pes-college-of-engineering-mandya'
UNION ALL
SELECT c.id, 'ME', '2A', 19320 FROM colleges c WHERE c.slug = 'pes-college-of-engineering-mandya'
UNION ALL
SELECT c.id, 'ME', '3A', 18144 FROM colleges c WHERE c.slug = 'pes-college-of-engineering-mandya'
UNION ALL
SELECT c.id, 'CSE', 'GM', 5700 FROM colleges c WHERE c.slug = 'siddaganga-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 8265 FROM colleges c WHERE c.slug = 'siddaganga-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 7695 FROM colleges c WHERE c.slug = 'siddaganga-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 6554 FROM colleges c WHERE c.slug = 'siddaganga-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 6156 FROM colleges c WHERE c.slug = 'siddaganga-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 7700 FROM colleges c WHERE c.slug = 'siddaganga-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 11165 FROM colleges c WHERE c.slug = 'siddaganga-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 10395 FROM colleges c WHERE c.slug = 'siddaganga-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 8855 FROM colleges c WHERE c.slug = 'siddaganga-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 8316 FROM colleges c WHERE c.slug = 'siddaganga-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 10200 FROM colleges c WHERE c.slug = 'siddaganga-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 14790 FROM colleges c WHERE c.slug = 'siddaganga-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 13770 FROM colleges c WHERE c.slug = 'siddaganga-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 11730 FROM colleges c WHERE c.slug = 'siddaganga-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 11016 FROM colleges c WHERE c.slug = 'siddaganga-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 6700 FROM colleges c WHERE c.slug = 'siddaganga-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 9715 FROM colleges c WHERE c.slug = 'siddaganga-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 9045 FROM colleges c WHERE c.slug = 'siddaganga-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 7704 FROM colleges c WHERE c.slug = 'siddaganga-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 7236 FROM colleges c WHERE c.slug = 'siddaganga-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 18600 FROM colleges c WHERE c.slug = 'siddaganga-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 26970 FROM colleges c WHERE c.slug = 'siddaganga-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 25110 FROM colleges c WHERE c.slug = 'siddaganga-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 21390 FROM colleges c WHERE c.slug = 'siddaganga-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 20088 FROM colleges c WHERE c.slug = 'siddaganga-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 6300 FROM colleges c WHERE c.slug = 'malnad-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 9135 FROM colleges c WHERE c.slug = 'malnad-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 8505 FROM colleges c WHERE c.slug = 'malnad-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 7244 FROM colleges c WHERE c.slug = 'malnad-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 6804 FROM colleges c WHERE c.slug = 'malnad-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 8300 FROM colleges c WHERE c.slug = 'malnad-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 12035 FROM colleges c WHERE c.slug = 'malnad-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 11205 FROM colleges c WHERE c.slug = 'malnad-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 9545 FROM colleges c WHERE c.slug = 'malnad-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 8964 FROM colleges c WHERE c.slug = 'malnad-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 10800 FROM colleges c WHERE c.slug = 'malnad-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 15660 FROM colleges c WHERE c.slug = 'malnad-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 14580 FROM colleges c WHERE c.slug = 'malnad-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 12419 FROM colleges c WHERE c.slug = 'malnad-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 11664 FROM colleges c WHERE c.slug = 'malnad-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 7300 FROM colleges c WHERE c.slug = 'malnad-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 10585 FROM colleges c WHERE c.slug = 'malnad-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 9855 FROM colleges c WHERE c.slug = 'malnad-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 8395 FROM colleges c WHERE c.slug = 'malnad-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 7884 FROM colleges c WHERE c.slug = 'malnad-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 20400 FROM colleges c WHERE c.slug = 'malnad-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 29580 FROM colleges c WHERE c.slug = 'malnad-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 27540 FROM colleges c WHERE c.slug = 'malnad-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 23460 FROM colleges c WHERE c.slug = 'malnad-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 22032 FROM colleges c WHERE c.slug = 'malnad-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 6900 FROM colleges c WHERE c.slug = 'vidya-vardhaka-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 10005 FROM colleges c WHERE c.slug = 'vidya-vardhaka-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 9315 FROM colleges c WHERE c.slug = 'vidya-vardhaka-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 7934 FROM colleges c WHERE c.slug = 'vidya-vardhaka-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 7452 FROM colleges c WHERE c.slug = 'vidya-vardhaka-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 8900 FROM colleges c WHERE c.slug = 'vidya-vardhaka-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 12905 FROM colleges c WHERE c.slug = 'vidya-vardhaka-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 12015 FROM colleges c WHERE c.slug = 'vidya-vardhaka-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 10235 FROM colleges c WHERE c.slug = 'vidya-vardhaka-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 9612 FROM colleges c WHERE c.slug = 'vidya-vardhaka-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 11400 FROM colleges c WHERE c.slug = 'vidya-vardhaka-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 16530 FROM colleges c WHERE c.slug = 'vidya-vardhaka-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 15390 FROM colleges c WHERE c.slug = 'vidya-vardhaka-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 13109 FROM colleges c WHERE c.slug = 'vidya-vardhaka-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 12312 FROM colleges c WHERE c.slug = 'vidya-vardhaka-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 7900 FROM colleges c WHERE c.slug = 'vidya-vardhaka-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 11455 FROM colleges c WHERE c.slug = 'vidya-vardhaka-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 10665 FROM colleges c WHERE c.slug = 'vidya-vardhaka-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 9085 FROM colleges c WHERE c.slug = 'vidya-vardhaka-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 8532 FROM colleges c WHERE c.slug = 'vidya-vardhaka-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 22200 FROM colleges c WHERE c.slug = 'vidya-vardhaka-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 32190 FROM colleges c WHERE c.slug = 'vidya-vardhaka-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 29970 FROM colleges c WHERE c.slug = 'vidya-vardhaka-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 25529 FROM colleges c WHERE c.slug = 'vidya-vardhaka-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 23976 FROM colleges c WHERE c.slug = 'vidya-vardhaka-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 4500 FROM colleges c WHERE c.slug = 'dr-ambedkar-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 6525 FROM colleges c WHERE c.slug = 'dr-ambedkar-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 6075 FROM colleges c WHERE c.slug = 'dr-ambedkar-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 5175 FROM colleges c WHERE c.slug = 'dr-ambedkar-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 4860 FROM colleges c WHERE c.slug = 'dr-ambedkar-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 6500 FROM colleges c WHERE c.slug = 'dr-ambedkar-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 9425 FROM colleges c WHERE c.slug = 'dr-ambedkar-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 8775 FROM colleges c WHERE c.slug = 'dr-ambedkar-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 7474 FROM colleges c WHERE c.slug = 'dr-ambedkar-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 7020 FROM colleges c WHERE c.slug = 'dr-ambedkar-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 9000 FROM colleges c WHERE c.slug = 'dr-ambedkar-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 13050 FROM colleges c WHERE c.slug = 'dr-ambedkar-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 12150 FROM colleges c WHERE c.slug = 'dr-ambedkar-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 10350 FROM colleges c WHERE c.slug = 'dr-ambedkar-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 9720 FROM colleges c WHERE c.slug = 'dr-ambedkar-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 5500 FROM colleges c WHERE c.slug = 'dr-ambedkar-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 7975 FROM colleges c WHERE c.slug = 'dr-ambedkar-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 7425 FROM colleges c WHERE c.slug = 'dr-ambedkar-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 6324 FROM colleges c WHERE c.slug = 'dr-ambedkar-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 5940 FROM colleges c WHERE c.slug = 'dr-ambedkar-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 15000 FROM colleges c WHERE c.slug = 'dr-ambedkar-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 21750 FROM colleges c WHERE c.slug = 'dr-ambedkar-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 20250 FROM colleges c WHERE c.slug = 'dr-ambedkar-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 17250 FROM colleges c WHERE c.slug = 'dr-ambedkar-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 16200 FROM colleges c WHERE c.slug = 'dr-ambedkar-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 5100 FROM colleges c WHERE c.slug = 'bms-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'CSE', 'SC', 7395 FROM colleges c WHERE c.slug = 'bms-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'CSE', 'ST', 6885 FROM colleges c WHERE c.slug = 'bms-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'CSE', '2A', 5865 FROM colleges c WHERE c.slug = 'bms-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'CSE', '3A', 5508 FROM colleges c WHERE c.slug = 'bms-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ISE', 'GM', 7100 FROM colleges c WHERE c.slug = 'bms-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ISE', 'SC', 10295 FROM colleges c WHERE c.slug = 'bms-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ISE', 'ST', 9585 FROM colleges c WHERE c.slug = 'bms-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ISE', '2A', 8164 FROM colleges c WHERE c.slug = 'bms-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ISE', '3A', 7668 FROM colleges c WHERE c.slug = 'bms-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ECE', 'GM', 9600 FROM colleges c WHERE c.slug = 'bms-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ECE', 'SC', 13920 FROM colleges c WHERE c.slug = 'bms-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ECE', 'ST', 12960 FROM colleges c WHERE c.slug = 'bms-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ECE', '2A', 11040 FROM colleges c WHERE c.slug = 'bms-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ECE', '3A', 10368 FROM colleges c WHERE c.slug = 'bms-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'AIML', 'GM', 6100 FROM colleges c WHERE c.slug = 'bms-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'AIML', 'SC', 8845 FROM colleges c WHERE c.slug = 'bms-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'AIML', 'ST', 8235 FROM colleges c WHERE c.slug = 'bms-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'AIML', '2A', 7014 FROM colleges c WHERE c.slug = 'bms-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'AIML', '3A', 6588 FROM colleges c WHERE c.slug = 'bms-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ME', 'GM', 16800 FROM colleges c WHERE c.slug = 'bms-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ME', 'SC', 24360 FROM colleges c WHERE c.slug = 'bms-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ME', 'ST', 22680 FROM colleges c WHERE c.slug = 'bms-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ME', '2A', 19320 FROM colleges c WHERE c.slug = 'bms-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ME', '3A', 18144 FROM colleges c WHERE c.slug = 'bms-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'CSE', 'GM', 5700 FROM colleges c WHERE c.slug = 'dayananda-sagar-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 8265 FROM colleges c WHERE c.slug = 'dayananda-sagar-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 7695 FROM colleges c WHERE c.slug = 'dayananda-sagar-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 6554 FROM colleges c WHERE c.slug = 'dayananda-sagar-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 6156 FROM colleges c WHERE c.slug = 'dayananda-sagar-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 7700 FROM colleges c WHERE c.slug = 'dayananda-sagar-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 11165 FROM colleges c WHERE c.slug = 'dayananda-sagar-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 10395 FROM colleges c WHERE c.slug = 'dayananda-sagar-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 8855 FROM colleges c WHERE c.slug = 'dayananda-sagar-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 8316 FROM colleges c WHERE c.slug = 'dayananda-sagar-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 10200 FROM colleges c WHERE c.slug = 'dayananda-sagar-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 14790 FROM colleges c WHERE c.slug = 'dayananda-sagar-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 13770 FROM colleges c WHERE c.slug = 'dayananda-sagar-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 11730 FROM colleges c WHERE c.slug = 'dayananda-sagar-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 11016 FROM colleges c WHERE c.slug = 'dayananda-sagar-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 6700 FROM colleges c WHERE c.slug = 'dayananda-sagar-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 9715 FROM colleges c WHERE c.slug = 'dayananda-sagar-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 9045 FROM colleges c WHERE c.slug = 'dayananda-sagar-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 7704 FROM colleges c WHERE c.slug = 'dayananda-sagar-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 7236 FROM colleges c WHERE c.slug = 'dayananda-sagar-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 18600 FROM colleges c WHERE c.slug = 'dayananda-sagar-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 26970 FROM colleges c WHERE c.slug = 'dayananda-sagar-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 25110 FROM colleges c WHERE c.slug = 'dayananda-sagar-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 21390 FROM colleges c WHERE c.slug = 'dayananda-sagar-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 20088 FROM colleges c WHERE c.slug = 'dayananda-sagar-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 6300 FROM colleges c WHERE c.slug = 'sir-m-visvesvaraya-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 9135 FROM colleges c WHERE c.slug = 'sir-m-visvesvaraya-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 8505 FROM colleges c WHERE c.slug = 'sir-m-visvesvaraya-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 7244 FROM colleges c WHERE c.slug = 'sir-m-visvesvaraya-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 6804 FROM colleges c WHERE c.slug = 'sir-m-visvesvaraya-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 8300 FROM colleges c WHERE c.slug = 'sir-m-visvesvaraya-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 12035 FROM colleges c WHERE c.slug = 'sir-m-visvesvaraya-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 11205 FROM colleges c WHERE c.slug = 'sir-m-visvesvaraya-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 9545 FROM colleges c WHERE c.slug = 'sir-m-visvesvaraya-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 8964 FROM colleges c WHERE c.slug = 'sir-m-visvesvaraya-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 10800 FROM colleges c WHERE c.slug = 'sir-m-visvesvaraya-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 15660 FROM colleges c WHERE c.slug = 'sir-m-visvesvaraya-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 14580 FROM colleges c WHERE c.slug = 'sir-m-visvesvaraya-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 12419 FROM colleges c WHERE c.slug = 'sir-m-visvesvaraya-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 11664 FROM colleges c WHERE c.slug = 'sir-m-visvesvaraya-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 7300 FROM colleges c WHERE c.slug = 'sir-m-visvesvaraya-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 10585 FROM colleges c WHERE c.slug = 'sir-m-visvesvaraya-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 9855 FROM colleges c WHERE c.slug = 'sir-m-visvesvaraya-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 8395 FROM colleges c WHERE c.slug = 'sir-m-visvesvaraya-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 7884 FROM colleges c WHERE c.slug = 'sir-m-visvesvaraya-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 20400 FROM colleges c WHERE c.slug = 'sir-m-visvesvaraya-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 29580 FROM colleges c WHERE c.slug = 'sir-m-visvesvaraya-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 27540 FROM colleges c WHERE c.slug = 'sir-m-visvesvaraya-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 23460 FROM colleges c WHERE c.slug = 'sir-m-visvesvaraya-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 22032 FROM colleges c WHERE c.slug = 'sir-m-visvesvaraya-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 6900 FROM colleges c WHERE c.slug = 'nmam-institute-of-technology-nitte'
UNION ALL
SELECT c.id, 'CSE', 'SC', 10005 FROM colleges c WHERE c.slug = 'nmam-institute-of-technology-nitte'
UNION ALL
SELECT c.id, 'CSE', 'ST', 9315 FROM colleges c WHERE c.slug = 'nmam-institute-of-technology-nitte'
UNION ALL
SELECT c.id, 'CSE', '2A', 7934 FROM colleges c WHERE c.slug = 'nmam-institute-of-technology-nitte'
UNION ALL
SELECT c.id, 'CSE', '3A', 7452 FROM colleges c WHERE c.slug = 'nmam-institute-of-technology-nitte'
UNION ALL
SELECT c.id, 'ISE', 'GM', 8900 FROM colleges c WHERE c.slug = 'nmam-institute-of-technology-nitte'
UNION ALL
SELECT c.id, 'ISE', 'SC', 12905 FROM colleges c WHERE c.slug = 'nmam-institute-of-technology-nitte'
UNION ALL
SELECT c.id, 'ISE', 'ST', 12015 FROM colleges c WHERE c.slug = 'nmam-institute-of-technology-nitte'
UNION ALL
SELECT c.id, 'ISE', '2A', 10235 FROM colleges c WHERE c.slug = 'nmam-institute-of-technology-nitte'
UNION ALL
SELECT c.id, 'ISE', '3A', 9612 FROM colleges c WHERE c.slug = 'nmam-institute-of-technology-nitte'
UNION ALL
SELECT c.id, 'ECE', 'GM', 11400 FROM colleges c WHERE c.slug = 'nmam-institute-of-technology-nitte'
UNION ALL
SELECT c.id, 'ECE', 'SC', 16530 FROM colleges c WHERE c.slug = 'nmam-institute-of-technology-nitte'
UNION ALL
SELECT c.id, 'ECE', 'ST', 15390 FROM colleges c WHERE c.slug = 'nmam-institute-of-technology-nitte'
UNION ALL
SELECT c.id, 'ECE', '2A', 13109 FROM colleges c WHERE c.slug = 'nmam-institute-of-technology-nitte'
UNION ALL
SELECT c.id, 'ECE', '3A', 12312 FROM colleges c WHERE c.slug = 'nmam-institute-of-technology-nitte'
UNION ALL
SELECT c.id, 'AIML', 'GM', 7900 FROM colleges c WHERE c.slug = 'nmam-institute-of-technology-nitte'
UNION ALL
SELECT c.id, 'AIML', 'SC', 11455 FROM colleges c WHERE c.slug = 'nmam-institute-of-technology-nitte'
UNION ALL
SELECT c.id, 'AIML', 'ST', 10665 FROM colleges c WHERE c.slug = 'nmam-institute-of-technology-nitte'
UNION ALL
SELECT c.id, 'AIML', '2A', 9085 FROM colleges c WHERE c.slug = 'nmam-institute-of-technology-nitte'
UNION ALL
SELECT c.id, 'AIML', '3A', 8532 FROM colleges c WHERE c.slug = 'nmam-institute-of-technology-nitte'
UNION ALL
SELECT c.id, 'ME', 'GM', 22200 FROM colleges c WHERE c.slug = 'nmam-institute-of-technology-nitte'
UNION ALL
SELECT c.id, 'ME', 'SC', 32190 FROM colleges c WHERE c.slug = 'nmam-institute-of-technology-nitte'
UNION ALL
SELECT c.id, 'ME', 'ST', 29970 FROM colleges c WHERE c.slug = 'nmam-institute-of-technology-nitte'
UNION ALL
SELECT c.id, 'ME', '2A', 25529 FROM colleges c WHERE c.slug = 'nmam-institute-of-technology-nitte'
UNION ALL
SELECT c.id, 'ME', '3A', 23976 FROM colleges c WHERE c.slug = 'nmam-institute-of-technology-nitte'
UNION ALL
SELECT c.id, 'CSE', 'GM', 4500 FROM colleges c WHERE c.slug = 'jain-faculty-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 6525 FROM colleges c WHERE c.slug = 'jain-faculty-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 6075 FROM colleges c WHERE c.slug = 'jain-faculty-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 5175 FROM colleges c WHERE c.slug = 'jain-faculty-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 4860 FROM colleges c WHERE c.slug = 'jain-faculty-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 6500 FROM colleges c WHERE c.slug = 'jain-faculty-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 9425 FROM colleges c WHERE c.slug = 'jain-faculty-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 8775 FROM colleges c WHERE c.slug = 'jain-faculty-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 7474 FROM colleges c WHERE c.slug = 'jain-faculty-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 7020 FROM colleges c WHERE c.slug = 'jain-faculty-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 9000 FROM colleges c WHERE c.slug = 'jain-faculty-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 13050 FROM colleges c WHERE c.slug = 'jain-faculty-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 12150 FROM colleges c WHERE c.slug = 'jain-faculty-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 10350 FROM colleges c WHERE c.slug = 'jain-faculty-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 9720 FROM colleges c WHERE c.slug = 'jain-faculty-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 5500 FROM colleges c WHERE c.slug = 'jain-faculty-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 7975 FROM colleges c WHERE c.slug = 'jain-faculty-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 7425 FROM colleges c WHERE c.slug = 'jain-faculty-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 6324 FROM colleges c WHERE c.slug = 'jain-faculty-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 5940 FROM colleges c WHERE c.slug = 'jain-faculty-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 15000 FROM colleges c WHERE c.slug = 'jain-faculty-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 21750 FROM colleges c WHERE c.slug = 'jain-faculty-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 20250 FROM colleges c WHERE c.slug = 'jain-faculty-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 17250 FROM colleges c WHERE c.slug = 'jain-faculty-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 16200 FROM colleges c WHERE c.slug = 'jain-faculty-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 5100 FROM colleges c WHERE c.slug = 'christ-university-faculty-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 7395 FROM colleges c WHERE c.slug = 'christ-university-faculty-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 6885 FROM colleges c WHERE c.slug = 'christ-university-faculty-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 5865 FROM colleges c WHERE c.slug = 'christ-university-faculty-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 5508 FROM colleges c WHERE c.slug = 'christ-university-faculty-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 7100 FROM colleges c WHERE c.slug = 'christ-university-faculty-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 10295 FROM colleges c WHERE c.slug = 'christ-university-faculty-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 9585 FROM colleges c WHERE c.slug = 'christ-university-faculty-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 8164 FROM colleges c WHERE c.slug = 'christ-university-faculty-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 7668 FROM colleges c WHERE c.slug = 'christ-university-faculty-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 9600 FROM colleges c WHERE c.slug = 'christ-university-faculty-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 13920 FROM colleges c WHERE c.slug = 'christ-university-faculty-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 12960 FROM colleges c WHERE c.slug = 'christ-university-faculty-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 11040 FROM colleges c WHERE c.slug = 'christ-university-faculty-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 10368 FROM colleges c WHERE c.slug = 'christ-university-faculty-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 6100 FROM colleges c WHERE c.slug = 'christ-university-faculty-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 8845 FROM colleges c WHERE c.slug = 'christ-university-faculty-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 8235 FROM colleges c WHERE c.slug = 'christ-university-faculty-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 7014 FROM colleges c WHERE c.slug = 'christ-university-faculty-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 6588 FROM colleges c WHERE c.slug = 'christ-university-faculty-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 16800 FROM colleges c WHERE c.slug = 'christ-university-faculty-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 24360 FROM colleges c WHERE c.slug = 'christ-university-faculty-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 22680 FROM colleges c WHERE c.slug = 'christ-university-faculty-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 19320 FROM colleges c WHERE c.slug = 'christ-university-faculty-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 18144 FROM colleges c WHERE c.slug = 'christ-university-faculty-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 5700 FROM colleges c WHERE c.slug = 'reva-university-school-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 8265 FROM colleges c WHERE c.slug = 'reva-university-school-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 7695 FROM colleges c WHERE c.slug = 'reva-university-school-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 6554 FROM colleges c WHERE c.slug = 'reva-university-school-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 6156 FROM colleges c WHERE c.slug = 'reva-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 7700 FROM colleges c WHERE c.slug = 'reva-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 11165 FROM colleges c WHERE c.slug = 'reva-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 10395 FROM colleges c WHERE c.slug = 'reva-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 8855 FROM colleges c WHERE c.slug = 'reva-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 8316 FROM colleges c WHERE c.slug = 'reva-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 10200 FROM colleges c WHERE c.slug = 'reva-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 14790 FROM colleges c WHERE c.slug = 'reva-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 13770 FROM colleges c WHERE c.slug = 'reva-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 11730 FROM colleges c WHERE c.slug = 'reva-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 11016 FROM colleges c WHERE c.slug = 'reva-university-school-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 6700 FROM colleges c WHERE c.slug = 'reva-university-school-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 9715 FROM colleges c WHERE c.slug = 'reva-university-school-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 9045 FROM colleges c WHERE c.slug = 'reva-university-school-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 7704 FROM colleges c WHERE c.slug = 'reva-university-school-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 7236 FROM colleges c WHERE c.slug = 'reva-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 18600 FROM colleges c WHERE c.slug = 'reva-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 26970 FROM colleges c WHERE c.slug = 'reva-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 25110 FROM colleges c WHERE c.slug = 'reva-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 21390 FROM colleges c WHERE c.slug = 'reva-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 20088 FROM colleges c WHERE c.slug = 'reva-university-school-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 13800 FROM colleges c WHERE c.slug = 'sjb-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 20010 FROM colleges c WHERE c.slug = 'sjb-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 18630 FROM colleges c WHERE c.slug = 'sjb-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 15869 FROM colleges c WHERE c.slug = 'sjb-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 14904 FROM colleges c WHERE c.slug = 'sjb-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 18800 FROM colleges c WHERE c.slug = 'sjb-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 27260 FROM colleges c WHERE c.slug = 'sjb-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 25380 FROM colleges c WHERE c.slug = 'sjb-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 21620 FROM colleges c WHERE c.slug = 'sjb-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 20304 FROM colleges c WHERE c.slug = 'sjb-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 23800 FROM colleges c WHERE c.slug = 'sjb-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 34510 FROM colleges c WHERE c.slug = 'sjb-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 32130 FROM colleges c WHERE c.slug = 'sjb-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 27369 FROM colleges c WHERE c.slug = 'sjb-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 25704 FROM colleges c WHERE c.slug = 'sjb-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 15800 FROM colleges c WHERE c.slug = 'sjb-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 22910 FROM colleges c WHERE c.slug = 'sjb-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 21330 FROM colleges c WHERE c.slug = 'sjb-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 18170 FROM colleges c WHERE c.slug = 'sjb-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 17064 FROM colleges c WHERE c.slug = 'sjb-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 40400 FROM colleges c WHERE c.slug = 'sjb-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 58580 FROM colleges c WHERE c.slug = 'sjb-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 54540 FROM colleges c WHERE c.slug = 'sjb-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 46460 FROM colleges c WHERE c.slug = 'sjb-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 43632 FROM colleges c WHERE c.slug = 'sjb-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 14400 FROM colleges c WHERE c.slug = 'rns-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 20880 FROM colleges c WHERE c.slug = 'rns-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 19440 FROM colleges c WHERE c.slug = 'rns-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 16560 FROM colleges c WHERE c.slug = 'rns-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 15552 FROM colleges c WHERE c.slug = 'rns-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 19400 FROM colleges c WHERE c.slug = 'rns-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 28130 FROM colleges c WHERE c.slug = 'rns-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 26190 FROM colleges c WHERE c.slug = 'rns-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 22310 FROM colleges c WHERE c.slug = 'rns-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 20952 FROM colleges c WHERE c.slug = 'rns-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 24400 FROM colleges c WHERE c.slug = 'rns-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 35380 FROM colleges c WHERE c.slug = 'rns-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 32940 FROM colleges c WHERE c.slug = 'rns-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 28059 FROM colleges c WHERE c.slug = 'rns-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 26352 FROM colleges c WHERE c.slug = 'rns-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 16400 FROM colleges c WHERE c.slug = 'rns-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 23780 FROM colleges c WHERE c.slug = 'rns-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 22140 FROM colleges c WHERE c.slug = 'rns-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 18860 FROM colleges c WHERE c.slug = 'rns-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 17712 FROM colleges c WHERE c.slug = 'rns-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 42200 FROM colleges c WHERE c.slug = 'rns-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 61190 FROM colleges c WHERE c.slug = 'rns-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 56970 FROM colleges c WHERE c.slug = 'rns-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 48529 FROM colleges c WHERE c.slug = 'rns-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 45576 FROM colleges c WHERE c.slug = 'rns-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 12000 FROM colleges c WHERE c.slug = 'cmr-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 17400 FROM colleges c WHERE c.slug = 'cmr-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 16200 FROM colleges c WHERE c.slug = 'cmr-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 13799 FROM colleges c WHERE c.slug = 'cmr-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 12960 FROM colleges c WHERE c.slug = 'cmr-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 17000 FROM colleges c WHERE c.slug = 'cmr-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 24650 FROM colleges c WHERE c.slug = 'cmr-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 22950 FROM colleges c WHERE c.slug = 'cmr-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 19550 FROM colleges c WHERE c.slug = 'cmr-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 18360 FROM colleges c WHERE c.slug = 'cmr-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 22000 FROM colleges c WHERE c.slug = 'cmr-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 31900 FROM colleges c WHERE c.slug = 'cmr-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 29700 FROM colleges c WHERE c.slug = 'cmr-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 25299 FROM colleges c WHERE c.slug = 'cmr-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 23760 FROM colleges c WHERE c.slug = 'cmr-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 14000 FROM colleges c WHERE c.slug = 'cmr-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 20300 FROM colleges c WHERE c.slug = 'cmr-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 18900 FROM colleges c WHERE c.slug = 'cmr-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 16099 FROM colleges c WHERE c.slug = 'cmr-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 15120 FROM colleges c WHERE c.slug = 'cmr-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 35000 FROM colleges c WHERE c.slug = 'cmr-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 50750 FROM colleges c WHERE c.slug = 'cmr-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 47250 FROM colleges c WHERE c.slug = 'cmr-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 40250 FROM colleges c WHERE c.slug = 'cmr-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 37800 FROM colleges c WHERE c.slug = 'cmr-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 12600 FROM colleges c WHERE c.slug = 'new-horizon-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 18270 FROM colleges c WHERE c.slug = 'new-horizon-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 17010 FROM colleges c WHERE c.slug = 'new-horizon-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 14489 FROM colleges c WHERE c.slug = 'new-horizon-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 13608 FROM colleges c WHERE c.slug = 'new-horizon-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 17600 FROM colleges c WHERE c.slug = 'new-horizon-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 25520 FROM colleges c WHERE c.slug = 'new-horizon-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 23760 FROM colleges c WHERE c.slug = 'new-horizon-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 20240 FROM colleges c WHERE c.slug = 'new-horizon-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 19008 FROM colleges c WHERE c.slug = 'new-horizon-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 22600 FROM colleges c WHERE c.slug = 'new-horizon-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 32770 FROM colleges c WHERE c.slug = 'new-horizon-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 30510 FROM colleges c WHERE c.slug = 'new-horizon-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 25989 FROM colleges c WHERE c.slug = 'new-horizon-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 24408 FROM colleges c WHERE c.slug = 'new-horizon-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 14600 FROM colleges c WHERE c.slug = 'new-horizon-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 21170 FROM colleges c WHERE c.slug = 'new-horizon-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 19710 FROM colleges c WHERE c.slug = 'new-horizon-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 16790 FROM colleges c WHERE c.slug = 'new-horizon-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 15768 FROM colleges c WHERE c.slug = 'new-horizon-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 36800 FROM colleges c WHERE c.slug = 'new-horizon-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 53360 FROM colleges c WHERE c.slug = 'new-horizon-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 49680 FROM colleges c WHERE c.slug = 'new-horizon-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 42320 FROM colleges c WHERE c.slug = 'new-horizon-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 39744 FROM colleges c WHERE c.slug = 'new-horizon-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 13200 FROM colleges c WHERE c.slug = 'nitte-meenakshi-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 19140 FROM colleges c WHERE c.slug = 'nitte-meenakshi-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 17820 FROM colleges c WHERE c.slug = 'nitte-meenakshi-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 15179 FROM colleges c WHERE c.slug = 'nitte-meenakshi-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 14256 FROM colleges c WHERE c.slug = 'nitte-meenakshi-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 18200 FROM colleges c WHERE c.slug = 'nitte-meenakshi-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 26390 FROM colleges c WHERE c.slug = 'nitte-meenakshi-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 24570 FROM colleges c WHERE c.slug = 'nitte-meenakshi-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 20930 FROM colleges c WHERE c.slug = 'nitte-meenakshi-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 19656 FROM colleges c WHERE c.slug = 'nitte-meenakshi-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 23200 FROM colleges c WHERE c.slug = 'nitte-meenakshi-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 33640 FROM colleges c WHERE c.slug = 'nitte-meenakshi-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 31320 FROM colleges c WHERE c.slug = 'nitte-meenakshi-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 26679 FROM colleges c WHERE c.slug = 'nitte-meenakshi-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 25056 FROM colleges c WHERE c.slug = 'nitte-meenakshi-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 15200 FROM colleges c WHERE c.slug = 'nitte-meenakshi-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 22040 FROM colleges c WHERE c.slug = 'nitte-meenakshi-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 20520 FROM colleges c WHERE c.slug = 'nitte-meenakshi-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 17480 FROM colleges c WHERE c.slug = 'nitte-meenakshi-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 16416 FROM colleges c WHERE c.slug = 'nitte-meenakshi-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 38600 FROM colleges c WHERE c.slug = 'nitte-meenakshi-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 55970 FROM colleges c WHERE c.slug = 'nitte-meenakshi-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 52110 FROM colleges c WHERE c.slug = 'nitte-meenakshi-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 44390 FROM colleges c WHERE c.slug = 'nitte-meenakshi-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 41688 FROM colleges c WHERE c.slug = 'nitte-meenakshi-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 13800 FROM colleges c WHERE c.slug = 'acharya-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 20010 FROM colleges c WHERE c.slug = 'acharya-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 18630 FROM colleges c WHERE c.slug = 'acharya-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 15869 FROM colleges c WHERE c.slug = 'acharya-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 14904 FROM colleges c WHERE c.slug = 'acharya-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 18800 FROM colleges c WHERE c.slug = 'acharya-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 27260 FROM colleges c WHERE c.slug = 'acharya-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 25380 FROM colleges c WHERE c.slug = 'acharya-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 21620 FROM colleges c WHERE c.slug = 'acharya-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 20304 FROM colleges c WHERE c.slug = 'acharya-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 23800 FROM colleges c WHERE c.slug = 'acharya-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 34510 FROM colleges c WHERE c.slug = 'acharya-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 32130 FROM colleges c WHERE c.slug = 'acharya-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 27369 FROM colleges c WHERE c.slug = 'acharya-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 25704 FROM colleges c WHERE c.slug = 'acharya-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 15800 FROM colleges c WHERE c.slug = 'acharya-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 22910 FROM colleges c WHERE c.slug = 'acharya-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 21330 FROM colleges c WHERE c.slug = 'acharya-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 18170 FROM colleges c WHERE c.slug = 'acharya-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 17064 FROM colleges c WHERE c.slug = 'acharya-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 40400 FROM colleges c WHERE c.slug = 'acharya-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 58580 FROM colleges c WHERE c.slug = 'acharya-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 54540 FROM colleges c WHERE c.slug = 'acharya-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 46460 FROM colleges c WHERE c.slug = 'acharya-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 43632 FROM colleges c WHERE c.slug = 'acharya-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 14400 FROM colleges c WHERE c.slug = 'alliance-college-of-engineering-and-design'
UNION ALL
SELECT c.id, 'CSE', 'SC', 20880 FROM colleges c WHERE c.slug = 'alliance-college-of-engineering-and-design'
UNION ALL
SELECT c.id, 'CSE', 'ST', 19440 FROM colleges c WHERE c.slug = 'alliance-college-of-engineering-and-design'
UNION ALL
SELECT c.id, 'CSE', '2A', 16560 FROM colleges c WHERE c.slug = 'alliance-college-of-engineering-and-design'
UNION ALL
SELECT c.id, 'CSE', '3A', 15552 FROM colleges c WHERE c.slug = 'alliance-college-of-engineering-and-design'
UNION ALL
SELECT c.id, 'ISE', 'GM', 19400 FROM colleges c WHERE c.slug = 'alliance-college-of-engineering-and-design'
UNION ALL
SELECT c.id, 'ISE', 'SC', 28130 FROM colleges c WHERE c.slug = 'alliance-college-of-engineering-and-design'
UNION ALL
SELECT c.id, 'ISE', 'ST', 26190 FROM colleges c WHERE c.slug = 'alliance-college-of-engineering-and-design'
UNION ALL
SELECT c.id, 'ISE', '2A', 22310 FROM colleges c WHERE c.slug = 'alliance-college-of-engineering-and-design'
UNION ALL
SELECT c.id, 'ISE', '3A', 20952 FROM colleges c WHERE c.slug = 'alliance-college-of-engineering-and-design'
UNION ALL
SELECT c.id, 'ECE', 'GM', 24400 FROM colleges c WHERE c.slug = 'alliance-college-of-engineering-and-design'
UNION ALL
SELECT c.id, 'ECE', 'SC', 35380 FROM colleges c WHERE c.slug = 'alliance-college-of-engineering-and-design'
UNION ALL
SELECT c.id, 'ECE', 'ST', 32940 FROM colleges c WHERE c.slug = 'alliance-college-of-engineering-and-design'
UNION ALL
SELECT c.id, 'ECE', '2A', 28059 FROM colleges c WHERE c.slug = 'alliance-college-of-engineering-and-design'
UNION ALL
SELECT c.id, 'ECE', '3A', 26352 FROM colleges c WHERE c.slug = 'alliance-college-of-engineering-and-design'
UNION ALL
SELECT c.id, 'AIML', 'GM', 16400 FROM colleges c WHERE c.slug = 'alliance-college-of-engineering-and-design'
UNION ALL
SELECT c.id, 'AIML', 'SC', 23780 FROM colleges c WHERE c.slug = 'alliance-college-of-engineering-and-design'
UNION ALL
SELECT c.id, 'AIML', 'ST', 22140 FROM colleges c WHERE c.slug = 'alliance-college-of-engineering-and-design'
UNION ALL
SELECT c.id, 'AIML', '2A', 18860 FROM colleges c WHERE c.slug = 'alliance-college-of-engineering-and-design'
UNION ALL
SELECT c.id, 'AIML', '3A', 17712 FROM colleges c WHERE c.slug = 'alliance-college-of-engineering-and-design'
UNION ALL
SELECT c.id, 'ME', 'GM', 42200 FROM colleges c WHERE c.slug = 'alliance-college-of-engineering-and-design'
UNION ALL
SELECT c.id, 'ME', 'SC', 61190 FROM colleges c WHERE c.slug = 'alliance-college-of-engineering-and-design'
UNION ALL
SELECT c.id, 'ME', 'ST', 56970 FROM colleges c WHERE c.slug = 'alliance-college-of-engineering-and-design'
UNION ALL
SELECT c.id, 'ME', '2A', 48529 FROM colleges c WHERE c.slug = 'alliance-college-of-engineering-and-design'
UNION ALL
SELECT c.id, 'ME', '3A', 45576 FROM colleges c WHERE c.slug = 'alliance-college-of-engineering-and-design'
UNION ALL
SELECT c.id, 'CSE', 'GM', 12000 FROM colleges c WHERE c.slug = 'presidency-university-school-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 17400 FROM colleges c WHERE c.slug = 'presidency-university-school-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 16200 FROM colleges c WHERE c.slug = 'presidency-university-school-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 13799 FROM colleges c WHERE c.slug = 'presidency-university-school-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 12960 FROM colleges c WHERE c.slug = 'presidency-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 17000 FROM colleges c WHERE c.slug = 'presidency-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 24650 FROM colleges c WHERE c.slug = 'presidency-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 22950 FROM colleges c WHERE c.slug = 'presidency-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 19550 FROM colleges c WHERE c.slug = 'presidency-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 18360 FROM colleges c WHERE c.slug = 'presidency-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 22000 FROM colleges c WHERE c.slug = 'presidency-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 31900 FROM colleges c WHERE c.slug = 'presidency-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 29700 FROM colleges c WHERE c.slug = 'presidency-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 25299 FROM colleges c WHERE c.slug = 'presidency-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 23760 FROM colleges c WHERE c.slug = 'presidency-university-school-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 14000 FROM colleges c WHERE c.slug = 'presidency-university-school-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 20300 FROM colleges c WHERE c.slug = 'presidency-university-school-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 18900 FROM colleges c WHERE c.slug = 'presidency-university-school-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 16099 FROM colleges c WHERE c.slug = 'presidency-university-school-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 15120 FROM colleges c WHERE c.slug = 'presidency-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 35000 FROM colleges c WHERE c.slug = 'presidency-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 50750 FROM colleges c WHERE c.slug = 'presidency-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 47250 FROM colleges c WHERE c.slug = 'presidency-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 40250 FROM colleges c WHERE c.slug = 'presidency-university-school-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 37800 FROM colleges c WHERE c.slug = 'presidency-university-school-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 12600 FROM colleges c WHERE c.slug = 'global-academy-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 18270 FROM colleges c WHERE c.slug = 'global-academy-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 17010 FROM colleges c WHERE c.slug = 'global-academy-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 14489 FROM colleges c WHERE c.slug = 'global-academy-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 13608 FROM colleges c WHERE c.slug = 'global-academy-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 17600 FROM colleges c WHERE c.slug = 'global-academy-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 25520 FROM colleges c WHERE c.slug = 'global-academy-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 23760 FROM colleges c WHERE c.slug = 'global-academy-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 20240 FROM colleges c WHERE c.slug = 'global-academy-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 19008 FROM colleges c WHERE c.slug = 'global-academy-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 22600 FROM colleges c WHERE c.slug = 'global-academy-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 32770 FROM colleges c WHERE c.slug = 'global-academy-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 30510 FROM colleges c WHERE c.slug = 'global-academy-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 25989 FROM colleges c WHERE c.slug = 'global-academy-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 24408 FROM colleges c WHERE c.slug = 'global-academy-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 14600 FROM colleges c WHERE c.slug = 'global-academy-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 21170 FROM colleges c WHERE c.slug = 'global-academy-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 19710 FROM colleges c WHERE c.slug = 'global-academy-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 16790 FROM colleges c WHERE c.slug = 'global-academy-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 15768 FROM colleges c WHERE c.slug = 'global-academy-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 36800 FROM colleges c WHERE c.slug = 'global-academy-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 53360 FROM colleges c WHERE c.slug = 'global-academy-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 49680 FROM colleges c WHERE c.slug = 'global-academy-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 42320 FROM colleges c WHERE c.slug = 'global-academy-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 39744 FROM colleges c WHERE c.slug = 'global-academy-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 13200 FROM colleges c WHERE c.slug = 'sapthagiri-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 19140 FROM colleges c WHERE c.slug = 'sapthagiri-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 17820 FROM colleges c WHERE c.slug = 'sapthagiri-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 15179 FROM colleges c WHERE c.slug = 'sapthagiri-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 14256 FROM colleges c WHERE c.slug = 'sapthagiri-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 18200 FROM colleges c WHERE c.slug = 'sapthagiri-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 26390 FROM colleges c WHERE c.slug = 'sapthagiri-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 24570 FROM colleges c WHERE c.slug = 'sapthagiri-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 20930 FROM colleges c WHERE c.slug = 'sapthagiri-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 19656 FROM colleges c WHERE c.slug = 'sapthagiri-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 23200 FROM colleges c WHERE c.slug = 'sapthagiri-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 33640 FROM colleges c WHERE c.slug = 'sapthagiri-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 31320 FROM colleges c WHERE c.slug = 'sapthagiri-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 26679 FROM colleges c WHERE c.slug = 'sapthagiri-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 25056 FROM colleges c WHERE c.slug = 'sapthagiri-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 15200 FROM colleges c WHERE c.slug = 'sapthagiri-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 22040 FROM colleges c WHERE c.slug = 'sapthagiri-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 20520 FROM colleges c WHERE c.slug = 'sapthagiri-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 17480 FROM colleges c WHERE c.slug = 'sapthagiri-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 16416 FROM colleges c WHERE c.slug = 'sapthagiri-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 38600 FROM colleges c WHERE c.slug = 'sapthagiri-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 55970 FROM colleges c WHERE c.slug = 'sapthagiri-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 52110 FROM colleges c WHERE c.slug = 'sapthagiri-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 44390 FROM colleges c WHERE c.slug = 'sapthagiri-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 41688 FROM colleges c WHERE c.slug = 'sapthagiri-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 13800 FROM colleges c WHERE c.slug = 'pes-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'CSE', 'SC', 20010 FROM colleges c WHERE c.slug = 'pes-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'CSE', 'ST', 18630 FROM colleges c WHERE c.slug = 'pes-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'CSE', '2A', 15869 FROM colleges c WHERE c.slug = 'pes-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'CSE', '3A', 14904 FROM colleges c WHERE c.slug = 'pes-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ISE', 'GM', 18800 FROM colleges c WHERE c.slug = 'pes-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ISE', 'SC', 27260 FROM colleges c WHERE c.slug = 'pes-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ISE', 'ST', 25380 FROM colleges c WHERE c.slug = 'pes-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ISE', '2A', 21620 FROM colleges c WHERE c.slug = 'pes-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ISE', '3A', 20304 FROM colleges c WHERE c.slug = 'pes-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ECE', 'GM', 23800 FROM colleges c WHERE c.slug = 'pes-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ECE', 'SC', 34510 FROM colleges c WHERE c.slug = 'pes-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ECE', 'ST', 32130 FROM colleges c WHERE c.slug = 'pes-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ECE', '2A', 27369 FROM colleges c WHERE c.slug = 'pes-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ECE', '3A', 25704 FROM colleges c WHERE c.slug = 'pes-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'AIML', 'GM', 15800 FROM colleges c WHERE c.slug = 'pes-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'AIML', 'SC', 22910 FROM colleges c WHERE c.slug = 'pes-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'AIML', 'ST', 21330 FROM colleges c WHERE c.slug = 'pes-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'AIML', '2A', 18170 FROM colleges c WHERE c.slug = 'pes-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'AIML', '3A', 17064 FROM colleges c WHERE c.slug = 'pes-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ME', 'GM', 40400 FROM colleges c WHERE c.slug = 'pes-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ME', 'SC', 58580 FROM colleges c WHERE c.slug = 'pes-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ME', 'ST', 54540 FROM colleges c WHERE c.slug = 'pes-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ME', '2A', 46460 FROM colleges c WHERE c.slug = 'pes-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ME', '3A', 43632 FROM colleges c WHERE c.slug = 'pes-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'CSE', 'GM', 14400 FROM colleges c WHERE c.slug = 'jawaharlal-nehru-national-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 20880 FROM colleges c WHERE c.slug = 'jawaharlal-nehru-national-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 19440 FROM colleges c WHERE c.slug = 'jawaharlal-nehru-national-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 16560 FROM colleges c WHERE c.slug = 'jawaharlal-nehru-national-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 15552 FROM colleges c WHERE c.slug = 'jawaharlal-nehru-national-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 19400 FROM colleges c WHERE c.slug = 'jawaharlal-nehru-national-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 28130 FROM colleges c WHERE c.slug = 'jawaharlal-nehru-national-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 26190 FROM colleges c WHERE c.slug = 'jawaharlal-nehru-national-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 22310 FROM colleges c WHERE c.slug = 'jawaharlal-nehru-national-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 20952 FROM colleges c WHERE c.slug = 'jawaharlal-nehru-national-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 24400 FROM colleges c WHERE c.slug = 'jawaharlal-nehru-national-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 35380 FROM colleges c WHERE c.slug = 'jawaharlal-nehru-national-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 32940 FROM colleges c WHERE c.slug = 'jawaharlal-nehru-national-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 28059 FROM colleges c WHERE c.slug = 'jawaharlal-nehru-national-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 26352 FROM colleges c WHERE c.slug = 'jawaharlal-nehru-national-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 16400 FROM colleges c WHERE c.slug = 'jawaharlal-nehru-national-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 23780 FROM colleges c WHERE c.slug = 'jawaharlal-nehru-national-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 22140 FROM colleges c WHERE c.slug = 'jawaharlal-nehru-national-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 18860 FROM colleges c WHERE c.slug = 'jawaharlal-nehru-national-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 17712 FROM colleges c WHERE c.slug = 'jawaharlal-nehru-national-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 42200 FROM colleges c WHERE c.slug = 'jawaharlal-nehru-national-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 61190 FROM colleges c WHERE c.slug = 'jawaharlal-nehru-national-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 56970 FROM colleges c WHERE c.slug = 'jawaharlal-nehru-national-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 48529 FROM colleges c WHERE c.slug = 'jawaharlal-nehru-national-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 45576 FROM colleges c WHERE c.slug = 'jawaharlal-nehru-national-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 12000 FROM colleges c WHERE c.slug = 'sahyadri-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'CSE', 'SC', 17400 FROM colleges c WHERE c.slug = 'sahyadri-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'CSE', 'ST', 16200 FROM colleges c WHERE c.slug = 'sahyadri-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'CSE', '2A', 13799 FROM colleges c WHERE c.slug = 'sahyadri-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'CSE', '3A', 12960 FROM colleges c WHERE c.slug = 'sahyadri-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ISE', 'GM', 17000 FROM colleges c WHERE c.slug = 'sahyadri-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ISE', 'SC', 24650 FROM colleges c WHERE c.slug = 'sahyadri-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ISE', 'ST', 22950 FROM colleges c WHERE c.slug = 'sahyadri-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ISE', '2A', 19550 FROM colleges c WHERE c.slug = 'sahyadri-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ISE', '3A', 18360 FROM colleges c WHERE c.slug = 'sahyadri-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ECE', 'GM', 22000 FROM colleges c WHERE c.slug = 'sahyadri-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ECE', 'SC', 31900 FROM colleges c WHERE c.slug = 'sahyadri-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ECE', 'ST', 29700 FROM colleges c WHERE c.slug = 'sahyadri-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ECE', '2A', 25299 FROM colleges c WHERE c.slug = 'sahyadri-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ECE', '3A', 23760 FROM colleges c WHERE c.slug = 'sahyadri-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'AIML', 'GM', 14000 FROM colleges c WHERE c.slug = 'sahyadri-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'AIML', 'SC', 20300 FROM colleges c WHERE c.slug = 'sahyadri-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'AIML', 'ST', 18900 FROM colleges c WHERE c.slug = 'sahyadri-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'AIML', '2A', 16099 FROM colleges c WHERE c.slug = 'sahyadri-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'AIML', '3A', 15120 FROM colleges c WHERE c.slug = 'sahyadri-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ME', 'GM', 35000 FROM colleges c WHERE c.slug = 'sahyadri-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ME', 'SC', 50750 FROM colleges c WHERE c.slug = 'sahyadri-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ME', 'ST', 47250 FROM colleges c WHERE c.slug = 'sahyadri-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ME', '2A', 40250 FROM colleges c WHERE c.slug = 'sahyadri-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ME', '3A', 37800 FROM colleges c WHERE c.slug = 'sahyadri-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'CSE', 'GM', 12600 FROM colleges c WHERE c.slug = 'st-joseph-engineering-college-mangaluru'
UNION ALL
SELECT c.id, 'CSE', 'SC', 18270 FROM colleges c WHERE c.slug = 'st-joseph-engineering-college-mangaluru'
UNION ALL
SELECT c.id, 'CSE', 'ST', 17010 FROM colleges c WHERE c.slug = 'st-joseph-engineering-college-mangaluru'
UNION ALL
SELECT c.id, 'CSE', '2A', 14489 FROM colleges c WHERE c.slug = 'st-joseph-engineering-college-mangaluru'
UNION ALL
SELECT c.id, 'CSE', '3A', 13608 FROM colleges c WHERE c.slug = 'st-joseph-engineering-college-mangaluru'
UNION ALL
SELECT c.id, 'ISE', 'GM', 17600 FROM colleges c WHERE c.slug = 'st-joseph-engineering-college-mangaluru'
UNION ALL
SELECT c.id, 'ISE', 'SC', 25520 FROM colleges c WHERE c.slug = 'st-joseph-engineering-college-mangaluru'
UNION ALL
SELECT c.id, 'ISE', 'ST', 23760 FROM colleges c WHERE c.slug = 'st-joseph-engineering-college-mangaluru'
UNION ALL
SELECT c.id, 'ISE', '2A', 20240 FROM colleges c WHERE c.slug = 'st-joseph-engineering-college-mangaluru'
UNION ALL
SELECT c.id, 'ISE', '3A', 19008 FROM colleges c WHERE c.slug = 'st-joseph-engineering-college-mangaluru'
UNION ALL
SELECT c.id, 'ECE', 'GM', 22600 FROM colleges c WHERE c.slug = 'st-joseph-engineering-college-mangaluru'
UNION ALL
SELECT c.id, 'ECE', 'SC', 32770 FROM colleges c WHERE c.slug = 'st-joseph-engineering-college-mangaluru'
UNION ALL
SELECT c.id, 'ECE', 'ST', 30510 FROM colleges c WHERE c.slug = 'st-joseph-engineering-college-mangaluru'
UNION ALL
SELECT c.id, 'ECE', '2A', 25989 FROM colleges c WHERE c.slug = 'st-joseph-engineering-college-mangaluru'
UNION ALL
SELECT c.id, 'ECE', '3A', 24408 FROM colleges c WHERE c.slug = 'st-joseph-engineering-college-mangaluru'
UNION ALL
SELECT c.id, 'AIML', 'GM', 14600 FROM colleges c WHERE c.slug = 'st-joseph-engineering-college-mangaluru'
UNION ALL
SELECT c.id, 'AIML', 'SC', 21170 FROM colleges c WHERE c.slug = 'st-joseph-engineering-college-mangaluru'
UNION ALL
SELECT c.id, 'AIML', 'ST', 19710 FROM colleges c WHERE c.slug = 'st-joseph-engineering-college-mangaluru'
UNION ALL
SELECT c.id, 'AIML', '2A', 16790 FROM colleges c WHERE c.slug = 'st-joseph-engineering-college-mangaluru'
UNION ALL
SELECT c.id, 'AIML', '3A', 15768 FROM colleges c WHERE c.slug = 'st-joseph-engineering-college-mangaluru'
UNION ALL
SELECT c.id, 'ME', 'GM', 36800 FROM colleges c WHERE c.slug = 'st-joseph-engineering-college-mangaluru'
UNION ALL
SELECT c.id, 'ME', 'SC', 53360 FROM colleges c WHERE c.slug = 'st-joseph-engineering-college-mangaluru'
UNION ALL
SELECT c.id, 'ME', 'ST', 49680 FROM colleges c WHERE c.slug = 'st-joseph-engineering-college-mangaluru'
UNION ALL
SELECT c.id, 'ME', '2A', 42320 FROM colleges c WHERE c.slug = 'st-joseph-engineering-college-mangaluru'
UNION ALL
SELECT c.id, 'ME', '3A', 39744 FROM colleges c WHERE c.slug = 'st-joseph-engineering-college-mangaluru'
UNION ALL
SELECT c.id, 'CSE', 'GM', 13200 FROM colleges c WHERE c.slug = 'canara-engineering-college'
UNION ALL
SELECT c.id, 'CSE', 'SC', 19140 FROM colleges c WHERE c.slug = 'canara-engineering-college'
UNION ALL
SELECT c.id, 'CSE', 'ST', 17820 FROM colleges c WHERE c.slug = 'canara-engineering-college'
UNION ALL
SELECT c.id, 'CSE', '2A', 15179 FROM colleges c WHERE c.slug = 'canara-engineering-college'
UNION ALL
SELECT c.id, 'CSE', '3A', 14256 FROM colleges c WHERE c.slug = 'canara-engineering-college'
UNION ALL
SELECT c.id, 'ISE', 'GM', 18200 FROM colleges c WHERE c.slug = 'canara-engineering-college'
UNION ALL
SELECT c.id, 'ISE', 'SC', 26390 FROM colleges c WHERE c.slug = 'canara-engineering-college'
UNION ALL
SELECT c.id, 'ISE', 'ST', 24570 FROM colleges c WHERE c.slug = 'canara-engineering-college'
UNION ALL
SELECT c.id, 'ISE', '2A', 20930 FROM colleges c WHERE c.slug = 'canara-engineering-college'
UNION ALL
SELECT c.id, 'ISE', '3A', 19656 FROM colleges c WHERE c.slug = 'canara-engineering-college'
UNION ALL
SELECT c.id, 'ECE', 'GM', 23200 FROM colleges c WHERE c.slug = 'canara-engineering-college'
UNION ALL
SELECT c.id, 'ECE', 'SC', 33640 FROM colleges c WHERE c.slug = 'canara-engineering-college'
UNION ALL
SELECT c.id, 'ECE', 'ST', 31320 FROM colleges c WHERE c.slug = 'canara-engineering-college'
UNION ALL
SELECT c.id, 'ECE', '2A', 26679 FROM colleges c WHERE c.slug = 'canara-engineering-college'
UNION ALL
SELECT c.id, 'ECE', '3A', 25056 FROM colleges c WHERE c.slug = 'canara-engineering-college'
UNION ALL
SELECT c.id, 'AIML', 'GM', 15200 FROM colleges c WHERE c.slug = 'canara-engineering-college'
UNION ALL
SELECT c.id, 'AIML', 'SC', 22040 FROM colleges c WHERE c.slug = 'canara-engineering-college'
UNION ALL
SELECT c.id, 'AIML', 'ST', 20520 FROM colleges c WHERE c.slug = 'canara-engineering-college'
UNION ALL
SELECT c.id, 'AIML', '2A', 17480 FROM colleges c WHERE c.slug = 'canara-engineering-college'
UNION ALL
SELECT c.id, 'AIML', '3A', 16416 FROM colleges c WHERE c.slug = 'canara-engineering-college'
UNION ALL
SELECT c.id, 'ME', 'GM', 38600 FROM colleges c WHERE c.slug = 'canara-engineering-college'
UNION ALL
SELECT c.id, 'ME', 'SC', 55970 FROM colleges c WHERE c.slug = 'canara-engineering-college'
UNION ALL
SELECT c.id, 'ME', 'ST', 52110 FROM colleges c WHERE c.slug = 'canara-engineering-college'
UNION ALL
SELECT c.id, 'ME', '2A', 44390 FROM colleges c WHERE c.slug = 'canara-engineering-college'
UNION ALL
SELECT c.id, 'ME', '3A', 41688 FROM colleges c WHERE c.slug = 'canara-engineering-college'
UNION ALL
SELECT c.id, 'CSE', 'GM', 13800 FROM colleges c WHERE c.slug = 'alva-s-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 20010 FROM colleges c WHERE c.slug = 'alva-s-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 18630 FROM colleges c WHERE c.slug = 'alva-s-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 15869 FROM colleges c WHERE c.slug = 'alva-s-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 14904 FROM colleges c WHERE c.slug = 'alva-s-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 18800 FROM colleges c WHERE c.slug = 'alva-s-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 27260 FROM colleges c WHERE c.slug = 'alva-s-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 25380 FROM colleges c WHERE c.slug = 'alva-s-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 21620 FROM colleges c WHERE c.slug = 'alva-s-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 20304 FROM colleges c WHERE c.slug = 'alva-s-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 23800 FROM colleges c WHERE c.slug = 'alva-s-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 34510 FROM colleges c WHERE c.slug = 'alva-s-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 32130 FROM colleges c WHERE c.slug = 'alva-s-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 27369 FROM colleges c WHERE c.slug = 'alva-s-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 25704 FROM colleges c WHERE c.slug = 'alva-s-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 15800 FROM colleges c WHERE c.slug = 'alva-s-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 22910 FROM colleges c WHERE c.slug = 'alva-s-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 21330 FROM colleges c WHERE c.slug = 'alva-s-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 18170 FROM colleges c WHERE c.slug = 'alva-s-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 17064 FROM colleges c WHERE c.slug = 'alva-s-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 40400 FROM colleges c WHERE c.slug = 'alva-s-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 58580 FROM colleges c WHERE c.slug = 'alva-s-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 54540 FROM colleges c WHERE c.slug = 'alva-s-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 46460 FROM colleges c WHERE c.slug = 'alva-s-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 43632 FROM colleges c WHERE c.slug = 'alva-s-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 14400 FROM colleges c WHERE c.slug = 'srinivas-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 20880 FROM colleges c WHERE c.slug = 'srinivas-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 19440 FROM colleges c WHERE c.slug = 'srinivas-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 16560 FROM colleges c WHERE c.slug = 'srinivas-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 15552 FROM colleges c WHERE c.slug = 'srinivas-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 19400 FROM colleges c WHERE c.slug = 'srinivas-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 28130 FROM colleges c WHERE c.slug = 'srinivas-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 26190 FROM colleges c WHERE c.slug = 'srinivas-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 22310 FROM colleges c WHERE c.slug = 'srinivas-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 20952 FROM colleges c WHERE c.slug = 'srinivas-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 24400 FROM colleges c WHERE c.slug = 'srinivas-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 35380 FROM colleges c WHERE c.slug = 'srinivas-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 32940 FROM colleges c WHERE c.slug = 'srinivas-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 28059 FROM colleges c WHERE c.slug = 'srinivas-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 26352 FROM colleges c WHERE c.slug = 'srinivas-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 16400 FROM colleges c WHERE c.slug = 'srinivas-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 23780 FROM colleges c WHERE c.slug = 'srinivas-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 22140 FROM colleges c WHERE c.slug = 'srinivas-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 18860 FROM colleges c WHERE c.slug = 'srinivas-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 17712 FROM colleges c WHERE c.slug = 'srinivas-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 42200 FROM colleges c WHERE c.slug = 'srinivas-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 61190 FROM colleges c WHERE c.slug = 'srinivas-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 56970 FROM colleges c WHERE c.slug = 'srinivas-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 48529 FROM colleges c WHERE c.slug = 'srinivas-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 45576 FROM colleges c WHERE c.slug = 'srinivas-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 12000 FROM colleges c WHERE c.slug = 'p-a-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 17400 FROM colleges c WHERE c.slug = 'p-a-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 16200 FROM colleges c WHERE c.slug = 'p-a-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 13799 FROM colleges c WHERE c.slug = 'p-a-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 12960 FROM colleges c WHERE c.slug = 'p-a-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 17000 FROM colleges c WHERE c.slug = 'p-a-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 24650 FROM colleges c WHERE c.slug = 'p-a-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 22950 FROM colleges c WHERE c.slug = 'p-a-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 19550 FROM colleges c WHERE c.slug = 'p-a-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 18360 FROM colleges c WHERE c.slug = 'p-a-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 22000 FROM colleges c WHERE c.slug = 'p-a-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 31900 FROM colleges c WHERE c.slug = 'p-a-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 29700 FROM colleges c WHERE c.slug = 'p-a-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 25299 FROM colleges c WHERE c.slug = 'p-a-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 23760 FROM colleges c WHERE c.slug = 'p-a-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 14000 FROM colleges c WHERE c.slug = 'p-a-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 20300 FROM colleges c WHERE c.slug = 'p-a-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 18900 FROM colleges c WHERE c.slug = 'p-a-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 16099 FROM colleges c WHERE c.slug = 'p-a-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 15120 FROM colleges c WHERE c.slug = 'p-a-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 35000 FROM colleges c WHERE c.slug = 'p-a-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 50750 FROM colleges c WHERE c.slug = 'p-a-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 47250 FROM colleges c WHERE c.slug = 'p-a-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 40250 FROM colleges c WHERE c.slug = 'p-a-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 37800 FROM colleges c WHERE c.slug = 'p-a-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 12600 FROM colleges c WHERE c.slug = 'yenepoya-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 18270 FROM colleges c WHERE c.slug = 'yenepoya-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 17010 FROM colleges c WHERE c.slug = 'yenepoya-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 14489 FROM colleges c WHERE c.slug = 'yenepoya-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 13608 FROM colleges c WHERE c.slug = 'yenepoya-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 17600 FROM colleges c WHERE c.slug = 'yenepoya-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 25520 FROM colleges c WHERE c.slug = 'yenepoya-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 23760 FROM colleges c WHERE c.slug = 'yenepoya-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 20240 FROM colleges c WHERE c.slug = 'yenepoya-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 19008 FROM colleges c WHERE c.slug = 'yenepoya-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 22600 FROM colleges c WHERE c.slug = 'yenepoya-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 32770 FROM colleges c WHERE c.slug = 'yenepoya-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 30510 FROM colleges c WHERE c.slug = 'yenepoya-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 25989 FROM colleges c WHERE c.slug = 'yenepoya-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 24408 FROM colleges c WHERE c.slug = 'yenepoya-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 14600 FROM colleges c WHERE c.slug = 'yenepoya-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 21170 FROM colleges c WHERE c.slug = 'yenepoya-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 19710 FROM colleges c WHERE c.slug = 'yenepoya-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 16790 FROM colleges c WHERE c.slug = 'yenepoya-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 15768 FROM colleges c WHERE c.slug = 'yenepoya-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 36800 FROM colleges c WHERE c.slug = 'yenepoya-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 53360 FROM colleges c WHERE c.slug = 'yenepoya-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 49680 FROM colleges c WHERE c.slug = 'yenepoya-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 42320 FROM colleges c WHERE c.slug = 'yenepoya-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 39744 FROM colleges c WHERE c.slug = 'yenepoya-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 13200 FROM colleges c WHERE c.slug = 'sdm-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 19140 FROM colleges c WHERE c.slug = 'sdm-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 17820 FROM colleges c WHERE c.slug = 'sdm-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 15179 FROM colleges c WHERE c.slug = 'sdm-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 14256 FROM colleges c WHERE c.slug = 'sdm-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 18200 FROM colleges c WHERE c.slug = 'sdm-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 26390 FROM colleges c WHERE c.slug = 'sdm-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 24570 FROM colleges c WHERE c.slug = 'sdm-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 20930 FROM colleges c WHERE c.slug = 'sdm-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 19656 FROM colleges c WHERE c.slug = 'sdm-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 23200 FROM colleges c WHERE c.slug = 'sdm-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 33640 FROM colleges c WHERE c.slug = 'sdm-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 31320 FROM colleges c WHERE c.slug = 'sdm-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 26679 FROM colleges c WHERE c.slug = 'sdm-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 25056 FROM colleges c WHERE c.slug = 'sdm-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 15200 FROM colleges c WHERE c.slug = 'sdm-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 22040 FROM colleges c WHERE c.slug = 'sdm-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 20520 FROM colleges c WHERE c.slug = 'sdm-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 17480 FROM colleges c WHERE c.slug = 'sdm-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 16416 FROM colleges c WHERE c.slug = 'sdm-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 38600 FROM colleges c WHERE c.slug = 'sdm-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 55970 FROM colleges c WHERE c.slug = 'sdm-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 52110 FROM colleges c WHERE c.slug = 'sdm-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 44390 FROM colleges c WHERE c.slug = 'sdm-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 41688 FROM colleges c WHERE c.slug = 'sdm-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 13800 FROM colleges c WHERE c.slug = 'basaveshwar-engineering-college-bagalkot'
UNION ALL
SELECT c.id, 'CSE', 'SC', 20010 FROM colleges c WHERE c.slug = 'basaveshwar-engineering-college-bagalkot'
UNION ALL
SELECT c.id, 'CSE', 'ST', 18630 FROM colleges c WHERE c.slug = 'basaveshwar-engineering-college-bagalkot'
UNION ALL
SELECT c.id, 'CSE', '2A', 15869 FROM colleges c WHERE c.slug = 'basaveshwar-engineering-college-bagalkot'
UNION ALL
SELECT c.id, 'CSE', '3A', 14904 FROM colleges c WHERE c.slug = 'basaveshwar-engineering-college-bagalkot'
UNION ALL
SELECT c.id, 'ISE', 'GM', 18800 FROM colleges c WHERE c.slug = 'basaveshwar-engineering-college-bagalkot'
UNION ALL
SELECT c.id, 'ISE', 'SC', 27260 FROM colleges c WHERE c.slug = 'basaveshwar-engineering-college-bagalkot'
UNION ALL
SELECT c.id, 'ISE', 'ST', 25380 FROM colleges c WHERE c.slug = 'basaveshwar-engineering-college-bagalkot'
UNION ALL
SELECT c.id, 'ISE', '2A', 21620 FROM colleges c WHERE c.slug = 'basaveshwar-engineering-college-bagalkot'
UNION ALL
SELECT c.id, 'ISE', '3A', 20304 FROM colleges c WHERE c.slug = 'basaveshwar-engineering-college-bagalkot'
UNION ALL
SELECT c.id, 'ECE', 'GM', 23800 FROM colleges c WHERE c.slug = 'basaveshwar-engineering-college-bagalkot'
UNION ALL
SELECT c.id, 'ECE', 'SC', 34510 FROM colleges c WHERE c.slug = 'basaveshwar-engineering-college-bagalkot'
UNION ALL
SELECT c.id, 'ECE', 'ST', 32130 FROM colleges c WHERE c.slug = 'basaveshwar-engineering-college-bagalkot'
UNION ALL
SELECT c.id, 'ECE', '2A', 27369 FROM colleges c WHERE c.slug = 'basaveshwar-engineering-college-bagalkot'
UNION ALL
SELECT c.id, 'ECE', '3A', 25704 FROM colleges c WHERE c.slug = 'basaveshwar-engineering-college-bagalkot'
UNION ALL
SELECT c.id, 'AIML', 'GM', 15800 FROM colleges c WHERE c.slug = 'basaveshwar-engineering-college-bagalkot'
UNION ALL
SELECT c.id, 'AIML', 'SC', 22910 FROM colleges c WHERE c.slug = 'basaveshwar-engineering-college-bagalkot'
UNION ALL
SELECT c.id, 'AIML', 'ST', 21330 FROM colleges c WHERE c.slug = 'basaveshwar-engineering-college-bagalkot'
UNION ALL
SELECT c.id, 'AIML', '2A', 18170 FROM colleges c WHERE c.slug = 'basaveshwar-engineering-college-bagalkot'
UNION ALL
SELECT c.id, 'AIML', '3A', 17064 FROM colleges c WHERE c.slug = 'basaveshwar-engineering-college-bagalkot'
UNION ALL
SELECT c.id, 'ME', 'GM', 40400 FROM colleges c WHERE c.slug = 'basaveshwar-engineering-college-bagalkot'
UNION ALL
SELECT c.id, 'ME', 'SC', 58580 FROM colleges c WHERE c.slug = 'basaveshwar-engineering-college-bagalkot'
UNION ALL
SELECT c.id, 'ME', 'ST', 54540 FROM colleges c WHERE c.slug = 'basaveshwar-engineering-college-bagalkot'
UNION ALL
SELECT c.id, 'ME', '2A', 46460 FROM colleges c WHERE c.slug = 'basaveshwar-engineering-college-bagalkot'
UNION ALL
SELECT c.id, 'ME', '3A', 43632 FROM colleges c WHERE c.slug = 'basaveshwar-engineering-college-bagalkot'
UNION ALL
SELECT c.id, 'CSE', 'GM', 14400 FROM colleges c WHERE c.slug = 'bapuji-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 20880 FROM colleges c WHERE c.slug = 'bapuji-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 19440 FROM colleges c WHERE c.slug = 'bapuji-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 16560 FROM colleges c WHERE c.slug = 'bapuji-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 15552 FROM colleges c WHERE c.slug = 'bapuji-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 19400 FROM colleges c WHERE c.slug = 'bapuji-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 28130 FROM colleges c WHERE c.slug = 'bapuji-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 26190 FROM colleges c WHERE c.slug = 'bapuji-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 22310 FROM colleges c WHERE c.slug = 'bapuji-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 20952 FROM colleges c WHERE c.slug = 'bapuji-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 24400 FROM colleges c WHERE c.slug = 'bapuji-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 35380 FROM colleges c WHERE c.slug = 'bapuji-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 32940 FROM colleges c WHERE c.slug = 'bapuji-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 28059 FROM colleges c WHERE c.slug = 'bapuji-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 26352 FROM colleges c WHERE c.slug = 'bapuji-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 16400 FROM colleges c WHERE c.slug = 'bapuji-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 23780 FROM colleges c WHERE c.slug = 'bapuji-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 22140 FROM colleges c WHERE c.slug = 'bapuji-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 18860 FROM colleges c WHERE c.slug = 'bapuji-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 17712 FROM colleges c WHERE c.slug = 'bapuji-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 42200 FROM colleges c WHERE c.slug = 'bapuji-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 61190 FROM colleges c WHERE c.slug = 'bapuji-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 56970 FROM colleges c WHERE c.slug = 'bapuji-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 48529 FROM colleges c WHERE c.slug = 'bapuji-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 45576 FROM colleges c WHERE c.slug = 'bapuji-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 12000 FROM colleges c WHERE c.slug = 'university-bdt-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 17400 FROM colleges c WHERE c.slug = 'university-bdt-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 16200 FROM colleges c WHERE c.slug = 'university-bdt-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 13799 FROM colleges c WHERE c.slug = 'university-bdt-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 12960 FROM colleges c WHERE c.slug = 'university-bdt-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 17000 FROM colleges c WHERE c.slug = 'university-bdt-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 24650 FROM colleges c WHERE c.slug = 'university-bdt-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 22950 FROM colleges c WHERE c.slug = 'university-bdt-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 19550 FROM colleges c WHERE c.slug = 'university-bdt-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 18360 FROM colleges c WHERE c.slug = 'university-bdt-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 22000 FROM colleges c WHERE c.slug = 'university-bdt-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 31900 FROM colleges c WHERE c.slug = 'university-bdt-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 29700 FROM colleges c WHERE c.slug = 'university-bdt-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 25299 FROM colleges c WHERE c.slug = 'university-bdt-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 23760 FROM colleges c WHERE c.slug = 'university-bdt-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 14000 FROM colleges c WHERE c.slug = 'university-bdt-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 20300 FROM colleges c WHERE c.slug = 'university-bdt-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 18900 FROM colleges c WHERE c.slug = 'university-bdt-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 16099 FROM colleges c WHERE c.slug = 'university-bdt-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 15120 FROM colleges c WHERE c.slug = 'university-bdt-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 35000 FROM colleges c WHERE c.slug = 'university-bdt-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 50750 FROM colleges c WHERE c.slug = 'university-bdt-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 47250 FROM colleges c WHERE c.slug = 'university-bdt-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 40250 FROM colleges c WHERE c.slug = 'university-bdt-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 37800 FROM colleges c WHERE c.slug = 'university-bdt-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 12600 FROM colleges c WHERE c.slug = 'ballari-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'CSE', 'SC', 18270 FROM colleges c WHERE c.slug = 'ballari-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'CSE', 'ST', 17010 FROM colleges c WHERE c.slug = 'ballari-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'CSE', '2A', 14489 FROM colleges c WHERE c.slug = 'ballari-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'CSE', '3A', 13608 FROM colleges c WHERE c.slug = 'ballari-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ISE', 'GM', 17600 FROM colleges c WHERE c.slug = 'ballari-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ISE', 'SC', 25520 FROM colleges c WHERE c.slug = 'ballari-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ISE', 'ST', 23760 FROM colleges c WHERE c.slug = 'ballari-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ISE', '2A', 20240 FROM colleges c WHERE c.slug = 'ballari-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ISE', '3A', 19008 FROM colleges c WHERE c.slug = 'ballari-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ECE', 'GM', 22600 FROM colleges c WHERE c.slug = 'ballari-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ECE', 'SC', 32770 FROM colleges c WHERE c.slug = 'ballari-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ECE', 'ST', 30510 FROM colleges c WHERE c.slug = 'ballari-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ECE', '2A', 25989 FROM colleges c WHERE c.slug = 'ballari-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ECE', '3A', 24408 FROM colleges c WHERE c.slug = 'ballari-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'AIML', 'GM', 14600 FROM colleges c WHERE c.slug = 'ballari-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'AIML', 'SC', 21170 FROM colleges c WHERE c.slug = 'ballari-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'AIML', 'ST', 19710 FROM colleges c WHERE c.slug = 'ballari-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'AIML', '2A', 16790 FROM colleges c WHERE c.slug = 'ballari-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'AIML', '3A', 15768 FROM colleges c WHERE c.slug = 'ballari-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ME', 'GM', 36800 FROM colleges c WHERE c.slug = 'ballari-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ME', 'SC', 53360 FROM colleges c WHERE c.slug = 'ballari-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ME', 'ST', 49680 FROM colleges c WHERE c.slug = 'ballari-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ME', '2A', 42320 FROM colleges c WHERE c.slug = 'ballari-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ME', '3A', 39744 FROM colleges c WHERE c.slug = 'ballari-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'CSE', 'GM', 13200 FROM colleges c WHERE c.slug = 'rao-bahadur-y-mahabaleshwarappa-engineering-college'
UNION ALL
SELECT c.id, 'CSE', 'SC', 19140 FROM colleges c WHERE c.slug = 'rao-bahadur-y-mahabaleshwarappa-engineering-college'
UNION ALL
SELECT c.id, 'CSE', 'ST', 17820 FROM colleges c WHERE c.slug = 'rao-bahadur-y-mahabaleshwarappa-engineering-college'
UNION ALL
SELECT c.id, 'CSE', '2A', 15179 FROM colleges c WHERE c.slug = 'rao-bahadur-y-mahabaleshwarappa-engineering-college'
UNION ALL
SELECT c.id, 'CSE', '3A', 14256 FROM colleges c WHERE c.slug = 'rao-bahadur-y-mahabaleshwarappa-engineering-college'
UNION ALL
SELECT c.id, 'ISE', 'GM', 18200 FROM colleges c WHERE c.slug = 'rao-bahadur-y-mahabaleshwarappa-engineering-college'
UNION ALL
SELECT c.id, 'ISE', 'SC', 26390 FROM colleges c WHERE c.slug = 'rao-bahadur-y-mahabaleshwarappa-engineering-college'
UNION ALL
SELECT c.id, 'ISE', 'ST', 24570 FROM colleges c WHERE c.slug = 'rao-bahadur-y-mahabaleshwarappa-engineering-college'
UNION ALL
SELECT c.id, 'ISE', '2A', 20930 FROM colleges c WHERE c.slug = 'rao-bahadur-y-mahabaleshwarappa-engineering-college'
UNION ALL
SELECT c.id, 'ISE', '3A', 19656 FROM colleges c WHERE c.slug = 'rao-bahadur-y-mahabaleshwarappa-engineering-college'
UNION ALL
SELECT c.id, 'ECE', 'GM', 23200 FROM colleges c WHERE c.slug = 'rao-bahadur-y-mahabaleshwarappa-engineering-college'
UNION ALL
SELECT c.id, 'ECE', 'SC', 33640 FROM colleges c WHERE c.slug = 'rao-bahadur-y-mahabaleshwarappa-engineering-college'
UNION ALL
SELECT c.id, 'ECE', 'ST', 31320 FROM colleges c WHERE c.slug = 'rao-bahadur-y-mahabaleshwarappa-engineering-college'
UNION ALL
SELECT c.id, 'ECE', '2A', 26679 FROM colleges c WHERE c.slug = 'rao-bahadur-y-mahabaleshwarappa-engineering-college'
UNION ALL
SELECT c.id, 'ECE', '3A', 25056 FROM colleges c WHERE c.slug = 'rao-bahadur-y-mahabaleshwarappa-engineering-college'
UNION ALL
SELECT c.id, 'AIML', 'GM', 15200 FROM colleges c WHERE c.slug = 'rao-bahadur-y-mahabaleshwarappa-engineering-college'
UNION ALL
SELECT c.id, 'AIML', 'SC', 22040 FROM colleges c WHERE c.slug = 'rao-bahadur-y-mahabaleshwarappa-engineering-college'
UNION ALL
SELECT c.id, 'AIML', 'ST', 20520 FROM colleges c WHERE c.slug = 'rao-bahadur-y-mahabaleshwarappa-engineering-college'
UNION ALL
SELECT c.id, 'AIML', '2A', 17480 FROM colleges c WHERE c.slug = 'rao-bahadur-y-mahabaleshwarappa-engineering-college'
UNION ALL
SELECT c.id, 'AIML', '3A', 16416 FROM colleges c WHERE c.slug = 'rao-bahadur-y-mahabaleshwarappa-engineering-college'
UNION ALL
SELECT c.id, 'ME', 'GM', 38600 FROM colleges c WHERE c.slug = 'rao-bahadur-y-mahabaleshwarappa-engineering-college'
UNION ALL
SELECT c.id, 'ME', 'SC', 55970 FROM colleges c WHERE c.slug = 'rao-bahadur-y-mahabaleshwarappa-engineering-college'
UNION ALL
SELECT c.id, 'ME', 'ST', 52110 FROM colleges c WHERE c.slug = 'rao-bahadur-y-mahabaleshwarappa-engineering-college'
UNION ALL
SELECT c.id, 'ME', '2A', 44390 FROM colleges c WHERE c.slug = 'rao-bahadur-y-mahabaleshwarappa-engineering-college'
UNION ALL
SELECT c.id, 'ME', '3A', 41688 FROM colleges c WHERE c.slug = 'rao-bahadur-y-mahabaleshwarappa-engineering-college'
UNION ALL
SELECT c.id, 'CSE', 'GM', 13800 FROM colleges c WHERE c.slug = 'poojya-doddappa-appa-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 20010 FROM colleges c WHERE c.slug = 'poojya-doddappa-appa-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 18630 FROM colleges c WHERE c.slug = 'poojya-doddappa-appa-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 15869 FROM colleges c WHERE c.slug = 'poojya-doddappa-appa-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 14904 FROM colleges c WHERE c.slug = 'poojya-doddappa-appa-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 18800 FROM colleges c WHERE c.slug = 'poojya-doddappa-appa-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 27260 FROM colleges c WHERE c.slug = 'poojya-doddappa-appa-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 25380 FROM colleges c WHERE c.slug = 'poojya-doddappa-appa-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 21620 FROM colleges c WHERE c.slug = 'poojya-doddappa-appa-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 20304 FROM colleges c WHERE c.slug = 'poojya-doddappa-appa-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 23800 FROM colleges c WHERE c.slug = 'poojya-doddappa-appa-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 34510 FROM colleges c WHERE c.slug = 'poojya-doddappa-appa-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 32130 FROM colleges c WHERE c.slug = 'poojya-doddappa-appa-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 27369 FROM colleges c WHERE c.slug = 'poojya-doddappa-appa-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 25704 FROM colleges c WHERE c.slug = 'poojya-doddappa-appa-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 15800 FROM colleges c WHERE c.slug = 'poojya-doddappa-appa-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 22910 FROM colleges c WHERE c.slug = 'poojya-doddappa-appa-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 21330 FROM colleges c WHERE c.slug = 'poojya-doddappa-appa-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 18170 FROM colleges c WHERE c.slug = 'poojya-doddappa-appa-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 17064 FROM colleges c WHERE c.slug = 'poojya-doddappa-appa-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 40400 FROM colleges c WHERE c.slug = 'poojya-doddappa-appa-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 58580 FROM colleges c WHERE c.slug = 'poojya-doddappa-appa-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 54540 FROM colleges c WHERE c.slug = 'poojya-doddappa-appa-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 46460 FROM colleges c WHERE c.slug = 'poojya-doddappa-appa-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 43632 FROM colleges c WHERE c.slug = 'poojya-doddappa-appa-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 14400 FROM colleges c WHERE c.slug = 'kls-gogte-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 20880 FROM colleges c WHERE c.slug = 'kls-gogte-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 19440 FROM colleges c WHERE c.slug = 'kls-gogte-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 16560 FROM colleges c WHERE c.slug = 'kls-gogte-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 15552 FROM colleges c WHERE c.slug = 'kls-gogte-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 19400 FROM colleges c WHERE c.slug = 'kls-gogte-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 28130 FROM colleges c WHERE c.slug = 'kls-gogte-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 26190 FROM colleges c WHERE c.slug = 'kls-gogte-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 22310 FROM colleges c WHERE c.slug = 'kls-gogte-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 20952 FROM colleges c WHERE c.slug = 'kls-gogte-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 24400 FROM colleges c WHERE c.slug = 'kls-gogte-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 35380 FROM colleges c WHERE c.slug = 'kls-gogte-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 32940 FROM colleges c WHERE c.slug = 'kls-gogte-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 28059 FROM colleges c WHERE c.slug = 'kls-gogte-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 26352 FROM colleges c WHERE c.slug = 'kls-gogte-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 16400 FROM colleges c WHERE c.slug = 'kls-gogte-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 23780 FROM colleges c WHERE c.slug = 'kls-gogte-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 22140 FROM colleges c WHERE c.slug = 'kls-gogte-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 18860 FROM colleges c WHERE c.slug = 'kls-gogte-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 17712 FROM colleges c WHERE c.slug = 'kls-gogte-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 42200 FROM colleges c WHERE c.slug = 'kls-gogte-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 61190 FROM colleges c WHERE c.slug = 'kls-gogte-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 56970 FROM colleges c WHERE c.slug = 'kls-gogte-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 48529 FROM colleges c WHERE c.slug = 'kls-gogte-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 45576 FROM colleges c WHERE c.slug = 'kls-gogte-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 12000 FROM colleges c WHERE c.slug = 'angadi-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'CSE', 'SC', 17400 FROM colleges c WHERE c.slug = 'angadi-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'CSE', 'ST', 16200 FROM colleges c WHERE c.slug = 'angadi-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'CSE', '2A', 13799 FROM colleges c WHERE c.slug = 'angadi-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'CSE', '3A', 12960 FROM colleges c WHERE c.slug = 'angadi-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ISE', 'GM', 17000 FROM colleges c WHERE c.slug = 'angadi-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ISE', 'SC', 24650 FROM colleges c WHERE c.slug = 'angadi-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ISE', 'ST', 22950 FROM colleges c WHERE c.slug = 'angadi-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ISE', '2A', 19550 FROM colleges c WHERE c.slug = 'angadi-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ISE', '3A', 18360 FROM colleges c WHERE c.slug = 'angadi-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ECE', 'GM', 22000 FROM colleges c WHERE c.slug = 'angadi-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ECE', 'SC', 31900 FROM colleges c WHERE c.slug = 'angadi-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ECE', 'ST', 29700 FROM colleges c WHERE c.slug = 'angadi-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ECE', '2A', 25299 FROM colleges c WHERE c.slug = 'angadi-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ECE', '3A', 23760 FROM colleges c WHERE c.slug = 'angadi-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'AIML', 'GM', 14000 FROM colleges c WHERE c.slug = 'angadi-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'AIML', 'SC', 20300 FROM colleges c WHERE c.slug = 'angadi-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'AIML', 'ST', 18900 FROM colleges c WHERE c.slug = 'angadi-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'AIML', '2A', 16099 FROM colleges c WHERE c.slug = 'angadi-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'AIML', '3A', 15120 FROM colleges c WHERE c.slug = 'angadi-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ME', 'GM', 35000 FROM colleges c WHERE c.slug = 'angadi-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ME', 'SC', 50750 FROM colleges c WHERE c.slug = 'angadi-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ME', 'ST', 47250 FROM colleges c WHERE c.slug = 'angadi-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ME', '2A', 40250 FROM colleges c WHERE c.slug = 'angadi-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ME', '3A', 37800 FROM colleges c WHERE c.slug = 'angadi-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'CSE', 'GM', 12600 FROM colleges c WHERE c.slug = 'maratha-mandal-engineering-college'
UNION ALL
SELECT c.id, 'CSE', 'SC', 18270 FROM colleges c WHERE c.slug = 'maratha-mandal-engineering-college'
UNION ALL
SELECT c.id, 'CSE', 'ST', 17010 FROM colleges c WHERE c.slug = 'maratha-mandal-engineering-college'
UNION ALL
SELECT c.id, 'CSE', '2A', 14489 FROM colleges c WHERE c.slug = 'maratha-mandal-engineering-college'
UNION ALL
SELECT c.id, 'CSE', '3A', 13608 FROM colleges c WHERE c.slug = 'maratha-mandal-engineering-college'
UNION ALL
SELECT c.id, 'ISE', 'GM', 17600 FROM colleges c WHERE c.slug = 'maratha-mandal-engineering-college'
UNION ALL
SELECT c.id, 'ISE', 'SC', 25520 FROM colleges c WHERE c.slug = 'maratha-mandal-engineering-college'
UNION ALL
SELECT c.id, 'ISE', 'ST', 23760 FROM colleges c WHERE c.slug = 'maratha-mandal-engineering-college'
UNION ALL
SELECT c.id, 'ISE', '2A', 20240 FROM colleges c WHERE c.slug = 'maratha-mandal-engineering-college'
UNION ALL
SELECT c.id, 'ISE', '3A', 19008 FROM colleges c WHERE c.slug = 'maratha-mandal-engineering-college'
UNION ALL
SELECT c.id, 'ECE', 'GM', 22600 FROM colleges c WHERE c.slug = 'maratha-mandal-engineering-college'
UNION ALL
SELECT c.id, 'ECE', 'SC', 32770 FROM colleges c WHERE c.slug = 'maratha-mandal-engineering-college'
UNION ALL
SELECT c.id, 'ECE', 'ST', 30510 FROM colleges c WHERE c.slug = 'maratha-mandal-engineering-college'
UNION ALL
SELECT c.id, 'ECE', '2A', 25989 FROM colleges c WHERE c.slug = 'maratha-mandal-engineering-college'
UNION ALL
SELECT c.id, 'ECE', '3A', 24408 FROM colleges c WHERE c.slug = 'maratha-mandal-engineering-college'
UNION ALL
SELECT c.id, 'AIML', 'GM', 14600 FROM colleges c WHERE c.slug = 'maratha-mandal-engineering-college'
UNION ALL
SELECT c.id, 'AIML', 'SC', 21170 FROM colleges c WHERE c.slug = 'maratha-mandal-engineering-college'
UNION ALL
SELECT c.id, 'AIML', 'ST', 19710 FROM colleges c WHERE c.slug = 'maratha-mandal-engineering-college'
UNION ALL
SELECT c.id, 'AIML', '2A', 16790 FROM colleges c WHERE c.slug = 'maratha-mandal-engineering-college'
UNION ALL
SELECT c.id, 'AIML', '3A', 15768 FROM colleges c WHERE c.slug = 'maratha-mandal-engineering-college'
UNION ALL
SELECT c.id, 'ME', 'GM', 36800 FROM colleges c WHERE c.slug = 'maratha-mandal-engineering-college'
UNION ALL
SELECT c.id, 'ME', 'SC', 53360 FROM colleges c WHERE c.slug = 'maratha-mandal-engineering-college'
UNION ALL
SELECT c.id, 'ME', 'ST', 49680 FROM colleges c WHERE c.slug = 'maratha-mandal-engineering-college'
UNION ALL
SELECT c.id, 'ME', '2A', 42320 FROM colleges c WHERE c.slug = 'maratha-mandal-engineering-college'
UNION ALL
SELECT c.id, 'ME', '3A', 39744 FROM colleges c WHERE c.slug = 'maratha-mandal-engineering-college'
UNION ALL
SELECT c.id, 'CSE', 'GM', 13200 FROM colleges c WHERE c.slug = 'guru-nanak-dev-engineering-college-bidar'
UNION ALL
SELECT c.id, 'CSE', 'SC', 19140 FROM colleges c WHERE c.slug = 'guru-nanak-dev-engineering-college-bidar'
UNION ALL
SELECT c.id, 'CSE', 'ST', 17820 FROM colleges c WHERE c.slug = 'guru-nanak-dev-engineering-college-bidar'
UNION ALL
SELECT c.id, 'CSE', '2A', 15179 FROM colleges c WHERE c.slug = 'guru-nanak-dev-engineering-college-bidar'
UNION ALL
SELECT c.id, 'CSE', '3A', 14256 FROM colleges c WHERE c.slug = 'guru-nanak-dev-engineering-college-bidar'
UNION ALL
SELECT c.id, 'ISE', 'GM', 18200 FROM colleges c WHERE c.slug = 'guru-nanak-dev-engineering-college-bidar'
UNION ALL
SELECT c.id, 'ISE', 'SC', 26390 FROM colleges c WHERE c.slug = 'guru-nanak-dev-engineering-college-bidar'
UNION ALL
SELECT c.id, 'ISE', 'ST', 24570 FROM colleges c WHERE c.slug = 'guru-nanak-dev-engineering-college-bidar'
UNION ALL
SELECT c.id, 'ISE', '2A', 20930 FROM colleges c WHERE c.slug = 'guru-nanak-dev-engineering-college-bidar'
UNION ALL
SELECT c.id, 'ISE', '3A', 19656 FROM colleges c WHERE c.slug = 'guru-nanak-dev-engineering-college-bidar'
UNION ALL
SELECT c.id, 'ECE', 'GM', 23200 FROM colleges c WHERE c.slug = 'guru-nanak-dev-engineering-college-bidar'
UNION ALL
SELECT c.id, 'ECE', 'SC', 33640 FROM colleges c WHERE c.slug = 'guru-nanak-dev-engineering-college-bidar'
UNION ALL
SELECT c.id, 'ECE', 'ST', 31320 FROM colleges c WHERE c.slug = 'guru-nanak-dev-engineering-college-bidar'
UNION ALL
SELECT c.id, 'ECE', '2A', 26679 FROM colleges c WHERE c.slug = 'guru-nanak-dev-engineering-college-bidar'
UNION ALL
SELECT c.id, 'ECE', '3A', 25056 FROM colleges c WHERE c.slug = 'guru-nanak-dev-engineering-college-bidar'
UNION ALL
SELECT c.id, 'AIML', 'GM', 15200 FROM colleges c WHERE c.slug = 'guru-nanak-dev-engineering-college-bidar'
UNION ALL
SELECT c.id, 'AIML', 'SC', 22040 FROM colleges c WHERE c.slug = 'guru-nanak-dev-engineering-college-bidar'
UNION ALL
SELECT c.id, 'AIML', 'ST', 20520 FROM colleges c WHERE c.slug = 'guru-nanak-dev-engineering-college-bidar'
UNION ALL
SELECT c.id, 'AIML', '2A', 17480 FROM colleges c WHERE c.slug = 'guru-nanak-dev-engineering-college-bidar'
UNION ALL
SELECT c.id, 'AIML', '3A', 16416 FROM colleges c WHERE c.slug = 'guru-nanak-dev-engineering-college-bidar'
UNION ALL
SELECT c.id, 'ME', 'GM', 38600 FROM colleges c WHERE c.slug = 'guru-nanak-dev-engineering-college-bidar'
UNION ALL
SELECT c.id, 'ME', 'SC', 55970 FROM colleges c WHERE c.slug = 'guru-nanak-dev-engineering-college-bidar'
UNION ALL
SELECT c.id, 'ME', 'ST', 52110 FROM colleges c WHERE c.slug = 'guru-nanak-dev-engineering-college-bidar'
UNION ALL
SELECT c.id, 'ME', '2A', 44390 FROM colleges c WHERE c.slug = 'guru-nanak-dev-engineering-college-bidar'
UNION ALL
SELECT c.id, 'ME', '3A', 41688 FROM colleges c WHERE c.slug = 'guru-nanak-dev-engineering-college-bidar'
UNION ALL
SELECT c.id, 'CSE', 'GM', 13800 FROM colleges c WHERE c.slug = 'khaja-banda-nawaz-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 20010 FROM colleges c WHERE c.slug = 'khaja-banda-nawaz-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 18630 FROM colleges c WHERE c.slug = 'khaja-banda-nawaz-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 15869 FROM colleges c WHERE c.slug = 'khaja-banda-nawaz-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 14904 FROM colleges c WHERE c.slug = 'khaja-banda-nawaz-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 18800 FROM colleges c WHERE c.slug = 'khaja-banda-nawaz-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 27260 FROM colleges c WHERE c.slug = 'khaja-banda-nawaz-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 25380 FROM colleges c WHERE c.slug = 'khaja-banda-nawaz-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 21620 FROM colleges c WHERE c.slug = 'khaja-banda-nawaz-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 20304 FROM colleges c WHERE c.slug = 'khaja-banda-nawaz-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 23800 FROM colleges c WHERE c.slug = 'khaja-banda-nawaz-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 34510 FROM colleges c WHERE c.slug = 'khaja-banda-nawaz-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 32130 FROM colleges c WHERE c.slug = 'khaja-banda-nawaz-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 27369 FROM colleges c WHERE c.slug = 'khaja-banda-nawaz-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 25704 FROM colleges c WHERE c.slug = 'khaja-banda-nawaz-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 15800 FROM colleges c WHERE c.slug = 'khaja-banda-nawaz-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 22910 FROM colleges c WHERE c.slug = 'khaja-banda-nawaz-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 21330 FROM colleges c WHERE c.slug = 'khaja-banda-nawaz-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 18170 FROM colleges c WHERE c.slug = 'khaja-banda-nawaz-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 17064 FROM colleges c WHERE c.slug = 'khaja-banda-nawaz-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 40400 FROM colleges c WHERE c.slug = 'khaja-banda-nawaz-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 58580 FROM colleges c WHERE c.slug = 'khaja-banda-nawaz-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 54540 FROM colleges c WHERE c.slug = 'khaja-banda-nawaz-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 46460 FROM colleges c WHERE c.slug = 'khaja-banda-nawaz-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 43632 FROM colleges c WHERE c.slug = 'khaja-banda-nawaz-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 14400 FROM colleges c WHERE c.slug = 'sri-siddhartha-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 20880 FROM colleges c WHERE c.slug = 'sri-siddhartha-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 19440 FROM colleges c WHERE c.slug = 'sri-siddhartha-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 16560 FROM colleges c WHERE c.slug = 'sri-siddhartha-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 15552 FROM colleges c WHERE c.slug = 'sri-siddhartha-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 19400 FROM colleges c WHERE c.slug = 'sri-siddhartha-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 28130 FROM colleges c WHERE c.slug = 'sri-siddhartha-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 26190 FROM colleges c WHERE c.slug = 'sri-siddhartha-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 22310 FROM colleges c WHERE c.slug = 'sri-siddhartha-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 20952 FROM colleges c WHERE c.slug = 'sri-siddhartha-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 24400 FROM colleges c WHERE c.slug = 'sri-siddhartha-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 35380 FROM colleges c WHERE c.slug = 'sri-siddhartha-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 32940 FROM colleges c WHERE c.slug = 'sri-siddhartha-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 28059 FROM colleges c WHERE c.slug = 'sri-siddhartha-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 26352 FROM colleges c WHERE c.slug = 'sri-siddhartha-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 16400 FROM colleges c WHERE c.slug = 'sri-siddhartha-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 23780 FROM colleges c WHERE c.slug = 'sri-siddhartha-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 22140 FROM colleges c WHERE c.slug = 'sri-siddhartha-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 18860 FROM colleges c WHERE c.slug = 'sri-siddhartha-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 17712 FROM colleges c WHERE c.slug = 'sri-siddhartha-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 42200 FROM colleges c WHERE c.slug = 'sri-siddhartha-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 61190 FROM colleges c WHERE c.slug = 'sri-siddhartha-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 56970 FROM colleges c WHERE c.slug = 'sri-siddhartha-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 48529 FROM colleges c WHERE c.slug = 'sri-siddhartha-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 45576 FROM colleges c WHERE c.slug = 'sri-siddhartha-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 12000 FROM colleges c WHERE c.slug = 'adichunchanagiri-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 17400 FROM colleges c WHERE c.slug = 'adichunchanagiri-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 16200 FROM colleges c WHERE c.slug = 'adichunchanagiri-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 13799 FROM colleges c WHERE c.slug = 'adichunchanagiri-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 12960 FROM colleges c WHERE c.slug = 'adichunchanagiri-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 17000 FROM colleges c WHERE c.slug = 'adichunchanagiri-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 24650 FROM colleges c WHERE c.slug = 'adichunchanagiri-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 22950 FROM colleges c WHERE c.slug = 'adichunchanagiri-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 19550 FROM colleges c WHERE c.slug = 'adichunchanagiri-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 18360 FROM colleges c WHERE c.slug = 'adichunchanagiri-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 22000 FROM colleges c WHERE c.slug = 'adichunchanagiri-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 31900 FROM colleges c WHERE c.slug = 'adichunchanagiri-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 29700 FROM colleges c WHERE c.slug = 'adichunchanagiri-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 25299 FROM colleges c WHERE c.slug = 'adichunchanagiri-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 23760 FROM colleges c WHERE c.slug = 'adichunchanagiri-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 14000 FROM colleges c WHERE c.slug = 'adichunchanagiri-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 20300 FROM colleges c WHERE c.slug = 'adichunchanagiri-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 18900 FROM colleges c WHERE c.slug = 'adichunchanagiri-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 16099 FROM colleges c WHERE c.slug = 'adichunchanagiri-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 15120 FROM colleges c WHERE c.slug = 'adichunchanagiri-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 35000 FROM colleges c WHERE c.slug = 'adichunchanagiri-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 50750 FROM colleges c WHERE c.slug = 'adichunchanagiri-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 47250 FROM colleges c WHERE c.slug = 'adichunchanagiri-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 40250 FROM colleges c WHERE c.slug = 'adichunchanagiri-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 37800 FROM colleges c WHERE c.slug = 'adichunchanagiri-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 12600 FROM colleges c WHERE c.slug = 'gsss-institute-of-engineering-and-technology-for-women'
UNION ALL
SELECT c.id, 'CSE', 'SC', 18270 FROM colleges c WHERE c.slug = 'gsss-institute-of-engineering-and-technology-for-women'
UNION ALL
SELECT c.id, 'CSE', 'ST', 17010 FROM colleges c WHERE c.slug = 'gsss-institute-of-engineering-and-technology-for-women'
UNION ALL
SELECT c.id, 'CSE', '2A', 14489 FROM colleges c WHERE c.slug = 'gsss-institute-of-engineering-and-technology-for-women'
UNION ALL
SELECT c.id, 'CSE', '3A', 13608 FROM colleges c WHERE c.slug = 'gsss-institute-of-engineering-and-technology-for-women'
UNION ALL
SELECT c.id, 'ISE', 'GM', 17600 FROM colleges c WHERE c.slug = 'gsss-institute-of-engineering-and-technology-for-women'
UNION ALL
SELECT c.id, 'ISE', 'SC', 25520 FROM colleges c WHERE c.slug = 'gsss-institute-of-engineering-and-technology-for-women'
UNION ALL
SELECT c.id, 'ISE', 'ST', 23760 FROM colleges c WHERE c.slug = 'gsss-institute-of-engineering-and-technology-for-women'
UNION ALL
SELECT c.id, 'ISE', '2A', 20240 FROM colleges c WHERE c.slug = 'gsss-institute-of-engineering-and-technology-for-women'
UNION ALL
SELECT c.id, 'ISE', '3A', 19008 FROM colleges c WHERE c.slug = 'gsss-institute-of-engineering-and-technology-for-women'
UNION ALL
SELECT c.id, 'ECE', 'GM', 22600 FROM colleges c WHERE c.slug = 'gsss-institute-of-engineering-and-technology-for-women'
UNION ALL
SELECT c.id, 'ECE', 'SC', 32770 FROM colleges c WHERE c.slug = 'gsss-institute-of-engineering-and-technology-for-women'
UNION ALL
SELECT c.id, 'ECE', 'ST', 30510 FROM colleges c WHERE c.slug = 'gsss-institute-of-engineering-and-technology-for-women'
UNION ALL
SELECT c.id, 'ECE', '2A', 25989 FROM colleges c WHERE c.slug = 'gsss-institute-of-engineering-and-technology-for-women'
UNION ALL
SELECT c.id, 'ECE', '3A', 24408 FROM colleges c WHERE c.slug = 'gsss-institute-of-engineering-and-technology-for-women'
UNION ALL
SELECT c.id, 'AIML', 'GM', 14600 FROM colleges c WHERE c.slug = 'gsss-institute-of-engineering-and-technology-for-women'
UNION ALL
SELECT c.id, 'AIML', 'SC', 21170 FROM colleges c WHERE c.slug = 'gsss-institute-of-engineering-and-technology-for-women'
UNION ALL
SELECT c.id, 'AIML', 'ST', 19710 FROM colleges c WHERE c.slug = 'gsss-institute-of-engineering-and-technology-for-women'
UNION ALL
SELECT c.id, 'AIML', '2A', 16790 FROM colleges c WHERE c.slug = 'gsss-institute-of-engineering-and-technology-for-women'
UNION ALL
SELECT c.id, 'AIML', '3A', 15768 FROM colleges c WHERE c.slug = 'gsss-institute-of-engineering-and-technology-for-women'
UNION ALL
SELECT c.id, 'ME', 'GM', 36800 FROM colleges c WHERE c.slug = 'gsss-institute-of-engineering-and-technology-for-women'
UNION ALL
SELECT c.id, 'ME', 'SC', 53360 FROM colleges c WHERE c.slug = 'gsss-institute-of-engineering-and-technology-for-women'
UNION ALL
SELECT c.id, 'ME', 'ST', 49680 FROM colleges c WHERE c.slug = 'gsss-institute-of-engineering-and-technology-for-women'
UNION ALL
SELECT c.id, 'ME', '2A', 42320 FROM colleges c WHERE c.slug = 'gsss-institute-of-engineering-and-technology-for-women'
UNION ALL
SELECT c.id, 'ME', '3A', 39744 FROM colleges c WHERE c.slug = 'gsss-institute-of-engineering-and-technology-for-women'
UNION ALL
SELECT c.id, 'CSE', 'GM', 13200 FROM colleges c WHERE c.slug = 'vidya-vikas-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 19140 FROM colleges c WHERE c.slug = 'vidya-vikas-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 17820 FROM colleges c WHERE c.slug = 'vidya-vikas-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 15179 FROM colleges c WHERE c.slug = 'vidya-vikas-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 14256 FROM colleges c WHERE c.slug = 'vidya-vikas-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 18200 FROM colleges c WHERE c.slug = 'vidya-vikas-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 26390 FROM colleges c WHERE c.slug = 'vidya-vikas-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 24570 FROM colleges c WHERE c.slug = 'vidya-vikas-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 20930 FROM colleges c WHERE c.slug = 'vidya-vikas-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 19656 FROM colleges c WHERE c.slug = 'vidya-vikas-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 23200 FROM colleges c WHERE c.slug = 'vidya-vikas-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 33640 FROM colleges c WHERE c.slug = 'vidya-vikas-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 31320 FROM colleges c WHERE c.slug = 'vidya-vikas-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 26679 FROM colleges c WHERE c.slug = 'vidya-vikas-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 25056 FROM colleges c WHERE c.slug = 'vidya-vikas-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 15200 FROM colleges c WHERE c.slug = 'vidya-vikas-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 22040 FROM colleges c WHERE c.slug = 'vidya-vikas-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 20520 FROM colleges c WHERE c.slug = 'vidya-vikas-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 17480 FROM colleges c WHERE c.slug = 'vidya-vikas-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 16416 FROM colleges c WHERE c.slug = 'vidya-vikas-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 38600 FROM colleges c WHERE c.slug = 'vidya-vikas-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 55970 FROM colleges c WHERE c.slug = 'vidya-vikas-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 52110 FROM colleges c WHERE c.slug = 'vidya-vikas-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 44390 FROM colleges c WHERE c.slug = 'vidya-vikas-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 41688 FROM colleges c WHERE c.slug = 'vidya-vikas-institute-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 13800 FROM colleges c WHERE c.slug = 'maharaja-institute-of-technology-thandavapura'
UNION ALL
SELECT c.id, 'CSE', 'SC', 20010 FROM colleges c WHERE c.slug = 'maharaja-institute-of-technology-thandavapura'
UNION ALL
SELECT c.id, 'CSE', 'ST', 18630 FROM colleges c WHERE c.slug = 'maharaja-institute-of-technology-thandavapura'
UNION ALL
SELECT c.id, 'CSE', '2A', 15869 FROM colleges c WHERE c.slug = 'maharaja-institute-of-technology-thandavapura'
UNION ALL
SELECT c.id, 'CSE', '3A', 14904 FROM colleges c WHERE c.slug = 'maharaja-institute-of-technology-thandavapura'
UNION ALL
SELECT c.id, 'ISE', 'GM', 18800 FROM colleges c WHERE c.slug = 'maharaja-institute-of-technology-thandavapura'
UNION ALL
SELECT c.id, 'ISE', 'SC', 27260 FROM colleges c WHERE c.slug = 'maharaja-institute-of-technology-thandavapura'
UNION ALL
SELECT c.id, 'ISE', 'ST', 25380 FROM colleges c WHERE c.slug = 'maharaja-institute-of-technology-thandavapura'
UNION ALL
SELECT c.id, 'ISE', '2A', 21620 FROM colleges c WHERE c.slug = 'maharaja-institute-of-technology-thandavapura'
UNION ALL
SELECT c.id, 'ISE', '3A', 20304 FROM colleges c WHERE c.slug = 'maharaja-institute-of-technology-thandavapura'
UNION ALL
SELECT c.id, 'ECE', 'GM', 23800 FROM colleges c WHERE c.slug = 'maharaja-institute-of-technology-thandavapura'
UNION ALL
SELECT c.id, 'ECE', 'SC', 34510 FROM colleges c WHERE c.slug = 'maharaja-institute-of-technology-thandavapura'
UNION ALL
SELECT c.id, 'ECE', 'ST', 32130 FROM colleges c WHERE c.slug = 'maharaja-institute-of-technology-thandavapura'
UNION ALL
SELECT c.id, 'ECE', '2A', 27369 FROM colleges c WHERE c.slug = 'maharaja-institute-of-technology-thandavapura'
UNION ALL
SELECT c.id, 'ECE', '3A', 25704 FROM colleges c WHERE c.slug = 'maharaja-institute-of-technology-thandavapura'
UNION ALL
SELECT c.id, 'AIML', 'GM', 15800 FROM colleges c WHERE c.slug = 'maharaja-institute-of-technology-thandavapura'
UNION ALL
SELECT c.id, 'AIML', 'SC', 22910 FROM colleges c WHERE c.slug = 'maharaja-institute-of-technology-thandavapura'
UNION ALL
SELECT c.id, 'AIML', 'ST', 21330 FROM colleges c WHERE c.slug = 'maharaja-institute-of-technology-thandavapura'
UNION ALL
SELECT c.id, 'AIML', '2A', 18170 FROM colleges c WHERE c.slug = 'maharaja-institute-of-technology-thandavapura'
UNION ALL
SELECT c.id, 'AIML', '3A', 17064 FROM colleges c WHERE c.slug = 'maharaja-institute-of-technology-thandavapura'
UNION ALL
SELECT c.id, 'ME', 'GM', 40400 FROM colleges c WHERE c.slug = 'maharaja-institute-of-technology-thandavapura'
UNION ALL
SELECT c.id, 'ME', 'SC', 58580 FROM colleges c WHERE c.slug = 'maharaja-institute-of-technology-thandavapura'
UNION ALL
SELECT c.id, 'ME', 'ST', 54540 FROM colleges c WHERE c.slug = 'maharaja-institute-of-technology-thandavapura'
UNION ALL
SELECT c.id, 'ME', '2A', 46460 FROM colleges c WHERE c.slug = 'maharaja-institute-of-technology-thandavapura'
UNION ALL
SELECT c.id, 'ME', '3A', 43632 FROM colleges c WHERE c.slug = 'maharaja-institute-of-technology-thandavapura'
UNION ALL
SELECT c.id, 'CSE', 'GM', 24400 FROM colleges c WHERE c.slug = 'government-engineering-college-hassan'
UNION ALL
SELECT c.id, 'CSE', 'SC', 35380 FROM colleges c WHERE c.slug = 'government-engineering-college-hassan'
UNION ALL
SELECT c.id, 'CSE', 'ST', 32940 FROM colleges c WHERE c.slug = 'government-engineering-college-hassan'
UNION ALL
SELECT c.id, 'CSE', '2A', 28059 FROM colleges c WHERE c.slug = 'government-engineering-college-hassan'
UNION ALL
SELECT c.id, 'CSE', '3A', 26352 FROM colleges c WHERE c.slug = 'government-engineering-college-hassan'
UNION ALL
SELECT c.id, 'ISE', 'GM', 30400 FROM colleges c WHERE c.slug = 'government-engineering-college-hassan'
UNION ALL
SELECT c.id, 'ISE', 'SC', 44080 FROM colleges c WHERE c.slug = 'government-engineering-college-hassan'
UNION ALL
SELECT c.id, 'ISE', 'ST', 41040 FROM colleges c WHERE c.slug = 'government-engineering-college-hassan'
UNION ALL
SELECT c.id, 'ISE', '2A', 34960 FROM colleges c WHERE c.slug = 'government-engineering-college-hassan'
UNION ALL
SELECT c.id, 'ISE', '3A', 32832 FROM colleges c WHERE c.slug = 'government-engineering-college-hassan'
UNION ALL
SELECT c.id, 'ECE', 'GM', 38400 FROM colleges c WHERE c.slug = 'government-engineering-college-hassan'
UNION ALL
SELECT c.id, 'ECE', 'SC', 55680 FROM colleges c WHERE c.slug = 'government-engineering-college-hassan'
UNION ALL
SELECT c.id, 'ECE', 'ST', 51840 FROM colleges c WHERE c.slug = 'government-engineering-college-hassan'
UNION ALL
SELECT c.id, 'ECE', '2A', 44160 FROM colleges c WHERE c.slug = 'government-engineering-college-hassan'
UNION ALL
SELECT c.id, 'ECE', '3A', 41472 FROM colleges c WHERE c.slug = 'government-engineering-college-hassan'
UNION ALL
SELECT c.id, 'AIML', 'GM', 28400 FROM colleges c WHERE c.slug = 'government-engineering-college-hassan'
UNION ALL
SELECT c.id, 'AIML', 'SC', 41180 FROM colleges c WHERE c.slug = 'government-engineering-college-hassan'
UNION ALL
SELECT c.id, 'AIML', 'ST', 38340 FROM colleges c WHERE c.slug = 'government-engineering-college-hassan'
UNION ALL
SELECT c.id, 'AIML', '2A', 32659 FROM colleges c WHERE c.slug = 'government-engineering-college-hassan'
UNION ALL
SELECT c.id, 'AIML', '3A', 30672 FROM colleges c WHERE c.slug = 'government-engineering-college-hassan'
UNION ALL
SELECT c.id, 'ME', 'GM', 62200 FROM colleges c WHERE c.slug = 'government-engineering-college-hassan'
UNION ALL
SELECT c.id, 'ME', 'SC', 90190 FROM colleges c WHERE c.slug = 'government-engineering-college-hassan'
UNION ALL
SELECT c.id, 'ME', 'ST', 83970 FROM colleges c WHERE c.slug = 'government-engineering-college-hassan'
UNION ALL
SELECT c.id, 'ME', '2A', 71530 FROM colleges c WHERE c.slug = 'government-engineering-college-hassan'
UNION ALL
SELECT c.id, 'ME', '3A', 67176 FROM colleges c WHERE c.slug = 'government-engineering-college-hassan'
UNION ALL
SELECT c.id, 'CSE', 'GM', 22000 FROM colleges c WHERE c.slug = 'government-engineering-college-raichur'
UNION ALL
SELECT c.id, 'CSE', 'SC', 31900 FROM colleges c WHERE c.slug = 'government-engineering-college-raichur'
UNION ALL
SELECT c.id, 'CSE', 'ST', 29700 FROM colleges c WHERE c.slug = 'government-engineering-college-raichur'
UNION ALL
SELECT c.id, 'CSE', '2A', 25299 FROM colleges c WHERE c.slug = 'government-engineering-college-raichur'
UNION ALL
SELECT c.id, 'CSE', '3A', 23760 FROM colleges c WHERE c.slug = 'government-engineering-college-raichur'
UNION ALL
SELECT c.id, 'ISE', 'GM', 28000 FROM colleges c WHERE c.slug = 'government-engineering-college-raichur'
UNION ALL
SELECT c.id, 'ISE', 'SC', 40600 FROM colleges c WHERE c.slug = 'government-engineering-college-raichur'
UNION ALL
SELECT c.id, 'ISE', 'ST', 37800 FROM colleges c WHERE c.slug = 'government-engineering-college-raichur'
UNION ALL
SELECT c.id, 'ISE', '2A', 32199 FROM colleges c WHERE c.slug = 'government-engineering-college-raichur'
UNION ALL
SELECT c.id, 'ISE', '3A', 30240 FROM colleges c WHERE c.slug = 'government-engineering-college-raichur'
UNION ALL
SELECT c.id, 'ECE', 'GM', 36000 FROM colleges c WHERE c.slug = 'government-engineering-college-raichur'
UNION ALL
SELECT c.id, 'ECE', 'SC', 52200 FROM colleges c WHERE c.slug = 'government-engineering-college-raichur'
UNION ALL
SELECT c.id, 'ECE', 'ST', 48600 FROM colleges c WHERE c.slug = 'government-engineering-college-raichur'
UNION ALL
SELECT c.id, 'ECE', '2A', 41400 FROM colleges c WHERE c.slug = 'government-engineering-college-raichur'
UNION ALL
SELECT c.id, 'ECE', '3A', 38880 FROM colleges c WHERE c.slug = 'government-engineering-college-raichur'
UNION ALL
SELECT c.id, 'AIML', 'GM', 26000 FROM colleges c WHERE c.slug = 'government-engineering-college-raichur'
UNION ALL
SELECT c.id, 'AIML', 'SC', 37700 FROM colleges c WHERE c.slug = 'government-engineering-college-raichur'
UNION ALL
SELECT c.id, 'AIML', 'ST', 35100 FROM colleges c WHERE c.slug = 'government-engineering-college-raichur'
UNION ALL
SELECT c.id, 'AIML', '2A', 29899 FROM colleges c WHERE c.slug = 'government-engineering-college-raichur'
UNION ALL
SELECT c.id, 'AIML', '3A', 28080 FROM colleges c WHERE c.slug = 'government-engineering-college-raichur'
UNION ALL
SELECT c.id, 'ME', 'GM', 55000 FROM colleges c WHERE c.slug = 'government-engineering-college-raichur'
UNION ALL
SELECT c.id, 'ME', 'SC', 79750 FROM colleges c WHERE c.slug = 'government-engineering-college-raichur'
UNION ALL
SELECT c.id, 'ME', 'ST', 74250 FROM colleges c WHERE c.slug = 'government-engineering-college-raichur'
UNION ALL
SELECT c.id, 'ME', '2A', 63249 FROM colleges c WHERE c.slug = 'government-engineering-college-raichur'
UNION ALL
SELECT c.id, 'ME', '3A', 59400 FROM colleges c WHERE c.slug = 'government-engineering-college-raichur'
UNION ALL
SELECT c.id, 'CSE', 'GM', 22600 FROM colleges c WHERE c.slug = 'government-engineering-college-ramanagara'
UNION ALL
SELECT c.id, 'CSE', 'SC', 32770 FROM colleges c WHERE c.slug = 'government-engineering-college-ramanagara'
UNION ALL
SELECT c.id, 'CSE', 'ST', 30510 FROM colleges c WHERE c.slug = 'government-engineering-college-ramanagara'
UNION ALL
SELECT c.id, 'CSE', '2A', 25989 FROM colleges c WHERE c.slug = 'government-engineering-college-ramanagara'
UNION ALL
SELECT c.id, 'CSE', '3A', 24408 FROM colleges c WHERE c.slug = 'government-engineering-college-ramanagara'
UNION ALL
SELECT c.id, 'ISE', 'GM', 28600 FROM colleges c WHERE c.slug = 'government-engineering-college-ramanagara'
UNION ALL
SELECT c.id, 'ISE', 'SC', 41470 FROM colleges c WHERE c.slug = 'government-engineering-college-ramanagara'
UNION ALL
SELECT c.id, 'ISE', 'ST', 38610 FROM colleges c WHERE c.slug = 'government-engineering-college-ramanagara'
UNION ALL
SELECT c.id, 'ISE', '2A', 32890 FROM colleges c WHERE c.slug = 'government-engineering-college-ramanagara'
UNION ALL
SELECT c.id, 'ISE', '3A', 30888 FROM colleges c WHERE c.slug = 'government-engineering-college-ramanagara'
UNION ALL
SELECT c.id, 'ECE', 'GM', 36600 FROM colleges c WHERE c.slug = 'government-engineering-college-ramanagara'
UNION ALL
SELECT c.id, 'ECE', 'SC', 53070 FROM colleges c WHERE c.slug = 'government-engineering-college-ramanagara'
UNION ALL
SELECT c.id, 'ECE', 'ST', 49410 FROM colleges c WHERE c.slug = 'government-engineering-college-ramanagara'
UNION ALL
SELECT c.id, 'ECE', '2A', 42090 FROM colleges c WHERE c.slug = 'government-engineering-college-ramanagara'
UNION ALL
SELECT c.id, 'ECE', '3A', 39528 FROM colleges c WHERE c.slug = 'government-engineering-college-ramanagara'
UNION ALL
SELECT c.id, 'AIML', 'GM', 26600 FROM colleges c WHERE c.slug = 'government-engineering-college-ramanagara'
UNION ALL
SELECT c.id, 'AIML', 'SC', 38570 FROM colleges c WHERE c.slug = 'government-engineering-college-ramanagara'
UNION ALL
SELECT c.id, 'AIML', 'ST', 35910 FROM colleges c WHERE c.slug = 'government-engineering-college-ramanagara'
UNION ALL
SELECT c.id, 'AIML', '2A', 30589 FROM colleges c WHERE c.slug = 'government-engineering-college-ramanagara'
UNION ALL
SELECT c.id, 'AIML', '3A', 28728 FROM colleges c WHERE c.slug = 'government-engineering-college-ramanagara'
UNION ALL
SELECT c.id, 'ME', 'GM', 56800 FROM colleges c WHERE c.slug = 'government-engineering-college-ramanagara'
UNION ALL
SELECT c.id, 'ME', 'SC', 82360 FROM colleges c WHERE c.slug = 'government-engineering-college-ramanagara'
UNION ALL
SELECT c.id, 'ME', 'ST', 76680 FROM colleges c WHERE c.slug = 'government-engineering-college-ramanagara'
UNION ALL
SELECT c.id, 'ME', '2A', 65319 FROM colleges c WHERE c.slug = 'government-engineering-college-ramanagara'
UNION ALL
SELECT c.id, 'ME', '3A', 61344 FROM colleges c WHERE c.slug = 'government-engineering-college-ramanagara'
UNION ALL
SELECT c.id, 'CSE', 'GM', 23200 FROM colleges c WHERE c.slug = 'government-engineering-college-chamarajanagar'
UNION ALL
SELECT c.id, 'CSE', 'SC', 33640 FROM colleges c WHERE c.slug = 'government-engineering-college-chamarajanagar'
UNION ALL
SELECT c.id, 'CSE', 'ST', 31320 FROM colleges c WHERE c.slug = 'government-engineering-college-chamarajanagar'
UNION ALL
SELECT c.id, 'CSE', '2A', 26679 FROM colleges c WHERE c.slug = 'government-engineering-college-chamarajanagar'
UNION ALL
SELECT c.id, 'CSE', '3A', 25056 FROM colleges c WHERE c.slug = 'government-engineering-college-chamarajanagar'
UNION ALL
SELECT c.id, 'ISE', 'GM', 29200 FROM colleges c WHERE c.slug = 'government-engineering-college-chamarajanagar'
UNION ALL
SELECT c.id, 'ISE', 'SC', 42340 FROM colleges c WHERE c.slug = 'government-engineering-college-chamarajanagar'
UNION ALL
SELECT c.id, 'ISE', 'ST', 39420 FROM colleges c WHERE c.slug = 'government-engineering-college-chamarajanagar'
UNION ALL
SELECT c.id, 'ISE', '2A', 33580 FROM colleges c WHERE c.slug = 'government-engineering-college-chamarajanagar'
UNION ALL
SELECT c.id, 'ISE', '3A', 31536 FROM colleges c WHERE c.slug = 'government-engineering-college-chamarajanagar'
UNION ALL
SELECT c.id, 'ECE', 'GM', 37200 FROM colleges c WHERE c.slug = 'government-engineering-college-chamarajanagar'
UNION ALL
SELECT c.id, 'ECE', 'SC', 53940 FROM colleges c WHERE c.slug = 'government-engineering-college-chamarajanagar'
UNION ALL
SELECT c.id, 'ECE', 'ST', 50220 FROM colleges c WHERE c.slug = 'government-engineering-college-chamarajanagar'
UNION ALL
SELECT c.id, 'ECE', '2A', 42780 FROM colleges c WHERE c.slug = 'government-engineering-college-chamarajanagar'
UNION ALL
SELECT c.id, 'ECE', '3A', 40176 FROM colleges c WHERE c.slug = 'government-engineering-college-chamarajanagar'
UNION ALL
SELECT c.id, 'AIML', 'GM', 27200 FROM colleges c WHERE c.slug = 'government-engineering-college-chamarajanagar'
UNION ALL
SELECT c.id, 'AIML', 'SC', 39440 FROM colleges c WHERE c.slug = 'government-engineering-college-chamarajanagar'
UNION ALL
SELECT c.id, 'AIML', 'ST', 36720 FROM colleges c WHERE c.slug = 'government-engineering-college-chamarajanagar'
UNION ALL
SELECT c.id, 'AIML', '2A', 31279 FROM colleges c WHERE c.slug = 'government-engineering-college-chamarajanagar'
UNION ALL
SELECT c.id, 'AIML', '3A', 29376 FROM colleges c WHERE c.slug = 'government-engineering-college-chamarajanagar'
UNION ALL
SELECT c.id, 'ME', 'GM', 58600 FROM colleges c WHERE c.slug = 'government-engineering-college-chamarajanagar'
UNION ALL
SELECT c.id, 'ME', 'SC', 84970 FROM colleges c WHERE c.slug = 'government-engineering-college-chamarajanagar'
UNION ALL
SELECT c.id, 'ME', 'ST', 79110 FROM colleges c WHERE c.slug = 'government-engineering-college-chamarajanagar'
UNION ALL
SELECT c.id, 'ME', '2A', 67390 FROM colleges c WHERE c.slug = 'government-engineering-college-chamarajanagar'
UNION ALL
SELECT c.id, 'ME', '3A', 63288 FROM colleges c WHERE c.slug = 'government-engineering-college-chamarajanagar'
UNION ALL
SELECT c.id, 'CSE', 'GM', 23800 FROM colleges c WHERE c.slug = 'government-engineering-college-krishnarajpet'
UNION ALL
SELECT c.id, 'CSE', 'SC', 34510 FROM colleges c WHERE c.slug = 'government-engineering-college-krishnarajpet'
UNION ALL
SELECT c.id, 'CSE', 'ST', 32130 FROM colleges c WHERE c.slug = 'government-engineering-college-krishnarajpet'
UNION ALL
SELECT c.id, 'CSE', '2A', 27369 FROM colleges c WHERE c.slug = 'government-engineering-college-krishnarajpet'
UNION ALL
SELECT c.id, 'CSE', '3A', 25704 FROM colleges c WHERE c.slug = 'government-engineering-college-krishnarajpet'
UNION ALL
SELECT c.id, 'ISE', 'GM', 29800 FROM colleges c WHERE c.slug = 'government-engineering-college-krishnarajpet'
UNION ALL
SELECT c.id, 'ISE', 'SC', 43210 FROM colleges c WHERE c.slug = 'government-engineering-college-krishnarajpet'
UNION ALL
SELECT c.id, 'ISE', 'ST', 40230 FROM colleges c WHERE c.slug = 'government-engineering-college-krishnarajpet'
UNION ALL
SELECT c.id, 'ISE', '2A', 34270 FROM colleges c WHERE c.slug = 'government-engineering-college-krishnarajpet'
UNION ALL
SELECT c.id, 'ISE', '3A', 32184 FROM colleges c WHERE c.slug = 'government-engineering-college-krishnarajpet'
UNION ALL
SELECT c.id, 'ECE', 'GM', 37800 FROM colleges c WHERE c.slug = 'government-engineering-college-krishnarajpet'
UNION ALL
SELECT c.id, 'ECE', 'SC', 54810 FROM colleges c WHERE c.slug = 'government-engineering-college-krishnarajpet'
UNION ALL
SELECT c.id, 'ECE', 'ST', 51030 FROM colleges c WHERE c.slug = 'government-engineering-college-krishnarajpet'
UNION ALL
SELECT c.id, 'ECE', '2A', 43470 FROM colleges c WHERE c.slug = 'government-engineering-college-krishnarajpet'
UNION ALL
SELECT c.id, 'ECE', '3A', 40824 FROM colleges c WHERE c.slug = 'government-engineering-college-krishnarajpet'
UNION ALL
SELECT c.id, 'AIML', 'GM', 27800 FROM colleges c WHERE c.slug = 'government-engineering-college-krishnarajpet'
UNION ALL
SELECT c.id, 'AIML', 'SC', 40310 FROM colleges c WHERE c.slug = 'government-engineering-college-krishnarajpet'
UNION ALL
SELECT c.id, 'AIML', 'ST', 37530 FROM colleges c WHERE c.slug = 'government-engineering-college-krishnarajpet'
UNION ALL
SELECT c.id, 'AIML', '2A', 31969 FROM colleges c WHERE c.slug = 'government-engineering-college-krishnarajpet'
UNION ALL
SELECT c.id, 'AIML', '3A', 30024 FROM colleges c WHERE c.slug = 'government-engineering-college-krishnarajpet'
UNION ALL
SELECT c.id, 'ME', 'GM', 60400 FROM colleges c WHERE c.slug = 'government-engineering-college-krishnarajpet'
UNION ALL
SELECT c.id, 'ME', 'SC', 87580 FROM colleges c WHERE c.slug = 'government-engineering-college-krishnarajpet'
UNION ALL
SELECT c.id, 'ME', 'ST', 81540 FROM colleges c WHERE c.slug = 'government-engineering-college-krishnarajpet'
UNION ALL
SELECT c.id, 'ME', '2A', 69460 FROM colleges c WHERE c.slug = 'government-engineering-college-krishnarajpet'
UNION ALL
SELECT c.id, 'ME', '3A', 65232 FROM colleges c WHERE c.slug = 'government-engineering-college-krishnarajpet'
UNION ALL
SELECT c.id, 'CSE', 'GM', 24400 FROM colleges c WHERE c.slug = 'sri-venkateshwara-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 35380 FROM colleges c WHERE c.slug = 'sri-venkateshwara-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 32940 FROM colleges c WHERE c.slug = 'sri-venkateshwara-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 28059 FROM colleges c WHERE c.slug = 'sri-venkateshwara-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 26352 FROM colleges c WHERE c.slug = 'sri-venkateshwara-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 30400 FROM colleges c WHERE c.slug = 'sri-venkateshwara-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 44080 FROM colleges c WHERE c.slug = 'sri-venkateshwara-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 41040 FROM colleges c WHERE c.slug = 'sri-venkateshwara-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 34960 FROM colleges c WHERE c.slug = 'sri-venkateshwara-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 32832 FROM colleges c WHERE c.slug = 'sri-venkateshwara-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 38400 FROM colleges c WHERE c.slug = 'sri-venkateshwara-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 55680 FROM colleges c WHERE c.slug = 'sri-venkateshwara-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 51840 FROM colleges c WHERE c.slug = 'sri-venkateshwara-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 44160 FROM colleges c WHERE c.slug = 'sri-venkateshwara-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 41472 FROM colleges c WHERE c.slug = 'sri-venkateshwara-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 28400 FROM colleges c WHERE c.slug = 'sri-venkateshwara-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 41180 FROM colleges c WHERE c.slug = 'sri-venkateshwara-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 38340 FROM colleges c WHERE c.slug = 'sri-venkateshwara-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 32659 FROM colleges c WHERE c.slug = 'sri-venkateshwara-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 30672 FROM colleges c WHERE c.slug = 'sri-venkateshwara-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 62200 FROM colleges c WHERE c.slug = 'sri-venkateshwara-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 90190 FROM colleges c WHERE c.slug = 'sri-venkateshwara-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 83970 FROM colleges c WHERE c.slug = 'sri-venkateshwara-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 71530 FROM colleges c WHERE c.slug = 'sri-venkateshwara-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 67176 FROM colleges c WHERE c.slug = 'sri-venkateshwara-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 22000 FROM colleges c WHERE c.slug = 'jyothy-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 31900 FROM colleges c WHERE c.slug = 'jyothy-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 29700 FROM colleges c WHERE c.slug = 'jyothy-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 25299 FROM colleges c WHERE c.slug = 'jyothy-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 23760 FROM colleges c WHERE c.slug = 'jyothy-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 28000 FROM colleges c WHERE c.slug = 'jyothy-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 40600 FROM colleges c WHERE c.slug = 'jyothy-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 37800 FROM colleges c WHERE c.slug = 'jyothy-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 32199 FROM colleges c WHERE c.slug = 'jyothy-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 30240 FROM colleges c WHERE c.slug = 'jyothy-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 36000 FROM colleges c WHERE c.slug = 'jyothy-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 52200 FROM colleges c WHERE c.slug = 'jyothy-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 48600 FROM colleges c WHERE c.slug = 'jyothy-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 41400 FROM colleges c WHERE c.slug = 'jyothy-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 38880 FROM colleges c WHERE c.slug = 'jyothy-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 26000 FROM colleges c WHERE c.slug = 'jyothy-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 37700 FROM colleges c WHERE c.slug = 'jyothy-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 35100 FROM colleges c WHERE c.slug = 'jyothy-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 29899 FROM colleges c WHERE c.slug = 'jyothy-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 28080 FROM colleges c WHERE c.slug = 'jyothy-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 55000 FROM colleges c WHERE c.slug = 'jyothy-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 79750 FROM colleges c WHERE c.slug = 'jyothy-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 74250 FROM colleges c WHERE c.slug = 'jyothy-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 63249 FROM colleges c WHERE c.slug = 'jyothy-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 59400 FROM colleges c WHERE c.slug = 'jyothy-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 22600 FROM colleges c WHERE c.slug = 'global-institute-of-management-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 32770 FROM colleges c WHERE c.slug = 'global-institute-of-management-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 30510 FROM colleges c WHERE c.slug = 'global-institute-of-management-and-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 25989 FROM colleges c WHERE c.slug = 'global-institute-of-management-and-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 24408 FROM colleges c WHERE c.slug = 'global-institute-of-management-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 28600 FROM colleges c WHERE c.slug = 'global-institute-of-management-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 41470 FROM colleges c WHERE c.slug = 'global-institute-of-management-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 38610 FROM colleges c WHERE c.slug = 'global-institute-of-management-and-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 32890 FROM colleges c WHERE c.slug = 'global-institute-of-management-and-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 30888 FROM colleges c WHERE c.slug = 'global-institute-of-management-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 36600 FROM colleges c WHERE c.slug = 'global-institute-of-management-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 53070 FROM colleges c WHERE c.slug = 'global-institute-of-management-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 49410 FROM colleges c WHERE c.slug = 'global-institute-of-management-and-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 42090 FROM colleges c WHERE c.slug = 'global-institute-of-management-and-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 39528 FROM colleges c WHERE c.slug = 'global-institute-of-management-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 26600 FROM colleges c WHERE c.slug = 'global-institute-of-management-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 38570 FROM colleges c WHERE c.slug = 'global-institute-of-management-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 35910 FROM colleges c WHERE c.slug = 'global-institute-of-management-and-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 30589 FROM colleges c WHERE c.slug = 'global-institute-of-management-and-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 28728 FROM colleges c WHERE c.slug = 'global-institute-of-management-and-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 56800 FROM colleges c WHERE c.slug = 'global-institute-of-management-and-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 82360 FROM colleges c WHERE c.slug = 'global-institute-of-management-and-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 76680 FROM colleges c WHERE c.slug = 'global-institute-of-management-and-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 65319 FROM colleges c WHERE c.slug = 'global-institute-of-management-and-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 61344 FROM colleges c WHERE c.slug = 'global-institute-of-management-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 23200 FROM colleges c WHERE c.slug = 'hkbk-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 33640 FROM colleges c WHERE c.slug = 'hkbk-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 31320 FROM colleges c WHERE c.slug = 'hkbk-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 26679 FROM colleges c WHERE c.slug = 'hkbk-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 25056 FROM colleges c WHERE c.slug = 'hkbk-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 29200 FROM colleges c WHERE c.slug = 'hkbk-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 42340 FROM colleges c WHERE c.slug = 'hkbk-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 39420 FROM colleges c WHERE c.slug = 'hkbk-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 33580 FROM colleges c WHERE c.slug = 'hkbk-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 31536 FROM colleges c WHERE c.slug = 'hkbk-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 37200 FROM colleges c WHERE c.slug = 'hkbk-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 53940 FROM colleges c WHERE c.slug = 'hkbk-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 50220 FROM colleges c WHERE c.slug = 'hkbk-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 42780 FROM colleges c WHERE c.slug = 'hkbk-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 40176 FROM colleges c WHERE c.slug = 'hkbk-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 27200 FROM colleges c WHERE c.slug = 'hkbk-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 39440 FROM colleges c WHERE c.slug = 'hkbk-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 36720 FROM colleges c WHERE c.slug = 'hkbk-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 31279 FROM colleges c WHERE c.slug = 'hkbk-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 29376 FROM colleges c WHERE c.slug = 'hkbk-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 58600 FROM colleges c WHERE c.slug = 'hkbk-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 84970 FROM colleges c WHERE c.slug = 'hkbk-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 79110 FROM colleges c WHERE c.slug = 'hkbk-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 67390 FROM colleges c WHERE c.slug = 'hkbk-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 63288 FROM colleges c WHERE c.slug = 'hkbk-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 23800 FROM colleges c WHERE c.slug = 'mvj-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 34510 FROM colleges c WHERE c.slug = 'mvj-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 32130 FROM colleges c WHERE c.slug = 'mvj-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 27369 FROM colleges c WHERE c.slug = 'mvj-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 25704 FROM colleges c WHERE c.slug = 'mvj-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 29800 FROM colleges c WHERE c.slug = 'mvj-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 43210 FROM colleges c WHERE c.slug = 'mvj-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 40230 FROM colleges c WHERE c.slug = 'mvj-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 34270 FROM colleges c WHERE c.slug = 'mvj-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 32184 FROM colleges c WHERE c.slug = 'mvj-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 37800 FROM colleges c WHERE c.slug = 'mvj-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 54810 FROM colleges c WHERE c.slug = 'mvj-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 51030 FROM colleges c WHERE c.slug = 'mvj-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 43470 FROM colleges c WHERE c.slug = 'mvj-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 40824 FROM colleges c WHERE c.slug = 'mvj-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 27800 FROM colleges c WHERE c.slug = 'mvj-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 40310 FROM colleges c WHERE c.slug = 'mvj-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 37530 FROM colleges c WHERE c.slug = 'mvj-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 31969 FROM colleges c WHERE c.slug = 'mvj-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 30024 FROM colleges c WHERE c.slug = 'mvj-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 60400 FROM colleges c WHERE c.slug = 'mvj-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 87580 FROM colleges c WHERE c.slug = 'mvj-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 81540 FROM colleges c WHERE c.slug = 'mvj-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 69460 FROM colleges c WHERE c.slug = 'mvj-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 65232 FROM colleges c WHERE c.slug = 'mvj-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 24400 FROM colleges c WHERE c.slug = 'east-point-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 35380 FROM colleges c WHERE c.slug = 'east-point-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 32940 FROM colleges c WHERE c.slug = 'east-point-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 28059 FROM colleges c WHERE c.slug = 'east-point-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 26352 FROM colleges c WHERE c.slug = 'east-point-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 30400 FROM colleges c WHERE c.slug = 'east-point-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 44080 FROM colleges c WHERE c.slug = 'east-point-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 41040 FROM colleges c WHERE c.slug = 'east-point-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 34960 FROM colleges c WHERE c.slug = 'east-point-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 32832 FROM colleges c WHERE c.slug = 'east-point-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 38400 FROM colleges c WHERE c.slug = 'east-point-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 55680 FROM colleges c WHERE c.slug = 'east-point-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 51840 FROM colleges c WHERE c.slug = 'east-point-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 44160 FROM colleges c WHERE c.slug = 'east-point-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 41472 FROM colleges c WHERE c.slug = 'east-point-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 28400 FROM colleges c WHERE c.slug = 'east-point-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 41180 FROM colleges c WHERE c.slug = 'east-point-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 38340 FROM colleges c WHERE c.slug = 'east-point-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 32659 FROM colleges c WHERE c.slug = 'east-point-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 30672 FROM colleges c WHERE c.slug = 'east-point-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 62200 FROM colleges c WHERE c.slug = 'east-point-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 90190 FROM colleges c WHERE c.slug = 'east-point-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 83970 FROM colleges c WHERE c.slug = 'east-point-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 71530 FROM colleges c WHERE c.slug = 'east-point-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 67176 FROM colleges c WHERE c.slug = 'east-point-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 22000 FROM colleges c WHERE c.slug = 'ks-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 31900 FROM colleges c WHERE c.slug = 'ks-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 29700 FROM colleges c WHERE c.slug = 'ks-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 25299 FROM colleges c WHERE c.slug = 'ks-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 23760 FROM colleges c WHERE c.slug = 'ks-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 28000 FROM colleges c WHERE c.slug = 'ks-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 40600 FROM colleges c WHERE c.slug = 'ks-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 37800 FROM colleges c WHERE c.slug = 'ks-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 32199 FROM colleges c WHERE c.slug = 'ks-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 30240 FROM colleges c WHERE c.slug = 'ks-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 36000 FROM colleges c WHERE c.slug = 'ks-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 52200 FROM colleges c WHERE c.slug = 'ks-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 48600 FROM colleges c WHERE c.slug = 'ks-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 41400 FROM colleges c WHERE c.slug = 'ks-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 38880 FROM colleges c WHERE c.slug = 'ks-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 26000 FROM colleges c WHERE c.slug = 'ks-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 37700 FROM colleges c WHERE c.slug = 'ks-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 35100 FROM colleges c WHERE c.slug = 'ks-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 29899 FROM colleges c WHERE c.slug = 'ks-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 28080 FROM colleges c WHERE c.slug = 'ks-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 55000 FROM colleges c WHERE c.slug = 'ks-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 79750 FROM colleges c WHERE c.slug = 'ks-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 74250 FROM colleges c WHERE c.slug = 'ks-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 63249 FROM colleges c WHERE c.slug = 'ks-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 59400 FROM colleges c WHERE c.slug = 'ks-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 22600 FROM colleges c WHERE c.slug = 'advanced-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 32770 FROM colleges c WHERE c.slug = 'advanced-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 30510 FROM colleges c WHERE c.slug = 'advanced-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 25989 FROM colleges c WHERE c.slug = 'advanced-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 24408 FROM colleges c WHERE c.slug = 'advanced-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 28600 FROM colleges c WHERE c.slug = 'advanced-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 41470 FROM colleges c WHERE c.slug = 'advanced-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 38610 FROM colleges c WHERE c.slug = 'advanced-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 32890 FROM colleges c WHERE c.slug = 'advanced-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 30888 FROM colleges c WHERE c.slug = 'advanced-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 36600 FROM colleges c WHERE c.slug = 'advanced-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 53070 FROM colleges c WHERE c.slug = 'advanced-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 49410 FROM colleges c WHERE c.slug = 'advanced-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 42090 FROM colleges c WHERE c.slug = 'advanced-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 39528 FROM colleges c WHERE c.slug = 'advanced-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 26600 FROM colleges c WHERE c.slug = 'advanced-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 38570 FROM colleges c WHERE c.slug = 'advanced-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 35910 FROM colleges c WHERE c.slug = 'advanced-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 30589 FROM colleges c WHERE c.slug = 'advanced-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 28728 FROM colleges c WHERE c.slug = 'advanced-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 56800 FROM colleges c WHERE c.slug = 'advanced-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 82360 FROM colleges c WHERE c.slug = 'advanced-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 76680 FROM colleges c WHERE c.slug = 'advanced-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 65319 FROM colleges c WHERE c.slug = 'advanced-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 61344 FROM colleges c WHERE c.slug = 'advanced-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 23200 FROM colleges c WHERE c.slug = 'amc-engineering-college'
UNION ALL
SELECT c.id, 'CSE', 'SC', 33640 FROM colleges c WHERE c.slug = 'amc-engineering-college'
UNION ALL
SELECT c.id, 'CSE', 'ST', 31320 FROM colleges c WHERE c.slug = 'amc-engineering-college'
UNION ALL
SELECT c.id, 'CSE', '2A', 26679 FROM colleges c WHERE c.slug = 'amc-engineering-college'
UNION ALL
SELECT c.id, 'CSE', '3A', 25056 FROM colleges c WHERE c.slug = 'amc-engineering-college'
UNION ALL
SELECT c.id, 'ISE', 'GM', 29200 FROM colleges c WHERE c.slug = 'amc-engineering-college'
UNION ALL
SELECT c.id, 'ISE', 'SC', 42340 FROM colleges c WHERE c.slug = 'amc-engineering-college'
UNION ALL
SELECT c.id, 'ISE', 'ST', 39420 FROM colleges c WHERE c.slug = 'amc-engineering-college'
UNION ALL
SELECT c.id, 'ISE', '2A', 33580 FROM colleges c WHERE c.slug = 'amc-engineering-college'
UNION ALL
SELECT c.id, 'ISE', '3A', 31536 FROM colleges c WHERE c.slug = 'amc-engineering-college'
UNION ALL
SELECT c.id, 'ECE', 'GM', 37200 FROM colleges c WHERE c.slug = 'amc-engineering-college'
UNION ALL
SELECT c.id, 'ECE', 'SC', 53940 FROM colleges c WHERE c.slug = 'amc-engineering-college'
UNION ALL
SELECT c.id, 'ECE', 'ST', 50220 FROM colleges c WHERE c.slug = 'amc-engineering-college'
UNION ALL
SELECT c.id, 'ECE', '2A', 42780 FROM colleges c WHERE c.slug = 'amc-engineering-college'
UNION ALL
SELECT c.id, 'ECE', '3A', 40176 FROM colleges c WHERE c.slug = 'amc-engineering-college'
UNION ALL
SELECT c.id, 'AIML', 'GM', 27200 FROM colleges c WHERE c.slug = 'amc-engineering-college'
UNION ALL
SELECT c.id, 'AIML', 'SC', 39440 FROM colleges c WHERE c.slug = 'amc-engineering-college'
UNION ALL
SELECT c.id, 'AIML', 'ST', 36720 FROM colleges c WHERE c.slug = 'amc-engineering-college'
UNION ALL
SELECT c.id, 'AIML', '2A', 31279 FROM colleges c WHERE c.slug = 'amc-engineering-college'
UNION ALL
SELECT c.id, 'AIML', '3A', 29376 FROM colleges c WHERE c.slug = 'amc-engineering-college'
UNION ALL
SELECT c.id, 'ME', 'GM', 58600 FROM colleges c WHERE c.slug = 'amc-engineering-college'
UNION ALL
SELECT c.id, 'ME', 'SC', 84970 FROM colleges c WHERE c.slug = 'amc-engineering-college'
UNION ALL
SELECT c.id, 'ME', 'ST', 79110 FROM colleges c WHERE c.slug = 'amc-engineering-college'
UNION ALL
SELECT c.id, 'ME', '2A', 67390 FROM colleges c WHERE c.slug = 'amc-engineering-college'
UNION ALL
SELECT c.id, 'ME', '3A', 63288 FROM colleges c WHERE c.slug = 'amc-engineering-college'
UNION ALL
SELECT c.id, 'CSE', 'GM', 23800 FROM colleges c WHERE c.slug = 'atria-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 34510 FROM colleges c WHERE c.slug = 'atria-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 32130 FROM colleges c WHERE c.slug = 'atria-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 27369 FROM colleges c WHERE c.slug = 'atria-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 25704 FROM colleges c WHERE c.slug = 'atria-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 29800 FROM colleges c WHERE c.slug = 'atria-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 43210 FROM colleges c WHERE c.slug = 'atria-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 40230 FROM colleges c WHERE c.slug = 'atria-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 34270 FROM colleges c WHERE c.slug = 'atria-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 32184 FROM colleges c WHERE c.slug = 'atria-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 37800 FROM colleges c WHERE c.slug = 'atria-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 54810 FROM colleges c WHERE c.slug = 'atria-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 51030 FROM colleges c WHERE c.slug = 'atria-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 43470 FROM colleges c WHERE c.slug = 'atria-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 40824 FROM colleges c WHERE c.slug = 'atria-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 27800 FROM colleges c WHERE c.slug = 'atria-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 40310 FROM colleges c WHERE c.slug = 'atria-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 37530 FROM colleges c WHERE c.slug = 'atria-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 31969 FROM colleges c WHERE c.slug = 'atria-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 30024 FROM colleges c WHERE c.slug = 'atria-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 60400 FROM colleges c WHERE c.slug = 'atria-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 87580 FROM colleges c WHERE c.slug = 'atria-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 81540 FROM colleges c WHERE c.slug = 'atria-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 69460 FROM colleges c WHERE c.slug = 'atria-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 65232 FROM colleges c WHERE c.slug = 'atria-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 24400 FROM colleges c WHERE c.slug = 'cambridge-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 35380 FROM colleges c WHERE c.slug = 'cambridge-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 32940 FROM colleges c WHERE c.slug = 'cambridge-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 28059 FROM colleges c WHERE c.slug = 'cambridge-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 26352 FROM colleges c WHERE c.slug = 'cambridge-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 30400 FROM colleges c WHERE c.slug = 'cambridge-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 44080 FROM colleges c WHERE c.slug = 'cambridge-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 41040 FROM colleges c WHERE c.slug = 'cambridge-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 34960 FROM colleges c WHERE c.slug = 'cambridge-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 32832 FROM colleges c WHERE c.slug = 'cambridge-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 38400 FROM colleges c WHERE c.slug = 'cambridge-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 55680 FROM colleges c WHERE c.slug = 'cambridge-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 51840 FROM colleges c WHERE c.slug = 'cambridge-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 44160 FROM colleges c WHERE c.slug = 'cambridge-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 41472 FROM colleges c WHERE c.slug = 'cambridge-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 28400 FROM colleges c WHERE c.slug = 'cambridge-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 41180 FROM colleges c WHERE c.slug = 'cambridge-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 38340 FROM colleges c WHERE c.slug = 'cambridge-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 32659 FROM colleges c WHERE c.slug = 'cambridge-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 30672 FROM colleges c WHERE c.slug = 'cambridge-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 62200 FROM colleges c WHERE c.slug = 'cambridge-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 90190 FROM colleges c WHERE c.slug = 'cambridge-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 83970 FROM colleges c WHERE c.slug = 'cambridge-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 71530 FROM colleges c WHERE c.slug = 'cambridge-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 67176 FROM colleges c WHERE c.slug = 'cambridge-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 22000 FROM colleges c WHERE c.slug = 'don-bosco-institute-of-technology-bengaluru'
UNION ALL
SELECT c.id, 'CSE', 'SC', 31900 FROM colleges c WHERE c.slug = 'don-bosco-institute-of-technology-bengaluru'
UNION ALL
SELECT c.id, 'CSE', 'ST', 29700 FROM colleges c WHERE c.slug = 'don-bosco-institute-of-technology-bengaluru'
UNION ALL
SELECT c.id, 'CSE', '2A', 25299 FROM colleges c WHERE c.slug = 'don-bosco-institute-of-technology-bengaluru'
UNION ALL
SELECT c.id, 'CSE', '3A', 23760 FROM colleges c WHERE c.slug = 'don-bosco-institute-of-technology-bengaluru'
UNION ALL
SELECT c.id, 'ISE', 'GM', 28000 FROM colleges c WHERE c.slug = 'don-bosco-institute-of-technology-bengaluru'
UNION ALL
SELECT c.id, 'ISE', 'SC', 40600 FROM colleges c WHERE c.slug = 'don-bosco-institute-of-technology-bengaluru'
UNION ALL
SELECT c.id, 'ISE', 'ST', 37800 FROM colleges c WHERE c.slug = 'don-bosco-institute-of-technology-bengaluru'
UNION ALL
SELECT c.id, 'ISE', '2A', 32199 FROM colleges c WHERE c.slug = 'don-bosco-institute-of-technology-bengaluru'
UNION ALL
SELECT c.id, 'ISE', '3A', 30240 FROM colleges c WHERE c.slug = 'don-bosco-institute-of-technology-bengaluru'
UNION ALL
SELECT c.id, 'ECE', 'GM', 36000 FROM colleges c WHERE c.slug = 'don-bosco-institute-of-technology-bengaluru'
UNION ALL
SELECT c.id, 'ECE', 'SC', 52200 FROM colleges c WHERE c.slug = 'don-bosco-institute-of-technology-bengaluru'
UNION ALL
SELECT c.id, 'ECE', 'ST', 48600 FROM colleges c WHERE c.slug = 'don-bosco-institute-of-technology-bengaluru'
UNION ALL
SELECT c.id, 'ECE', '2A', 41400 FROM colleges c WHERE c.slug = 'don-bosco-institute-of-technology-bengaluru'
UNION ALL
SELECT c.id, 'ECE', '3A', 38880 FROM colleges c WHERE c.slug = 'don-bosco-institute-of-technology-bengaluru'
UNION ALL
SELECT c.id, 'AIML', 'GM', 26000 FROM colleges c WHERE c.slug = 'don-bosco-institute-of-technology-bengaluru'
UNION ALL
SELECT c.id, 'AIML', 'SC', 37700 FROM colleges c WHERE c.slug = 'don-bosco-institute-of-technology-bengaluru'
UNION ALL
SELECT c.id, 'AIML', 'ST', 35100 FROM colleges c WHERE c.slug = 'don-bosco-institute-of-technology-bengaluru'
UNION ALL
SELECT c.id, 'AIML', '2A', 29899 FROM colleges c WHERE c.slug = 'don-bosco-institute-of-technology-bengaluru'
UNION ALL
SELECT c.id, 'AIML', '3A', 28080 FROM colleges c WHERE c.slug = 'don-bosco-institute-of-technology-bengaluru'
UNION ALL
SELECT c.id, 'ME', 'GM', 55000 FROM colleges c WHERE c.slug = 'don-bosco-institute-of-technology-bengaluru'
UNION ALL
SELECT c.id, 'ME', 'SC', 79750 FROM colleges c WHERE c.slug = 'don-bosco-institute-of-technology-bengaluru'
UNION ALL
SELECT c.id, 'ME', 'ST', 74250 FROM colleges c WHERE c.slug = 'don-bosco-institute-of-technology-bengaluru'
UNION ALL
SELECT c.id, 'ME', '2A', 63249 FROM colleges c WHERE c.slug = 'don-bosco-institute-of-technology-bengaluru'
UNION ALL
SELECT c.id, 'ME', '3A', 59400 FROM colleges c WHERE c.slug = 'don-bosco-institute-of-technology-bengaluru'
UNION ALL
SELECT c.id, 'CSE', 'GM', 22600 FROM colleges c WHERE c.slug = 'brindavan-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 32770 FROM colleges c WHERE c.slug = 'brindavan-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 30510 FROM colleges c WHERE c.slug = 'brindavan-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 25989 FROM colleges c WHERE c.slug = 'brindavan-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 24408 FROM colleges c WHERE c.slug = 'brindavan-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 28600 FROM colleges c WHERE c.slug = 'brindavan-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 41470 FROM colleges c WHERE c.slug = 'brindavan-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 38610 FROM colleges c WHERE c.slug = 'brindavan-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 32890 FROM colleges c WHERE c.slug = 'brindavan-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 30888 FROM colleges c WHERE c.slug = 'brindavan-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 36600 FROM colleges c WHERE c.slug = 'brindavan-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 53070 FROM colleges c WHERE c.slug = 'brindavan-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 49410 FROM colleges c WHERE c.slug = 'brindavan-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 42090 FROM colleges c WHERE c.slug = 'brindavan-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 39528 FROM colleges c WHERE c.slug = 'brindavan-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 26600 FROM colleges c WHERE c.slug = 'brindavan-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 38570 FROM colleges c WHERE c.slug = 'brindavan-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 35910 FROM colleges c WHERE c.slug = 'brindavan-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 30589 FROM colleges c WHERE c.slug = 'brindavan-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 28728 FROM colleges c WHERE c.slug = 'brindavan-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 56800 FROM colleges c WHERE c.slug = 'brindavan-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 82360 FROM colleges c WHERE c.slug = 'brindavan-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 76680 FROM colleges c WHERE c.slug = 'brindavan-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 65319 FROM colleges c WHERE c.slug = 'brindavan-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 61344 FROM colleges c WHERE c.slug = 'brindavan-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 23200 FROM colleges c WHERE c.slug = 'btl-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 33640 FROM colleges c WHERE c.slug = 'btl-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 31320 FROM colleges c WHERE c.slug = 'btl-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 26679 FROM colleges c WHERE c.slug = 'btl-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 25056 FROM colleges c WHERE c.slug = 'btl-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 29200 FROM colleges c WHERE c.slug = 'btl-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 42340 FROM colleges c WHERE c.slug = 'btl-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 39420 FROM colleges c WHERE c.slug = 'btl-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 33580 FROM colleges c WHERE c.slug = 'btl-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 31536 FROM colleges c WHERE c.slug = 'btl-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 37200 FROM colleges c WHERE c.slug = 'btl-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 53940 FROM colleges c WHERE c.slug = 'btl-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 50220 FROM colleges c WHERE c.slug = 'btl-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 42780 FROM colleges c WHERE c.slug = 'btl-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 40176 FROM colleges c WHERE c.slug = 'btl-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 27200 FROM colleges c WHERE c.slug = 'btl-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 39440 FROM colleges c WHERE c.slug = 'btl-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 36720 FROM colleges c WHERE c.slug = 'btl-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 31279 FROM colleges c WHERE c.slug = 'btl-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 29376 FROM colleges c WHERE c.slug = 'btl-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 58600 FROM colleges c WHERE c.slug = 'btl-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 84970 FROM colleges c WHERE c.slug = 'btl-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 79110 FROM colleges c WHERE c.slug = 'btl-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 67390 FROM colleges c WHERE c.slug = 'btl-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 63288 FROM colleges c WHERE c.slug = 'btl-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 23800 FROM colleges c WHERE c.slug = 'gopalan-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'CSE', 'SC', 34510 FROM colleges c WHERE c.slug = 'gopalan-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'CSE', 'ST', 32130 FROM colleges c WHERE c.slug = 'gopalan-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'CSE', '2A', 27369 FROM colleges c WHERE c.slug = 'gopalan-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'CSE', '3A', 25704 FROM colleges c WHERE c.slug = 'gopalan-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ISE', 'GM', 29800 FROM colleges c WHERE c.slug = 'gopalan-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ISE', 'SC', 43210 FROM colleges c WHERE c.slug = 'gopalan-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ISE', 'ST', 40230 FROM colleges c WHERE c.slug = 'gopalan-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ISE', '2A', 34270 FROM colleges c WHERE c.slug = 'gopalan-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ISE', '3A', 32184 FROM colleges c WHERE c.slug = 'gopalan-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ECE', 'GM', 37800 FROM colleges c WHERE c.slug = 'gopalan-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ECE', 'SC', 54810 FROM colleges c WHERE c.slug = 'gopalan-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ECE', 'ST', 51030 FROM colleges c WHERE c.slug = 'gopalan-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ECE', '2A', 43470 FROM colleges c WHERE c.slug = 'gopalan-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ECE', '3A', 40824 FROM colleges c WHERE c.slug = 'gopalan-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'AIML', 'GM', 27800 FROM colleges c WHERE c.slug = 'gopalan-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'AIML', 'SC', 40310 FROM colleges c WHERE c.slug = 'gopalan-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'AIML', 'ST', 37530 FROM colleges c WHERE c.slug = 'gopalan-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'AIML', '2A', 31969 FROM colleges c WHERE c.slug = 'gopalan-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'AIML', '3A', 30024 FROM colleges c WHERE c.slug = 'gopalan-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ME', 'GM', 60400 FROM colleges c WHERE c.slug = 'gopalan-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ME', 'SC', 87580 FROM colleges c WHERE c.slug = 'gopalan-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ME', 'ST', 81540 FROM colleges c WHERE c.slug = 'gopalan-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ME', '2A', 69460 FROM colleges c WHERE c.slug = 'gopalan-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ME', '3A', 65232 FROM colleges c WHERE c.slug = 'gopalan-college-of-engineering-and-management'
UNION ALL
SELECT c.id, 'CSE', 'GM', 24400 FROM colleges c WHERE c.slug = 'sri-sairam-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 35380 FROM colleges c WHERE c.slug = 'sri-sairam-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 32940 FROM colleges c WHERE c.slug = 'sri-sairam-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 28059 FROM colleges c WHERE c.slug = 'sri-sairam-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 26352 FROM colleges c WHERE c.slug = 'sri-sairam-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 30400 FROM colleges c WHERE c.slug = 'sri-sairam-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 44080 FROM colleges c WHERE c.slug = 'sri-sairam-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 41040 FROM colleges c WHERE c.slug = 'sri-sairam-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 34960 FROM colleges c WHERE c.slug = 'sri-sairam-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 32832 FROM colleges c WHERE c.slug = 'sri-sairam-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 38400 FROM colleges c WHERE c.slug = 'sri-sairam-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 55680 FROM colleges c WHERE c.slug = 'sri-sairam-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 51840 FROM colleges c WHERE c.slug = 'sri-sairam-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 44160 FROM colleges c WHERE c.slug = 'sri-sairam-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 41472 FROM colleges c WHERE c.slug = 'sri-sairam-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 28400 FROM colleges c WHERE c.slug = 'sri-sairam-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 41180 FROM colleges c WHERE c.slug = 'sri-sairam-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 38340 FROM colleges c WHERE c.slug = 'sri-sairam-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 32659 FROM colleges c WHERE c.slug = 'sri-sairam-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 30672 FROM colleges c WHERE c.slug = 'sri-sairam-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 62200 FROM colleges c WHERE c.slug = 'sri-sairam-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 90190 FROM colleges c WHERE c.slug = 'sri-sairam-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 83970 FROM colleges c WHERE c.slug = 'sri-sairam-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 71530 FROM colleges c WHERE c.slug = 'sri-sairam-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 67176 FROM colleges c WHERE c.slug = 'sri-sairam-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 22000 FROM colleges c WHERE c.slug = 'r-l-jalappa-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 31900 FROM colleges c WHERE c.slug = 'r-l-jalappa-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 29700 FROM colleges c WHERE c.slug = 'r-l-jalappa-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 25299 FROM colleges c WHERE c.slug = 'r-l-jalappa-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 23760 FROM colleges c WHERE c.slug = 'r-l-jalappa-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 28000 FROM colleges c WHERE c.slug = 'r-l-jalappa-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 40600 FROM colleges c WHERE c.slug = 'r-l-jalappa-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 37800 FROM colleges c WHERE c.slug = 'r-l-jalappa-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 32199 FROM colleges c WHERE c.slug = 'r-l-jalappa-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 30240 FROM colleges c WHERE c.slug = 'r-l-jalappa-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 36000 FROM colleges c WHERE c.slug = 'r-l-jalappa-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 52200 FROM colleges c WHERE c.slug = 'r-l-jalappa-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 48600 FROM colleges c WHERE c.slug = 'r-l-jalappa-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 41400 FROM colleges c WHERE c.slug = 'r-l-jalappa-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 38880 FROM colleges c WHERE c.slug = 'r-l-jalappa-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 26000 FROM colleges c WHERE c.slug = 'r-l-jalappa-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 37700 FROM colleges c WHERE c.slug = 'r-l-jalappa-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 35100 FROM colleges c WHERE c.slug = 'r-l-jalappa-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 29899 FROM colleges c WHERE c.slug = 'r-l-jalappa-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 28080 FROM colleges c WHERE c.slug = 'r-l-jalappa-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 55000 FROM colleges c WHERE c.slug = 'r-l-jalappa-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 79750 FROM colleges c WHERE c.slug = 'r-l-jalappa-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 74250 FROM colleges c WHERE c.slug = 'r-l-jalappa-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 63249 FROM colleges c WHERE c.slug = 'r-l-jalappa-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 59400 FROM colleges c WHERE c.slug = 'r-l-jalappa-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 22600 FROM colleges c WHERE c.slug = 'nagarjuna-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 32770 FROM colleges c WHERE c.slug = 'nagarjuna-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 30510 FROM colleges c WHERE c.slug = 'nagarjuna-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 25989 FROM colleges c WHERE c.slug = 'nagarjuna-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 24408 FROM colleges c WHERE c.slug = 'nagarjuna-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 28600 FROM colleges c WHERE c.slug = 'nagarjuna-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 41470 FROM colleges c WHERE c.slug = 'nagarjuna-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 38610 FROM colleges c WHERE c.slug = 'nagarjuna-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 32890 FROM colleges c WHERE c.slug = 'nagarjuna-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 30888 FROM colleges c WHERE c.slug = 'nagarjuna-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 36600 FROM colleges c WHERE c.slug = 'nagarjuna-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 53070 FROM colleges c WHERE c.slug = 'nagarjuna-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 49410 FROM colleges c WHERE c.slug = 'nagarjuna-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 42090 FROM colleges c WHERE c.slug = 'nagarjuna-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 39528 FROM colleges c WHERE c.slug = 'nagarjuna-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 26600 FROM colleges c WHERE c.slug = 'nagarjuna-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 38570 FROM colleges c WHERE c.slug = 'nagarjuna-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 35910 FROM colleges c WHERE c.slug = 'nagarjuna-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 30589 FROM colleges c WHERE c.slug = 'nagarjuna-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 28728 FROM colleges c WHERE c.slug = 'nagarjuna-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 56800 FROM colleges c WHERE c.slug = 'nagarjuna-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 82360 FROM colleges c WHERE c.slug = 'nagarjuna-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 76680 FROM colleges c WHERE c.slug = 'nagarjuna-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 65319 FROM colleges c WHERE c.slug = 'nagarjuna-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 61344 FROM colleges c WHERE c.slug = 'nagarjuna-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 23200 FROM colleges c WHERE c.slug = 't-john-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 33640 FROM colleges c WHERE c.slug = 't-john-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 31320 FROM colleges c WHERE c.slug = 't-john-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 26679 FROM colleges c WHERE c.slug = 't-john-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 25056 FROM colleges c WHERE c.slug = 't-john-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 29200 FROM colleges c WHERE c.slug = 't-john-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 42340 FROM colleges c WHERE c.slug = 't-john-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 39420 FROM colleges c WHERE c.slug = 't-john-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 33580 FROM colleges c WHERE c.slug = 't-john-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 31536 FROM colleges c WHERE c.slug = 't-john-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 37200 FROM colleges c WHERE c.slug = 't-john-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 53940 FROM colleges c WHERE c.slug = 't-john-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 50220 FROM colleges c WHERE c.slug = 't-john-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 42780 FROM colleges c WHERE c.slug = 't-john-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 40176 FROM colleges c WHERE c.slug = 't-john-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 27200 FROM colleges c WHERE c.slug = 't-john-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 39440 FROM colleges c WHERE c.slug = 't-john-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 36720 FROM colleges c WHERE c.slug = 't-john-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 31279 FROM colleges c WHERE c.slug = 't-john-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 29376 FROM colleges c WHERE c.slug = 't-john-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 58600 FROM colleges c WHERE c.slug = 't-john-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 84970 FROM colleges c WHERE c.slug = 't-john-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 79110 FROM colleges c WHERE c.slug = 't-john-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 67390 FROM colleges c WHERE c.slug = 't-john-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 63288 FROM colleges c WHERE c.slug = 't-john-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 23800 FROM colleges c WHERE c.slug = 'sri-revana-siddeshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 34510 FROM colleges c WHERE c.slug = 'sri-revana-siddeshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 32130 FROM colleges c WHERE c.slug = 'sri-revana-siddeshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 27369 FROM colleges c WHERE c.slug = 'sri-revana-siddeshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 25704 FROM colleges c WHERE c.slug = 'sri-revana-siddeshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 29800 FROM colleges c WHERE c.slug = 'sri-revana-siddeshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 43210 FROM colleges c WHERE c.slug = 'sri-revana-siddeshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 40230 FROM colleges c WHERE c.slug = 'sri-revana-siddeshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 34270 FROM colleges c WHERE c.slug = 'sri-revana-siddeshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 32184 FROM colleges c WHERE c.slug = 'sri-revana-siddeshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 37800 FROM colleges c WHERE c.slug = 'sri-revana-siddeshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 54810 FROM colleges c WHERE c.slug = 'sri-revana-siddeshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 51030 FROM colleges c WHERE c.slug = 'sri-revana-siddeshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 43470 FROM colleges c WHERE c.slug = 'sri-revana-siddeshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 40824 FROM colleges c WHERE c.slug = 'sri-revana-siddeshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 27800 FROM colleges c WHERE c.slug = 'sri-revana-siddeshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 40310 FROM colleges c WHERE c.slug = 'sri-revana-siddeshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 37530 FROM colleges c WHERE c.slug = 'sri-revana-siddeshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 31969 FROM colleges c WHERE c.slug = 'sri-revana-siddeshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 30024 FROM colleges c WHERE c.slug = 'sri-revana-siddeshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 60400 FROM colleges c WHERE c.slug = 'sri-revana-siddeshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 87580 FROM colleges c WHERE c.slug = 'sri-revana-siddeshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 81540 FROM colleges c WHERE c.slug = 'sri-revana-siddeshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 69460 FROM colleges c WHERE c.slug = 'sri-revana-siddeshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 65232 FROM colleges c WHERE c.slug = 'sri-revana-siddeshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 24400 FROM colleges c WHERE c.slug = 'kristu-jayanti-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 35380 FROM colleges c WHERE c.slug = 'kristu-jayanti-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 32940 FROM colleges c WHERE c.slug = 'kristu-jayanti-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 28059 FROM colleges c WHERE c.slug = 'kristu-jayanti-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 26352 FROM colleges c WHERE c.slug = 'kristu-jayanti-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 30400 FROM colleges c WHERE c.slug = 'kristu-jayanti-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 44080 FROM colleges c WHERE c.slug = 'kristu-jayanti-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 41040 FROM colleges c WHERE c.slug = 'kristu-jayanti-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 34960 FROM colleges c WHERE c.slug = 'kristu-jayanti-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 32832 FROM colleges c WHERE c.slug = 'kristu-jayanti-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 38400 FROM colleges c WHERE c.slug = 'kristu-jayanti-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 55680 FROM colleges c WHERE c.slug = 'kristu-jayanti-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 51840 FROM colleges c WHERE c.slug = 'kristu-jayanti-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 44160 FROM colleges c WHERE c.slug = 'kristu-jayanti-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 41472 FROM colleges c WHERE c.slug = 'kristu-jayanti-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 28400 FROM colleges c WHERE c.slug = 'kristu-jayanti-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 41180 FROM colleges c WHERE c.slug = 'kristu-jayanti-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 38340 FROM colleges c WHERE c.slug = 'kristu-jayanti-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 32659 FROM colleges c WHERE c.slug = 'kristu-jayanti-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 30672 FROM colleges c WHERE c.slug = 'kristu-jayanti-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 62200 FROM colleges c WHERE c.slug = 'kristu-jayanti-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 90190 FROM colleges c WHERE c.slug = 'kristu-jayanti-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 83970 FROM colleges c WHERE c.slug = 'kristu-jayanti-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 71530 FROM colleges c WHERE c.slug = 'kristu-jayanti-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 67176 FROM colleges c WHERE c.slug = 'kristu-jayanti-college-of-engineering-and-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 22000 FROM colleges c WHERE c.slug = 'oxford-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 31900 FROM colleges c WHERE c.slug = 'oxford-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 29700 FROM colleges c WHERE c.slug = 'oxford-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 25299 FROM colleges c WHERE c.slug = 'oxford-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 23760 FROM colleges c WHERE c.slug = 'oxford-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 28000 FROM colleges c WHERE c.slug = 'oxford-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 40600 FROM colleges c WHERE c.slug = 'oxford-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 37800 FROM colleges c WHERE c.slug = 'oxford-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 32199 FROM colleges c WHERE c.slug = 'oxford-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 30240 FROM colleges c WHERE c.slug = 'oxford-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 36000 FROM colleges c WHERE c.slug = 'oxford-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 52200 FROM colleges c WHERE c.slug = 'oxford-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 48600 FROM colleges c WHERE c.slug = 'oxford-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 41400 FROM colleges c WHERE c.slug = 'oxford-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 38880 FROM colleges c WHERE c.slug = 'oxford-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 26000 FROM colleges c WHERE c.slug = 'oxford-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 37700 FROM colleges c WHERE c.slug = 'oxford-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 35100 FROM colleges c WHERE c.slug = 'oxford-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 29899 FROM colleges c WHERE c.slug = 'oxford-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 28080 FROM colleges c WHERE c.slug = 'oxford-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 55000 FROM colleges c WHERE c.slug = 'oxford-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 79750 FROM colleges c WHERE c.slug = 'oxford-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 74250 FROM colleges c WHERE c.slug = 'oxford-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 63249 FROM colleges c WHERE c.slug = 'oxford-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 59400 FROM colleges c WHERE c.slug = 'oxford-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 22600 FROM colleges c WHERE c.slug = 'g-madegowda-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 32770 FROM colleges c WHERE c.slug = 'g-madegowda-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 30510 FROM colleges c WHERE c.slug = 'g-madegowda-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 25989 FROM colleges c WHERE c.slug = 'g-madegowda-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 24408 FROM colleges c WHERE c.slug = 'g-madegowda-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 28600 FROM colleges c WHERE c.slug = 'g-madegowda-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 41470 FROM colleges c WHERE c.slug = 'g-madegowda-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 38610 FROM colleges c WHERE c.slug = 'g-madegowda-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 32890 FROM colleges c WHERE c.slug = 'g-madegowda-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 30888 FROM colleges c WHERE c.slug = 'g-madegowda-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 36600 FROM colleges c WHERE c.slug = 'g-madegowda-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 53070 FROM colleges c WHERE c.slug = 'g-madegowda-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 49410 FROM colleges c WHERE c.slug = 'g-madegowda-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 42090 FROM colleges c WHERE c.slug = 'g-madegowda-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 39528 FROM colleges c WHERE c.slug = 'g-madegowda-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 26600 FROM colleges c WHERE c.slug = 'g-madegowda-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 38570 FROM colleges c WHERE c.slug = 'g-madegowda-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 35910 FROM colleges c WHERE c.slug = 'g-madegowda-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 30589 FROM colleges c WHERE c.slug = 'g-madegowda-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 28728 FROM colleges c WHERE c.slug = 'g-madegowda-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 56800 FROM colleges c WHERE c.slug = 'g-madegowda-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 82360 FROM colleges c WHERE c.slug = 'g-madegowda-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 76680 FROM colleges c WHERE c.slug = 'g-madegowda-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 65319 FROM colleges c WHERE c.slug = 'g-madegowda-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 61344 FROM colleges c WHERE c.slug = 'g-madegowda-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 23200 FROM colleges c WHERE c.slug = 'kalpataru-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 33640 FROM colleges c WHERE c.slug = 'kalpataru-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 31320 FROM colleges c WHERE c.slug = 'kalpataru-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 26679 FROM colleges c WHERE c.slug = 'kalpataru-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 25056 FROM colleges c WHERE c.slug = 'kalpataru-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 29200 FROM colleges c WHERE c.slug = 'kalpataru-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 42340 FROM colleges c WHERE c.slug = 'kalpataru-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 39420 FROM colleges c WHERE c.slug = 'kalpataru-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 33580 FROM colleges c WHERE c.slug = 'kalpataru-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 31536 FROM colleges c WHERE c.slug = 'kalpataru-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 37200 FROM colleges c WHERE c.slug = 'kalpataru-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 53940 FROM colleges c WHERE c.slug = 'kalpataru-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 50220 FROM colleges c WHERE c.slug = 'kalpataru-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 42780 FROM colleges c WHERE c.slug = 'kalpataru-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 40176 FROM colleges c WHERE c.slug = 'kalpataru-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 27200 FROM colleges c WHERE c.slug = 'kalpataru-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 39440 FROM colleges c WHERE c.slug = 'kalpataru-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 36720 FROM colleges c WHERE c.slug = 'kalpataru-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 31279 FROM colleges c WHERE c.slug = 'kalpataru-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 29376 FROM colleges c WHERE c.slug = 'kalpataru-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 58600 FROM colleges c WHERE c.slug = 'kalpataru-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 84970 FROM colleges c WHERE c.slug = 'kalpataru-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 79110 FROM colleges c WHERE c.slug = 'kalpataru-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 67390 FROM colleges c WHERE c.slug = 'kalpataru-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 63288 FROM colleges c WHERE c.slug = 'kalpataru-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 23800 FROM colleges c WHERE c.slug = 'jss-academy-of-technical-education-bengaluru'
UNION ALL
SELECT c.id, 'CSE', 'SC', 34510 FROM colleges c WHERE c.slug = 'jss-academy-of-technical-education-bengaluru'
UNION ALL
SELECT c.id, 'CSE', 'ST', 32130 FROM colleges c WHERE c.slug = 'jss-academy-of-technical-education-bengaluru'
UNION ALL
SELECT c.id, 'CSE', '2A', 27369 FROM colleges c WHERE c.slug = 'jss-academy-of-technical-education-bengaluru'
UNION ALL
SELECT c.id, 'CSE', '3A', 25704 FROM colleges c WHERE c.slug = 'jss-academy-of-technical-education-bengaluru'
UNION ALL
SELECT c.id, 'ISE', 'GM', 29800 FROM colleges c WHERE c.slug = 'jss-academy-of-technical-education-bengaluru'
UNION ALL
SELECT c.id, 'ISE', 'SC', 43210 FROM colleges c WHERE c.slug = 'jss-academy-of-technical-education-bengaluru'
UNION ALL
SELECT c.id, 'ISE', 'ST', 40230 FROM colleges c WHERE c.slug = 'jss-academy-of-technical-education-bengaluru'
UNION ALL
SELECT c.id, 'ISE', '2A', 34270 FROM colleges c WHERE c.slug = 'jss-academy-of-technical-education-bengaluru'
UNION ALL
SELECT c.id, 'ISE', '3A', 32184 FROM colleges c WHERE c.slug = 'jss-academy-of-technical-education-bengaluru'
UNION ALL
SELECT c.id, 'ECE', 'GM', 37800 FROM colleges c WHERE c.slug = 'jss-academy-of-technical-education-bengaluru'
UNION ALL
SELECT c.id, 'ECE', 'SC', 54810 FROM colleges c WHERE c.slug = 'jss-academy-of-technical-education-bengaluru'
UNION ALL
SELECT c.id, 'ECE', 'ST', 51030 FROM colleges c WHERE c.slug = 'jss-academy-of-technical-education-bengaluru'
UNION ALL
SELECT c.id, 'ECE', '2A', 43470 FROM colleges c WHERE c.slug = 'jss-academy-of-technical-education-bengaluru'
UNION ALL
SELECT c.id, 'ECE', '3A', 40824 FROM colleges c WHERE c.slug = 'jss-academy-of-technical-education-bengaluru'
UNION ALL
SELECT c.id, 'AIML', 'GM', 27800 FROM colleges c WHERE c.slug = 'jss-academy-of-technical-education-bengaluru'
UNION ALL
SELECT c.id, 'AIML', 'SC', 40310 FROM colleges c WHERE c.slug = 'jss-academy-of-technical-education-bengaluru'
UNION ALL
SELECT c.id, 'AIML', 'ST', 37530 FROM colleges c WHERE c.slug = 'jss-academy-of-technical-education-bengaluru'
UNION ALL
SELECT c.id, 'AIML', '2A', 31969 FROM colleges c WHERE c.slug = 'jss-academy-of-technical-education-bengaluru'
UNION ALL
SELECT c.id, 'AIML', '3A', 30024 FROM colleges c WHERE c.slug = 'jss-academy-of-technical-education-bengaluru'
UNION ALL
SELECT c.id, 'ME', 'GM', 60400 FROM colleges c WHERE c.slug = 'jss-academy-of-technical-education-bengaluru'
UNION ALL
SELECT c.id, 'ME', 'SC', 87580 FROM colleges c WHERE c.slug = 'jss-academy-of-technical-education-bengaluru'
UNION ALL
SELECT c.id, 'ME', 'ST', 81540 FROM colleges c WHERE c.slug = 'jss-academy-of-technical-education-bengaluru'
UNION ALL
SELECT c.id, 'ME', '2A', 69460 FROM colleges c WHERE c.slug = 'jss-academy-of-technical-education-bengaluru'
UNION ALL
SELECT c.id, 'ME', '3A', 65232 FROM colleges c WHERE c.slug = 'jss-academy-of-technical-education-bengaluru'
UNION ALL
SELECT c.id, 'CSE', 'GM', 24400 FROM colleges c WHERE c.slug = 'government-engineering-college-haveri'
UNION ALL
SELECT c.id, 'CSE', 'SC', 35380 FROM colleges c WHERE c.slug = 'government-engineering-college-haveri'
UNION ALL
SELECT c.id, 'CSE', 'ST', 32940 FROM colleges c WHERE c.slug = 'government-engineering-college-haveri'
UNION ALL
SELECT c.id, 'CSE', '2A', 28059 FROM colleges c WHERE c.slug = 'government-engineering-college-haveri'
UNION ALL
SELECT c.id, 'CSE', '3A', 26352 FROM colleges c WHERE c.slug = 'government-engineering-college-haveri'
UNION ALL
SELECT c.id, 'ISE', 'GM', 30400 FROM colleges c WHERE c.slug = 'government-engineering-college-haveri'
UNION ALL
SELECT c.id, 'ISE', 'SC', 44080 FROM colleges c WHERE c.slug = 'government-engineering-college-haveri'
UNION ALL
SELECT c.id, 'ISE', 'ST', 41040 FROM colleges c WHERE c.slug = 'government-engineering-college-haveri'
UNION ALL
SELECT c.id, 'ISE', '2A', 34960 FROM colleges c WHERE c.slug = 'government-engineering-college-haveri'
UNION ALL
SELECT c.id, 'ISE', '3A', 32832 FROM colleges c WHERE c.slug = 'government-engineering-college-haveri'
UNION ALL
SELECT c.id, 'ECE', 'GM', 38400 FROM colleges c WHERE c.slug = 'government-engineering-college-haveri'
UNION ALL
SELECT c.id, 'ECE', 'SC', 55680 FROM colleges c WHERE c.slug = 'government-engineering-college-haveri'
UNION ALL
SELECT c.id, 'ECE', 'ST', 51840 FROM colleges c WHERE c.slug = 'government-engineering-college-haveri'
UNION ALL
SELECT c.id, 'ECE', '2A', 44160 FROM colleges c WHERE c.slug = 'government-engineering-college-haveri'
UNION ALL
SELECT c.id, 'ECE', '3A', 41472 FROM colleges c WHERE c.slug = 'government-engineering-college-haveri'
UNION ALL
SELECT c.id, 'AIML', 'GM', 28400 FROM colleges c WHERE c.slug = 'government-engineering-college-haveri'
UNION ALL
SELECT c.id, 'AIML', 'SC', 41180 FROM colleges c WHERE c.slug = 'government-engineering-college-haveri'
UNION ALL
SELECT c.id, 'AIML', 'ST', 38340 FROM colleges c WHERE c.slug = 'government-engineering-college-haveri'
UNION ALL
SELECT c.id, 'AIML', '2A', 32659 FROM colleges c WHERE c.slug = 'government-engineering-college-haveri'
UNION ALL
SELECT c.id, 'AIML', '3A', 30672 FROM colleges c WHERE c.slug = 'government-engineering-college-haveri'
UNION ALL
SELECT c.id, 'ME', 'GM', 62200 FROM colleges c WHERE c.slug = 'government-engineering-college-haveri'
UNION ALL
SELECT c.id, 'ME', 'SC', 90190 FROM colleges c WHERE c.slug = 'government-engineering-college-haveri'
UNION ALL
SELECT c.id, 'ME', 'ST', 83970 FROM colleges c WHERE c.slug = 'government-engineering-college-haveri'
UNION ALL
SELECT c.id, 'ME', '2A', 71530 FROM colleges c WHERE c.slug = 'government-engineering-college-haveri'
UNION ALL
SELECT c.id, 'ME', '3A', 67176 FROM colleges c WHERE c.slug = 'government-engineering-college-haveri'
UNION ALL
SELECT c.id, 'CSE', 'GM', 22000 FROM colleges c WHERE c.slug = 'government-engineering-college-kushalnagar'
UNION ALL
SELECT c.id, 'CSE', 'SC', 31900 FROM colleges c WHERE c.slug = 'government-engineering-college-kushalnagar'
UNION ALL
SELECT c.id, 'CSE', 'ST', 29700 FROM colleges c WHERE c.slug = 'government-engineering-college-kushalnagar'
UNION ALL
SELECT c.id, 'CSE', '2A', 25299 FROM colleges c WHERE c.slug = 'government-engineering-college-kushalnagar'
UNION ALL
SELECT c.id, 'CSE', '3A', 23760 FROM colleges c WHERE c.slug = 'government-engineering-college-kushalnagar'
UNION ALL
SELECT c.id, 'ISE', 'GM', 28000 FROM colleges c WHERE c.slug = 'government-engineering-college-kushalnagar'
UNION ALL
SELECT c.id, 'ISE', 'SC', 40600 FROM colleges c WHERE c.slug = 'government-engineering-college-kushalnagar'
UNION ALL
SELECT c.id, 'ISE', 'ST', 37800 FROM colleges c WHERE c.slug = 'government-engineering-college-kushalnagar'
UNION ALL
SELECT c.id, 'ISE', '2A', 32199 FROM colleges c WHERE c.slug = 'government-engineering-college-kushalnagar'
UNION ALL
SELECT c.id, 'ISE', '3A', 30240 FROM colleges c WHERE c.slug = 'government-engineering-college-kushalnagar'
UNION ALL
SELECT c.id, 'ECE', 'GM', 36000 FROM colleges c WHERE c.slug = 'government-engineering-college-kushalnagar'
UNION ALL
SELECT c.id, 'ECE', 'SC', 52200 FROM colleges c WHERE c.slug = 'government-engineering-college-kushalnagar'
UNION ALL
SELECT c.id, 'ECE', 'ST', 48600 FROM colleges c WHERE c.slug = 'government-engineering-college-kushalnagar'
UNION ALL
SELECT c.id, 'ECE', '2A', 41400 FROM colleges c WHERE c.slug = 'government-engineering-college-kushalnagar'
UNION ALL
SELECT c.id, 'ECE', '3A', 38880 FROM colleges c WHERE c.slug = 'government-engineering-college-kushalnagar'
UNION ALL
SELECT c.id, 'AIML', 'GM', 26000 FROM colleges c WHERE c.slug = 'government-engineering-college-kushalnagar'
UNION ALL
SELECT c.id, 'AIML', 'SC', 37700 FROM colleges c WHERE c.slug = 'government-engineering-college-kushalnagar'
UNION ALL
SELECT c.id, 'AIML', 'ST', 35100 FROM colleges c WHERE c.slug = 'government-engineering-college-kushalnagar'
UNION ALL
SELECT c.id, 'AIML', '2A', 29899 FROM colleges c WHERE c.slug = 'government-engineering-college-kushalnagar'
UNION ALL
SELECT c.id, 'AIML', '3A', 28080 FROM colleges c WHERE c.slug = 'government-engineering-college-kushalnagar'
UNION ALL
SELECT c.id, 'ME', 'GM', 55000 FROM colleges c WHERE c.slug = 'government-engineering-college-kushalnagar'
UNION ALL
SELECT c.id, 'ME', 'SC', 79750 FROM colleges c WHERE c.slug = 'government-engineering-college-kushalnagar'
UNION ALL
SELECT c.id, 'ME', 'ST', 74250 FROM colleges c WHERE c.slug = 'government-engineering-college-kushalnagar'
UNION ALL
SELECT c.id, 'ME', '2A', 63249 FROM colleges c WHERE c.slug = 'government-engineering-college-kushalnagar'
UNION ALL
SELECT c.id, 'ME', '3A', 59400 FROM colleges c WHERE c.slug = 'government-engineering-college-kushalnagar'
UNION ALL
SELECT c.id, 'CSE', 'GM', 22600 FROM colleges c WHERE c.slug = 'sjm-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 32770 FROM colleges c WHERE c.slug = 'sjm-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 30510 FROM colleges c WHERE c.slug = 'sjm-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 25989 FROM colleges c WHERE c.slug = 'sjm-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 24408 FROM colleges c WHERE c.slug = 'sjm-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 28600 FROM colleges c WHERE c.slug = 'sjm-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 41470 FROM colleges c WHERE c.slug = 'sjm-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 38610 FROM colleges c WHERE c.slug = 'sjm-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 32890 FROM colleges c WHERE c.slug = 'sjm-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 30888 FROM colleges c WHERE c.slug = 'sjm-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 36600 FROM colleges c WHERE c.slug = 'sjm-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 53070 FROM colleges c WHERE c.slug = 'sjm-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 49410 FROM colleges c WHERE c.slug = 'sjm-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 42090 FROM colleges c WHERE c.slug = 'sjm-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 39528 FROM colleges c WHERE c.slug = 'sjm-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 26600 FROM colleges c WHERE c.slug = 'sjm-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 38570 FROM colleges c WHERE c.slug = 'sjm-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 35910 FROM colleges c WHERE c.slug = 'sjm-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 30589 FROM colleges c WHERE c.slug = 'sjm-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 28728 FROM colleges c WHERE c.slug = 'sjm-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 56800 FROM colleges c WHERE c.slug = 'sjm-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 82360 FROM colleges c WHERE c.slug = 'sjm-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 76680 FROM colleges c WHERE c.slug = 'sjm-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 65319 FROM colleges c WHERE c.slug = 'sjm-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 61344 FROM colleges c WHERE c.slug = 'sjm-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 23200 FROM colleges c WHERE c.slug = 'bapuji-academy-of-management-and-research-engg'
UNION ALL
SELECT c.id, 'CSE', 'SC', 33640 FROM colleges c WHERE c.slug = 'bapuji-academy-of-management-and-research-engg'
UNION ALL
SELECT c.id, 'CSE', 'ST', 31320 FROM colleges c WHERE c.slug = 'bapuji-academy-of-management-and-research-engg'
UNION ALL
SELECT c.id, 'CSE', '2A', 26679 FROM colleges c WHERE c.slug = 'bapuji-academy-of-management-and-research-engg'
UNION ALL
SELECT c.id, 'CSE', '3A', 25056 FROM colleges c WHERE c.slug = 'bapuji-academy-of-management-and-research-engg'
UNION ALL
SELECT c.id, 'ISE', 'GM', 29200 FROM colleges c WHERE c.slug = 'bapuji-academy-of-management-and-research-engg'
UNION ALL
SELECT c.id, 'ISE', 'SC', 42340 FROM colleges c WHERE c.slug = 'bapuji-academy-of-management-and-research-engg'
UNION ALL
SELECT c.id, 'ISE', 'ST', 39420 FROM colleges c WHERE c.slug = 'bapuji-academy-of-management-and-research-engg'
UNION ALL
SELECT c.id, 'ISE', '2A', 33580 FROM colleges c WHERE c.slug = 'bapuji-academy-of-management-and-research-engg'
UNION ALL
SELECT c.id, 'ISE', '3A', 31536 FROM colleges c WHERE c.slug = 'bapuji-academy-of-management-and-research-engg'
UNION ALL
SELECT c.id, 'ECE', 'GM', 37200 FROM colleges c WHERE c.slug = 'bapuji-academy-of-management-and-research-engg'
UNION ALL
SELECT c.id, 'ECE', 'SC', 53940 FROM colleges c WHERE c.slug = 'bapuji-academy-of-management-and-research-engg'
UNION ALL
SELECT c.id, 'ECE', 'ST', 50220 FROM colleges c WHERE c.slug = 'bapuji-academy-of-management-and-research-engg'
UNION ALL
SELECT c.id, 'ECE', '2A', 42780 FROM colleges c WHERE c.slug = 'bapuji-academy-of-management-and-research-engg'
UNION ALL
SELECT c.id, 'ECE', '3A', 40176 FROM colleges c WHERE c.slug = 'bapuji-academy-of-management-and-research-engg'
UNION ALL
SELECT c.id, 'AIML', 'GM', 27200 FROM colleges c WHERE c.slug = 'bapuji-academy-of-management-and-research-engg'
UNION ALL
SELECT c.id, 'AIML', 'SC', 39440 FROM colleges c WHERE c.slug = 'bapuji-academy-of-management-and-research-engg'
UNION ALL
SELECT c.id, 'AIML', 'ST', 36720 FROM colleges c WHERE c.slug = 'bapuji-academy-of-management-and-research-engg'
UNION ALL
SELECT c.id, 'AIML', '2A', 31279 FROM colleges c WHERE c.slug = 'bapuji-academy-of-management-and-research-engg'
UNION ALL
SELECT c.id, 'AIML', '3A', 29376 FROM colleges c WHERE c.slug = 'bapuji-academy-of-management-and-research-engg'
UNION ALL
SELECT c.id, 'ME', 'GM', 58600 FROM colleges c WHERE c.slug = 'bapuji-academy-of-management-and-research-engg'
UNION ALL
SELECT c.id, 'ME', 'SC', 84970 FROM colleges c WHERE c.slug = 'bapuji-academy-of-management-and-research-engg'
UNION ALL
SELECT c.id, 'ME', 'ST', 79110 FROM colleges c WHERE c.slug = 'bapuji-academy-of-management-and-research-engg'
UNION ALL
SELECT c.id, 'ME', '2A', 67390 FROM colleges c WHERE c.slug = 'bapuji-academy-of-management-and-research-engg'
UNION ALL
SELECT c.id, 'ME', '3A', 63288 FROM colleges c WHERE c.slug = 'bapuji-academy-of-management-and-research-engg'
UNION ALL
SELECT c.id, 'CSE', 'GM', 23800 FROM colleges c WHERE c.slug = 'navkis-college-of-engineering-hassan'
UNION ALL
SELECT c.id, 'CSE', 'SC', 34510 FROM colleges c WHERE c.slug = 'navkis-college-of-engineering-hassan'
UNION ALL
SELECT c.id, 'CSE', 'ST', 32130 FROM colleges c WHERE c.slug = 'navkis-college-of-engineering-hassan'
UNION ALL
SELECT c.id, 'CSE', '2A', 27369 FROM colleges c WHERE c.slug = 'navkis-college-of-engineering-hassan'
UNION ALL
SELECT c.id, 'CSE', '3A', 25704 FROM colleges c WHERE c.slug = 'navkis-college-of-engineering-hassan'
UNION ALL
SELECT c.id, 'ISE', 'GM', 29800 FROM colleges c WHERE c.slug = 'navkis-college-of-engineering-hassan'
UNION ALL
SELECT c.id, 'ISE', 'SC', 43210 FROM colleges c WHERE c.slug = 'navkis-college-of-engineering-hassan'
UNION ALL
SELECT c.id, 'ISE', 'ST', 40230 FROM colleges c WHERE c.slug = 'navkis-college-of-engineering-hassan'
UNION ALL
SELECT c.id, 'ISE', '2A', 34270 FROM colleges c WHERE c.slug = 'navkis-college-of-engineering-hassan'
UNION ALL
SELECT c.id, 'ISE', '3A', 32184 FROM colleges c WHERE c.slug = 'navkis-college-of-engineering-hassan'
UNION ALL
SELECT c.id, 'ECE', 'GM', 37800 FROM colleges c WHERE c.slug = 'navkis-college-of-engineering-hassan'
UNION ALL
SELECT c.id, 'ECE', 'SC', 54810 FROM colleges c WHERE c.slug = 'navkis-college-of-engineering-hassan'
UNION ALL
SELECT c.id, 'ECE', 'ST', 51030 FROM colleges c WHERE c.slug = 'navkis-college-of-engineering-hassan'
UNION ALL
SELECT c.id, 'ECE', '2A', 43470 FROM colleges c WHERE c.slug = 'navkis-college-of-engineering-hassan'
UNION ALL
SELECT c.id, 'ECE', '3A', 40824 FROM colleges c WHERE c.slug = 'navkis-college-of-engineering-hassan'
UNION ALL
SELECT c.id, 'AIML', 'GM', 27800 FROM colleges c WHERE c.slug = 'navkis-college-of-engineering-hassan'
UNION ALL
SELECT c.id, 'AIML', 'SC', 40310 FROM colleges c WHERE c.slug = 'navkis-college-of-engineering-hassan'
UNION ALL
SELECT c.id, 'AIML', 'ST', 37530 FROM colleges c WHERE c.slug = 'navkis-college-of-engineering-hassan'
UNION ALL
SELECT c.id, 'AIML', '2A', 31969 FROM colleges c WHERE c.slug = 'navkis-college-of-engineering-hassan'
UNION ALL
SELECT c.id, 'AIML', '3A', 30024 FROM colleges c WHERE c.slug = 'navkis-college-of-engineering-hassan'
UNION ALL
SELECT c.id, 'ME', 'GM', 60400 FROM colleges c WHERE c.slug = 'navkis-college-of-engineering-hassan'
UNION ALL
SELECT c.id, 'ME', 'SC', 87580 FROM colleges c WHERE c.slug = 'navkis-college-of-engineering-hassan'
UNION ALL
SELECT c.id, 'ME', 'ST', 81540 FROM colleges c WHERE c.slug = 'navkis-college-of-engineering-hassan'
UNION ALL
SELECT c.id, 'ME', '2A', 69460 FROM colleges c WHERE c.slug = 'navkis-college-of-engineering-hassan'
UNION ALL
SELECT c.id, 'ME', '3A', 65232 FROM colleges c WHERE c.slug = 'navkis-college-of-engineering-hassan'
UNION ALL
SELECT c.id, 'CSE', 'GM', 24400 FROM colleges c WHERE c.slug = 'rajarajeshwari-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 35380 FROM colleges c WHERE c.slug = 'rajarajeshwari-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 32940 FROM colleges c WHERE c.slug = 'rajarajeshwari-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 28059 FROM colleges c WHERE c.slug = 'rajarajeshwari-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 26352 FROM colleges c WHERE c.slug = 'rajarajeshwari-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 30400 FROM colleges c WHERE c.slug = 'rajarajeshwari-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 44080 FROM colleges c WHERE c.slug = 'rajarajeshwari-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 41040 FROM colleges c WHERE c.slug = 'rajarajeshwari-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 34960 FROM colleges c WHERE c.slug = 'rajarajeshwari-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 32832 FROM colleges c WHERE c.slug = 'rajarajeshwari-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 38400 FROM colleges c WHERE c.slug = 'rajarajeshwari-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 55680 FROM colleges c WHERE c.slug = 'rajarajeshwari-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 51840 FROM colleges c WHERE c.slug = 'rajarajeshwari-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 44160 FROM colleges c WHERE c.slug = 'rajarajeshwari-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 41472 FROM colleges c WHERE c.slug = 'rajarajeshwari-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 28400 FROM colleges c WHERE c.slug = 'rajarajeshwari-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 41180 FROM colleges c WHERE c.slug = 'rajarajeshwari-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 38340 FROM colleges c WHERE c.slug = 'rajarajeshwari-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 32659 FROM colleges c WHERE c.slug = 'rajarajeshwari-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 30672 FROM colleges c WHERE c.slug = 'rajarajeshwari-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 62200 FROM colleges c WHERE c.slug = 'rajarajeshwari-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 90190 FROM colleges c WHERE c.slug = 'rajarajeshwari-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 83970 FROM colleges c WHERE c.slug = 'rajarajeshwari-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 71530 FROM colleges c WHERE c.slug = 'rajarajeshwari-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 67176 FROM colleges c WHERE c.slug = 'rajarajeshwari-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 22000 FROM colleges c WHERE c.slug = 'east-west-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 31900 FROM colleges c WHERE c.slug = 'east-west-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 29700 FROM colleges c WHERE c.slug = 'east-west-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 25299 FROM colleges c WHERE c.slug = 'east-west-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 23760 FROM colleges c WHERE c.slug = 'east-west-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 28000 FROM colleges c WHERE c.slug = 'east-west-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 40600 FROM colleges c WHERE c.slug = 'east-west-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 37800 FROM colleges c WHERE c.slug = 'east-west-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 32199 FROM colleges c WHERE c.slug = 'east-west-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 30240 FROM colleges c WHERE c.slug = 'east-west-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 36000 FROM colleges c WHERE c.slug = 'east-west-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 52200 FROM colleges c WHERE c.slug = 'east-west-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 48600 FROM colleges c WHERE c.slug = 'east-west-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 41400 FROM colleges c WHERE c.slug = 'east-west-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 38880 FROM colleges c WHERE c.slug = 'east-west-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 26000 FROM colleges c WHERE c.slug = 'east-west-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 37700 FROM colleges c WHERE c.slug = 'east-west-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 35100 FROM colleges c WHERE c.slug = 'east-west-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 29899 FROM colleges c WHERE c.slug = 'east-west-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 28080 FROM colleges c WHERE c.slug = 'east-west-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 55000 FROM colleges c WHERE c.slug = 'east-west-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 79750 FROM colleges c WHERE c.slug = 'east-west-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 74250 FROM colleges c WHERE c.slug = 'east-west-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 63249 FROM colleges c WHERE c.slug = 'east-west-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 59400 FROM colleges c WHERE c.slug = 'east-west-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 22600 FROM colleges c WHERE c.slug = 'bangalore-technological-institute'
UNION ALL
SELECT c.id, 'CSE', 'SC', 32770 FROM colleges c WHERE c.slug = 'bangalore-technological-institute'
UNION ALL
SELECT c.id, 'CSE', 'ST', 30510 FROM colleges c WHERE c.slug = 'bangalore-technological-institute'
UNION ALL
SELECT c.id, 'CSE', '2A', 25989 FROM colleges c WHERE c.slug = 'bangalore-technological-institute'
UNION ALL
SELECT c.id, 'CSE', '3A', 24408 FROM colleges c WHERE c.slug = 'bangalore-technological-institute'
UNION ALL
SELECT c.id, 'ISE', 'GM', 28600 FROM colleges c WHERE c.slug = 'bangalore-technological-institute'
UNION ALL
SELECT c.id, 'ISE', 'SC', 41470 FROM colleges c WHERE c.slug = 'bangalore-technological-institute'
UNION ALL
SELECT c.id, 'ISE', 'ST', 38610 FROM colleges c WHERE c.slug = 'bangalore-technological-institute'
UNION ALL
SELECT c.id, 'ISE', '2A', 32890 FROM colleges c WHERE c.slug = 'bangalore-technological-institute'
UNION ALL
SELECT c.id, 'ISE', '3A', 30888 FROM colleges c WHERE c.slug = 'bangalore-technological-institute'
UNION ALL
SELECT c.id, 'ECE', 'GM', 36600 FROM colleges c WHERE c.slug = 'bangalore-technological-institute'
UNION ALL
SELECT c.id, 'ECE', 'SC', 53070 FROM colleges c WHERE c.slug = 'bangalore-technological-institute'
UNION ALL
SELECT c.id, 'ECE', 'ST', 49410 FROM colleges c WHERE c.slug = 'bangalore-technological-institute'
UNION ALL
SELECT c.id, 'ECE', '2A', 42090 FROM colleges c WHERE c.slug = 'bangalore-technological-institute'
UNION ALL
SELECT c.id, 'ECE', '3A', 39528 FROM colleges c WHERE c.slug = 'bangalore-technological-institute'
UNION ALL
SELECT c.id, 'AIML', 'GM', 26600 FROM colleges c WHERE c.slug = 'bangalore-technological-institute'
UNION ALL
SELECT c.id, 'AIML', 'SC', 38570 FROM colleges c WHERE c.slug = 'bangalore-technological-institute'
UNION ALL
SELECT c.id, 'AIML', 'ST', 35910 FROM colleges c WHERE c.slug = 'bangalore-technological-institute'
UNION ALL
SELECT c.id, 'AIML', '2A', 30589 FROM colleges c WHERE c.slug = 'bangalore-technological-institute'
UNION ALL
SELECT c.id, 'AIML', '3A', 28728 FROM colleges c WHERE c.slug = 'bangalore-technological-institute'
UNION ALL
SELECT c.id, 'ME', 'GM', 56800 FROM colleges c WHERE c.slug = 'bangalore-technological-institute'
UNION ALL
SELECT c.id, 'ME', 'SC', 82360 FROM colleges c WHERE c.slug = 'bangalore-technological-institute'
UNION ALL
SELECT c.id, 'ME', 'ST', 76680 FROM colleges c WHERE c.slug = 'bangalore-technological-institute'
UNION ALL
SELECT c.id, 'ME', '2A', 65319 FROM colleges c WHERE c.slug = 'bangalore-technological-institute'
UNION ALL
SELECT c.id, 'ME', '3A', 61344 FROM colleges c WHERE c.slug = 'bangalore-technological-institute'
UNION ALL
SELECT c.id, 'CSE', 'GM', 23200 FROM colleges c WHERE c.slug = 'sri-krishna-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 33640 FROM colleges c WHERE c.slug = 'sri-krishna-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 31320 FROM colleges c WHERE c.slug = 'sri-krishna-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 26679 FROM colleges c WHERE c.slug = 'sri-krishna-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 25056 FROM colleges c WHERE c.slug = 'sri-krishna-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 29200 FROM colleges c WHERE c.slug = 'sri-krishna-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 42340 FROM colleges c WHERE c.slug = 'sri-krishna-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 39420 FROM colleges c WHERE c.slug = 'sri-krishna-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 33580 FROM colleges c WHERE c.slug = 'sri-krishna-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 31536 FROM colleges c WHERE c.slug = 'sri-krishna-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 37200 FROM colleges c WHERE c.slug = 'sri-krishna-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 53940 FROM colleges c WHERE c.slug = 'sri-krishna-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 50220 FROM colleges c WHERE c.slug = 'sri-krishna-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 42780 FROM colleges c WHERE c.slug = 'sri-krishna-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 40176 FROM colleges c WHERE c.slug = 'sri-krishna-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 27200 FROM colleges c WHERE c.slug = 'sri-krishna-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 39440 FROM colleges c WHERE c.slug = 'sri-krishna-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 36720 FROM colleges c WHERE c.slug = 'sri-krishna-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 31279 FROM colleges c WHERE c.slug = 'sri-krishna-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 29376 FROM colleges c WHERE c.slug = 'sri-krishna-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 58600 FROM colleges c WHERE c.slug = 'sri-krishna-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 84970 FROM colleges c WHERE c.slug = 'sri-krishna-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 79110 FROM colleges c WHERE c.slug = 'sri-krishna-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 67390 FROM colleges c WHERE c.slug = 'sri-krishna-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 63288 FROM colleges c WHERE c.slug = 'sri-krishna-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 23800 FROM colleges c WHERE c.slug = 'acharaya-patashala-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 34510 FROM colleges c WHERE c.slug = 'acharaya-patashala-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 32130 FROM colleges c WHERE c.slug = 'acharaya-patashala-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 27369 FROM colleges c WHERE c.slug = 'acharaya-patashala-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 25704 FROM colleges c WHERE c.slug = 'acharaya-patashala-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 29800 FROM colleges c WHERE c.slug = 'acharaya-patashala-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 43210 FROM colleges c WHERE c.slug = 'acharaya-patashala-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 40230 FROM colleges c WHERE c.slug = 'acharaya-patashala-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 34270 FROM colleges c WHERE c.slug = 'acharaya-patashala-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 32184 FROM colleges c WHERE c.slug = 'acharaya-patashala-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 37800 FROM colleges c WHERE c.slug = 'acharaya-patashala-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 54810 FROM colleges c WHERE c.slug = 'acharaya-patashala-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 51030 FROM colleges c WHERE c.slug = 'acharaya-patashala-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 43470 FROM colleges c WHERE c.slug = 'acharaya-patashala-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 40824 FROM colleges c WHERE c.slug = 'acharaya-patashala-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 27800 FROM colleges c WHERE c.slug = 'acharaya-patashala-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 40310 FROM colleges c WHERE c.slug = 'acharaya-patashala-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 37530 FROM colleges c WHERE c.slug = 'acharaya-patashala-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 31969 FROM colleges c WHERE c.slug = 'acharaya-patashala-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 30024 FROM colleges c WHERE c.slug = 'acharaya-patashala-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 60400 FROM colleges c WHERE c.slug = 'acharaya-patashala-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 87580 FROM colleges c WHERE c.slug = 'acharaya-patashala-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 81540 FROM colleges c WHERE c.slug = 'acharaya-patashala-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 69460 FROM colleges c WHERE c.slug = 'acharaya-patashala-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 65232 FROM colleges c WHERE c.slug = 'acharaya-patashala-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 24400 FROM colleges c WHERE c.slug = 'government-engineering-college-gangavati'
UNION ALL
SELECT c.id, 'CSE', 'SC', 35380 FROM colleges c WHERE c.slug = 'government-engineering-college-gangavati'
UNION ALL
SELECT c.id, 'CSE', 'ST', 32940 FROM colleges c WHERE c.slug = 'government-engineering-college-gangavati'
UNION ALL
SELECT c.id, 'CSE', '2A', 28059 FROM colleges c WHERE c.slug = 'government-engineering-college-gangavati'
UNION ALL
SELECT c.id, 'CSE', '3A', 26352 FROM colleges c WHERE c.slug = 'government-engineering-college-gangavati'
UNION ALL
SELECT c.id, 'ISE', 'GM', 30400 FROM colleges c WHERE c.slug = 'government-engineering-college-gangavati'
UNION ALL
SELECT c.id, 'ISE', 'SC', 44080 FROM colleges c WHERE c.slug = 'government-engineering-college-gangavati'
UNION ALL
SELECT c.id, 'ISE', 'ST', 41040 FROM colleges c WHERE c.slug = 'government-engineering-college-gangavati'
UNION ALL
SELECT c.id, 'ISE', '2A', 34960 FROM colleges c WHERE c.slug = 'government-engineering-college-gangavati'
UNION ALL
SELECT c.id, 'ISE', '3A', 32832 FROM colleges c WHERE c.slug = 'government-engineering-college-gangavati'
UNION ALL
SELECT c.id, 'ECE', 'GM', 38400 FROM colleges c WHERE c.slug = 'government-engineering-college-gangavati'
UNION ALL
SELECT c.id, 'ECE', 'SC', 55680 FROM colleges c WHERE c.slug = 'government-engineering-college-gangavati'
UNION ALL
SELECT c.id, 'ECE', 'ST', 51840 FROM colleges c WHERE c.slug = 'government-engineering-college-gangavati'
UNION ALL
SELECT c.id, 'ECE', '2A', 44160 FROM colleges c WHERE c.slug = 'government-engineering-college-gangavati'
UNION ALL
SELECT c.id, 'ECE', '3A', 41472 FROM colleges c WHERE c.slug = 'government-engineering-college-gangavati'
UNION ALL
SELECT c.id, 'AIML', 'GM', 28400 FROM colleges c WHERE c.slug = 'government-engineering-college-gangavati'
UNION ALL
SELECT c.id, 'AIML', 'SC', 41180 FROM colleges c WHERE c.slug = 'government-engineering-college-gangavati'
UNION ALL
SELECT c.id, 'AIML', 'ST', 38340 FROM colleges c WHERE c.slug = 'government-engineering-college-gangavati'
UNION ALL
SELECT c.id, 'AIML', '2A', 32659 FROM colleges c WHERE c.slug = 'government-engineering-college-gangavati'
UNION ALL
SELECT c.id, 'AIML', '3A', 30672 FROM colleges c WHERE c.slug = 'government-engineering-college-gangavati'
UNION ALL
SELECT c.id, 'ME', 'GM', 62200 FROM colleges c WHERE c.slug = 'government-engineering-college-gangavati'
UNION ALL
SELECT c.id, 'ME', 'SC', 90190 FROM colleges c WHERE c.slug = 'government-engineering-college-gangavati'
UNION ALL
SELECT c.id, 'ME', 'ST', 83970 FROM colleges c WHERE c.slug = 'government-engineering-college-gangavati'
UNION ALL
SELECT c.id, 'ME', '2A', 71530 FROM colleges c WHERE c.slug = 'government-engineering-college-gangavati'
UNION ALL
SELECT c.id, 'ME', '3A', 67176 FROM colleges c WHERE c.slug = 'government-engineering-college-gangavati'
UNION ALL
SELECT c.id, 'CSE', 'GM', 22000 FROM colleges c WHERE c.slug = 'government-engineering-college-karwar'
UNION ALL
SELECT c.id, 'CSE', 'SC', 31900 FROM colleges c WHERE c.slug = 'government-engineering-college-karwar'
UNION ALL
SELECT c.id, 'CSE', 'ST', 29700 FROM colleges c WHERE c.slug = 'government-engineering-college-karwar'
UNION ALL
SELECT c.id, 'CSE', '2A', 25299 FROM colleges c WHERE c.slug = 'government-engineering-college-karwar'
UNION ALL
SELECT c.id, 'CSE', '3A', 23760 FROM colleges c WHERE c.slug = 'government-engineering-college-karwar'
UNION ALL
SELECT c.id, 'ISE', 'GM', 28000 FROM colleges c WHERE c.slug = 'government-engineering-college-karwar'
UNION ALL
SELECT c.id, 'ISE', 'SC', 40600 FROM colleges c WHERE c.slug = 'government-engineering-college-karwar'
UNION ALL
SELECT c.id, 'ISE', 'ST', 37800 FROM colleges c WHERE c.slug = 'government-engineering-college-karwar'
UNION ALL
SELECT c.id, 'ISE', '2A', 32199 FROM colleges c WHERE c.slug = 'government-engineering-college-karwar'
UNION ALL
SELECT c.id, 'ISE', '3A', 30240 FROM colleges c WHERE c.slug = 'government-engineering-college-karwar'
UNION ALL
SELECT c.id, 'ECE', 'GM', 36000 FROM colleges c WHERE c.slug = 'government-engineering-college-karwar'
UNION ALL
SELECT c.id, 'ECE', 'SC', 52200 FROM colleges c WHERE c.slug = 'government-engineering-college-karwar'
UNION ALL
SELECT c.id, 'ECE', 'ST', 48600 FROM colleges c WHERE c.slug = 'government-engineering-college-karwar'
UNION ALL
SELECT c.id, 'ECE', '2A', 41400 FROM colleges c WHERE c.slug = 'government-engineering-college-karwar'
UNION ALL
SELECT c.id, 'ECE', '3A', 38880 FROM colleges c WHERE c.slug = 'government-engineering-college-karwar'
UNION ALL
SELECT c.id, 'AIML', 'GM', 26000 FROM colleges c WHERE c.slug = 'government-engineering-college-karwar'
UNION ALL
SELECT c.id, 'AIML', 'SC', 37700 FROM colleges c WHERE c.slug = 'government-engineering-college-karwar'
UNION ALL
SELECT c.id, 'AIML', 'ST', 35100 FROM colleges c WHERE c.slug = 'government-engineering-college-karwar'
UNION ALL
SELECT c.id, 'AIML', '2A', 29899 FROM colleges c WHERE c.slug = 'government-engineering-college-karwar'
UNION ALL
SELECT c.id, 'AIML', '3A', 28080 FROM colleges c WHERE c.slug = 'government-engineering-college-karwar'
UNION ALL
SELECT c.id, 'ME', 'GM', 55000 FROM colleges c WHERE c.slug = 'government-engineering-college-karwar'
UNION ALL
SELECT c.id, 'ME', 'SC', 79750 FROM colleges c WHERE c.slug = 'government-engineering-college-karwar'
UNION ALL
SELECT c.id, 'ME', 'ST', 74250 FROM colleges c WHERE c.slug = 'government-engineering-college-karwar'
UNION ALL
SELECT c.id, 'ME', '2A', 63249 FROM colleges c WHERE c.slug = 'government-engineering-college-karwar'
UNION ALL
SELECT c.id, 'ME', '3A', 59400 FROM colleges c WHERE c.slug = 'government-engineering-college-karwar'
UNION ALL
SELECT c.id, 'CSE', 'GM', 22600 FROM colleges c WHERE c.slug = 'government-engineering-college-bharamasagara'
UNION ALL
SELECT c.id, 'CSE', 'SC', 32770 FROM colleges c WHERE c.slug = 'government-engineering-college-bharamasagara'
UNION ALL
SELECT c.id, 'CSE', 'ST', 30510 FROM colleges c WHERE c.slug = 'government-engineering-college-bharamasagara'
UNION ALL
SELECT c.id, 'CSE', '2A', 25989 FROM colleges c WHERE c.slug = 'government-engineering-college-bharamasagara'
UNION ALL
SELECT c.id, 'CSE', '3A', 24408 FROM colleges c WHERE c.slug = 'government-engineering-college-bharamasagara'
UNION ALL
SELECT c.id, 'ISE', 'GM', 28600 FROM colleges c WHERE c.slug = 'government-engineering-college-bharamasagara'
UNION ALL
SELECT c.id, 'ISE', 'SC', 41470 FROM colleges c WHERE c.slug = 'government-engineering-college-bharamasagara'
UNION ALL
SELECT c.id, 'ISE', 'ST', 38610 FROM colleges c WHERE c.slug = 'government-engineering-college-bharamasagara'
UNION ALL
SELECT c.id, 'ISE', '2A', 32890 FROM colleges c WHERE c.slug = 'government-engineering-college-bharamasagara'
UNION ALL
SELECT c.id, 'ISE', '3A', 30888 FROM colleges c WHERE c.slug = 'government-engineering-college-bharamasagara'
UNION ALL
SELECT c.id, 'ECE', 'GM', 36600 FROM colleges c WHERE c.slug = 'government-engineering-college-bharamasagara'
UNION ALL
SELECT c.id, 'ECE', 'SC', 53070 FROM colleges c WHERE c.slug = 'government-engineering-college-bharamasagara'
UNION ALL
SELECT c.id, 'ECE', 'ST', 49410 FROM colleges c WHERE c.slug = 'government-engineering-college-bharamasagara'
UNION ALL
SELECT c.id, 'ECE', '2A', 42090 FROM colleges c WHERE c.slug = 'government-engineering-college-bharamasagara'
UNION ALL
SELECT c.id, 'ECE', '3A', 39528 FROM colleges c WHERE c.slug = 'government-engineering-college-bharamasagara'
UNION ALL
SELECT c.id, 'AIML', 'GM', 26600 FROM colleges c WHERE c.slug = 'government-engineering-college-bharamasagara'
UNION ALL
SELECT c.id, 'AIML', 'SC', 38570 FROM colleges c WHERE c.slug = 'government-engineering-college-bharamasagara'
UNION ALL
SELECT c.id, 'AIML', 'ST', 35910 FROM colleges c WHERE c.slug = 'government-engineering-college-bharamasagara'
UNION ALL
SELECT c.id, 'AIML', '2A', 30589 FROM colleges c WHERE c.slug = 'government-engineering-college-bharamasagara'
UNION ALL
SELECT c.id, 'AIML', '3A', 28728 FROM colleges c WHERE c.slug = 'government-engineering-college-bharamasagara'
UNION ALL
SELECT c.id, 'ME', 'GM', 56800 FROM colleges c WHERE c.slug = 'government-engineering-college-bharamasagara'
UNION ALL
SELECT c.id, 'ME', 'SC', 82360 FROM colleges c WHERE c.slug = 'government-engineering-college-bharamasagara'
UNION ALL
SELECT c.id, 'ME', 'ST', 76680 FROM colleges c WHERE c.slug = 'government-engineering-college-bharamasagara'
UNION ALL
SELECT c.id, 'ME', '2A', 65319 FROM colleges c WHERE c.slug = 'government-engineering-college-bharamasagara'
UNION ALL
SELECT c.id, 'ME', '3A', 61344 FROM colleges c WHERE c.slug = 'government-engineering-college-bharamasagara'
UNION ALL
SELECT c.id, 'CSE', 'GM', 23200 FROM colleges c WHERE c.slug = 'sri-taralabalu-jagadguru-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 33640 FROM colleges c WHERE c.slug = 'sri-taralabalu-jagadguru-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 31320 FROM colleges c WHERE c.slug = 'sri-taralabalu-jagadguru-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 26679 FROM colleges c WHERE c.slug = 'sri-taralabalu-jagadguru-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 25056 FROM colleges c WHERE c.slug = 'sri-taralabalu-jagadguru-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 29200 FROM colleges c WHERE c.slug = 'sri-taralabalu-jagadguru-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 42340 FROM colleges c WHERE c.slug = 'sri-taralabalu-jagadguru-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 39420 FROM colleges c WHERE c.slug = 'sri-taralabalu-jagadguru-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 33580 FROM colleges c WHERE c.slug = 'sri-taralabalu-jagadguru-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 31536 FROM colleges c WHERE c.slug = 'sri-taralabalu-jagadguru-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 37200 FROM colleges c WHERE c.slug = 'sri-taralabalu-jagadguru-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 53940 FROM colleges c WHERE c.slug = 'sri-taralabalu-jagadguru-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 50220 FROM colleges c WHERE c.slug = 'sri-taralabalu-jagadguru-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 42780 FROM colleges c WHERE c.slug = 'sri-taralabalu-jagadguru-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 40176 FROM colleges c WHERE c.slug = 'sri-taralabalu-jagadguru-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 27200 FROM colleges c WHERE c.slug = 'sri-taralabalu-jagadguru-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 39440 FROM colleges c WHERE c.slug = 'sri-taralabalu-jagadguru-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 36720 FROM colleges c WHERE c.slug = 'sri-taralabalu-jagadguru-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 31279 FROM colleges c WHERE c.slug = 'sri-taralabalu-jagadguru-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 29376 FROM colleges c WHERE c.slug = 'sri-taralabalu-jagadguru-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 58600 FROM colleges c WHERE c.slug = 'sri-taralabalu-jagadguru-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 84970 FROM colleges c WHERE c.slug = 'sri-taralabalu-jagadguru-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 79110 FROM colleges c WHERE c.slug = 'sri-taralabalu-jagadguru-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 67390 FROM colleges c WHERE c.slug = 'sri-taralabalu-jagadguru-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 63288 FROM colleges c WHERE c.slug = 'sri-taralabalu-jagadguru-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 23800 FROM colleges c WHERE c.slug = 'anjuman-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'CSE', 'SC', 34510 FROM colleges c WHERE c.slug = 'anjuman-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'CSE', 'ST', 32130 FROM colleges c WHERE c.slug = 'anjuman-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'CSE', '2A', 27369 FROM colleges c WHERE c.slug = 'anjuman-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'CSE', '3A', 25704 FROM colleges c WHERE c.slug = 'anjuman-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ISE', 'GM', 29800 FROM colleges c WHERE c.slug = 'anjuman-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ISE', 'SC', 43210 FROM colleges c WHERE c.slug = 'anjuman-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ISE', 'ST', 40230 FROM colleges c WHERE c.slug = 'anjuman-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ISE', '2A', 34270 FROM colleges c WHERE c.slug = 'anjuman-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ISE', '3A', 32184 FROM colleges c WHERE c.slug = 'anjuman-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ECE', 'GM', 37800 FROM colleges c WHERE c.slug = 'anjuman-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ECE', 'SC', 54810 FROM colleges c WHERE c.slug = 'anjuman-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ECE', 'ST', 51030 FROM colleges c WHERE c.slug = 'anjuman-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ECE', '2A', 43470 FROM colleges c WHERE c.slug = 'anjuman-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ECE', '3A', 40824 FROM colleges c WHERE c.slug = 'anjuman-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'AIML', 'GM', 27800 FROM colleges c WHERE c.slug = 'anjuman-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'AIML', 'SC', 40310 FROM colleges c WHERE c.slug = 'anjuman-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'AIML', 'ST', 37530 FROM colleges c WHERE c.slug = 'anjuman-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'AIML', '2A', 31969 FROM colleges c WHERE c.slug = 'anjuman-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'AIML', '3A', 30024 FROM colleges c WHERE c.slug = 'anjuman-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ME', 'GM', 60400 FROM colleges c WHERE c.slug = 'anjuman-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ME', 'SC', 87580 FROM colleges c WHERE c.slug = 'anjuman-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ME', 'ST', 81540 FROM colleges c WHERE c.slug = 'anjuman-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ME', '2A', 69460 FROM colleges c WHERE c.slug = 'anjuman-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'ME', '3A', 65232 FROM colleges c WHERE c.slug = 'anjuman-institute-of-technology-and-management'
UNION ALL
SELECT c.id, 'CSE', 'GM', 24400 FROM colleges c WHERE c.slug = 'govt-engineering-college-krishnagiri-ksitm'
UNION ALL
SELECT c.id, 'CSE', 'SC', 35380 FROM colleges c WHERE c.slug = 'govt-engineering-college-krishnagiri-ksitm'
UNION ALL
SELECT c.id, 'CSE', 'ST', 32940 FROM colleges c WHERE c.slug = 'govt-engineering-college-krishnagiri-ksitm'
UNION ALL
SELECT c.id, 'CSE', '2A', 28059 FROM colleges c WHERE c.slug = 'govt-engineering-college-krishnagiri-ksitm'
UNION ALL
SELECT c.id, 'CSE', '3A', 26352 FROM colleges c WHERE c.slug = 'govt-engineering-college-krishnagiri-ksitm'
UNION ALL
SELECT c.id, 'ISE', 'GM', 30400 FROM colleges c WHERE c.slug = 'govt-engineering-college-krishnagiri-ksitm'
UNION ALL
SELECT c.id, 'ISE', 'SC', 44080 FROM colleges c WHERE c.slug = 'govt-engineering-college-krishnagiri-ksitm'
UNION ALL
SELECT c.id, 'ISE', 'ST', 41040 FROM colleges c WHERE c.slug = 'govt-engineering-college-krishnagiri-ksitm'
UNION ALL
SELECT c.id, 'ISE', '2A', 34960 FROM colleges c WHERE c.slug = 'govt-engineering-college-krishnagiri-ksitm'
UNION ALL
SELECT c.id, 'ISE', '3A', 32832 FROM colleges c WHERE c.slug = 'govt-engineering-college-krishnagiri-ksitm'
UNION ALL
SELECT c.id, 'ECE', 'GM', 38400 FROM colleges c WHERE c.slug = 'govt-engineering-college-krishnagiri-ksitm'
UNION ALL
SELECT c.id, 'ECE', 'SC', 55680 FROM colleges c WHERE c.slug = 'govt-engineering-college-krishnagiri-ksitm'
UNION ALL
SELECT c.id, 'ECE', 'ST', 51840 FROM colleges c WHERE c.slug = 'govt-engineering-college-krishnagiri-ksitm'
UNION ALL
SELECT c.id, 'ECE', '2A', 44160 FROM colleges c WHERE c.slug = 'govt-engineering-college-krishnagiri-ksitm'
UNION ALL
SELECT c.id, 'ECE', '3A', 41472 FROM colleges c WHERE c.slug = 'govt-engineering-college-krishnagiri-ksitm'
UNION ALL
SELECT c.id, 'AIML', 'GM', 28400 FROM colleges c WHERE c.slug = 'govt-engineering-college-krishnagiri-ksitm'
UNION ALL
SELECT c.id, 'AIML', 'SC', 41180 FROM colleges c WHERE c.slug = 'govt-engineering-college-krishnagiri-ksitm'
UNION ALL
SELECT c.id, 'AIML', 'ST', 38340 FROM colleges c WHERE c.slug = 'govt-engineering-college-krishnagiri-ksitm'
UNION ALL
SELECT c.id, 'AIML', '2A', 32659 FROM colleges c WHERE c.slug = 'govt-engineering-college-krishnagiri-ksitm'
UNION ALL
SELECT c.id, 'AIML', '3A', 30672 FROM colleges c WHERE c.slug = 'govt-engineering-college-krishnagiri-ksitm'
UNION ALL
SELECT c.id, 'ME', 'GM', 62200 FROM colleges c WHERE c.slug = 'govt-engineering-college-krishnagiri-ksitm'
UNION ALL
SELECT c.id, 'ME', 'SC', 90190 FROM colleges c WHERE c.slug = 'govt-engineering-college-krishnagiri-ksitm'
UNION ALL
SELECT c.id, 'ME', 'ST', 83970 FROM colleges c WHERE c.slug = 'govt-engineering-college-krishnagiri-ksitm'
UNION ALL
SELECT c.id, 'ME', '2A', 71530 FROM colleges c WHERE c.slug = 'govt-engineering-college-krishnagiri-ksitm'
UNION ALL
SELECT c.id, 'ME', '3A', 67176 FROM colleges c WHERE c.slug = 'govt-engineering-college-krishnagiri-ksitm'
UNION ALL
SELECT c.id, 'CSE', 'GM', 22000 FROM colleges c WHERE c.slug = 'jain-institute-of-technology-davangere'
UNION ALL
SELECT c.id, 'CSE', 'SC', 31900 FROM colleges c WHERE c.slug = 'jain-institute-of-technology-davangere'
UNION ALL
SELECT c.id, 'CSE', 'ST', 29700 FROM colleges c WHERE c.slug = 'jain-institute-of-technology-davangere'
UNION ALL
SELECT c.id, 'CSE', '2A', 25299 FROM colleges c WHERE c.slug = 'jain-institute-of-technology-davangere'
UNION ALL
SELECT c.id, 'CSE', '3A', 23760 FROM colleges c WHERE c.slug = 'jain-institute-of-technology-davangere'
UNION ALL
SELECT c.id, 'ISE', 'GM', 28000 FROM colleges c WHERE c.slug = 'jain-institute-of-technology-davangere'
UNION ALL
SELECT c.id, 'ISE', 'SC', 40600 FROM colleges c WHERE c.slug = 'jain-institute-of-technology-davangere'
UNION ALL
SELECT c.id, 'ISE', 'ST', 37800 FROM colleges c WHERE c.slug = 'jain-institute-of-technology-davangere'
UNION ALL
SELECT c.id, 'ISE', '2A', 32199 FROM colleges c WHERE c.slug = 'jain-institute-of-technology-davangere'
UNION ALL
SELECT c.id, 'ISE', '3A', 30240 FROM colleges c WHERE c.slug = 'jain-institute-of-technology-davangere'
UNION ALL
SELECT c.id, 'ECE', 'GM', 36000 FROM colleges c WHERE c.slug = 'jain-institute-of-technology-davangere'
UNION ALL
SELECT c.id, 'ECE', 'SC', 52200 FROM colleges c WHERE c.slug = 'jain-institute-of-technology-davangere'
UNION ALL
SELECT c.id, 'ECE', 'ST', 48600 FROM colleges c WHERE c.slug = 'jain-institute-of-technology-davangere'
UNION ALL
SELECT c.id, 'ECE', '2A', 41400 FROM colleges c WHERE c.slug = 'jain-institute-of-technology-davangere'
UNION ALL
SELECT c.id, 'ECE', '3A', 38880 FROM colleges c WHERE c.slug = 'jain-institute-of-technology-davangere'
UNION ALL
SELECT c.id, 'AIML', 'GM', 26000 FROM colleges c WHERE c.slug = 'jain-institute-of-technology-davangere'
UNION ALL
SELECT c.id, 'AIML', 'SC', 37700 FROM colleges c WHERE c.slug = 'jain-institute-of-technology-davangere'
UNION ALL
SELECT c.id, 'AIML', 'ST', 35100 FROM colleges c WHERE c.slug = 'jain-institute-of-technology-davangere'
UNION ALL
SELECT c.id, 'AIML', '2A', 29899 FROM colleges c WHERE c.slug = 'jain-institute-of-technology-davangere'
UNION ALL
SELECT c.id, 'AIML', '3A', 28080 FROM colleges c WHERE c.slug = 'jain-institute-of-technology-davangere'
UNION ALL
SELECT c.id, 'ME', 'GM', 55000 FROM colleges c WHERE c.slug = 'jain-institute-of-technology-davangere'
UNION ALL
SELECT c.id, 'ME', 'SC', 79750 FROM colleges c WHERE c.slug = 'jain-institute-of-technology-davangere'
UNION ALL
SELECT c.id, 'ME', 'ST', 74250 FROM colleges c WHERE c.slug = 'jain-institute-of-technology-davangere'
UNION ALL
SELECT c.id, 'ME', '2A', 63249 FROM colleges c WHERE c.slug = 'jain-institute-of-technology-davangere'
UNION ALL
SELECT c.id, 'ME', '3A', 59400 FROM colleges c WHERE c.slug = 'jain-institute-of-technology-davangere'
UNION ALL
SELECT c.id, 'CSE', 'GM', 22600 FROM colleges c WHERE c.slug = 'channabasaveshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'SC', 32770 FROM colleges c WHERE c.slug = 'channabasaveshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'ST', 30510 FROM colleges c WHERE c.slug = 'channabasaveshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '2A', 25989 FROM colleges c WHERE c.slug = 'channabasaveshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', '3A', 24408 FROM colleges c WHERE c.slug = 'channabasaveshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'GM', 28600 FROM colleges c WHERE c.slug = 'channabasaveshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'SC', 41470 FROM colleges c WHERE c.slug = 'channabasaveshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', 'ST', 38610 FROM colleges c WHERE c.slug = 'channabasaveshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '2A', 32890 FROM colleges c WHERE c.slug = 'channabasaveshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ISE', '3A', 30888 FROM colleges c WHERE c.slug = 'channabasaveshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'GM', 36600 FROM colleges c WHERE c.slug = 'channabasaveshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'SC', 53070 FROM colleges c WHERE c.slug = 'channabasaveshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', 'ST', 49410 FROM colleges c WHERE c.slug = 'channabasaveshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '2A', 42090 FROM colleges c WHERE c.slug = 'channabasaveshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ECE', '3A', 39528 FROM colleges c WHERE c.slug = 'channabasaveshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'GM', 26600 FROM colleges c WHERE c.slug = 'channabasaveshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'SC', 38570 FROM colleges c WHERE c.slug = 'channabasaveshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', 'ST', 35910 FROM colleges c WHERE c.slug = 'channabasaveshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '2A', 30589 FROM colleges c WHERE c.slug = 'channabasaveshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'AIML', '3A', 28728 FROM colleges c WHERE c.slug = 'channabasaveshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'GM', 56800 FROM colleges c WHERE c.slug = 'channabasaveshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'SC', 82360 FROM colleges c WHERE c.slug = 'channabasaveshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', 'ST', 76680 FROM colleges c WHERE c.slug = 'channabasaveshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '2A', 65319 FROM colleges c WHERE c.slug = 'channabasaveshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'ME', '3A', 61344 FROM colleges c WHERE c.slug = 'channabasaveshwara-institute-of-technology'
UNION ALL
SELECT c.id, 'CSE', 'GM', 23200 FROM colleges c WHERE c.slug = 'pavana-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'SC', 33640 FROM colleges c WHERE c.slug = 'pavana-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'ST', 31320 FROM colleges c WHERE c.slug = 'pavana-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '2A', 26679 FROM colleges c WHERE c.slug = 'pavana-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', '3A', 25056 FROM colleges c WHERE c.slug = 'pavana-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'GM', 29200 FROM colleges c WHERE c.slug = 'pavana-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'SC', 42340 FROM colleges c WHERE c.slug = 'pavana-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', 'ST', 39420 FROM colleges c WHERE c.slug = 'pavana-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '2A', 33580 FROM colleges c WHERE c.slug = 'pavana-college-of-engineering'
UNION ALL
SELECT c.id, 'ISE', '3A', 31536 FROM colleges c WHERE c.slug = 'pavana-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'GM', 37200 FROM colleges c WHERE c.slug = 'pavana-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'SC', 53940 FROM colleges c WHERE c.slug = 'pavana-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', 'ST', 50220 FROM colleges c WHERE c.slug = 'pavana-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '2A', 42780 FROM colleges c WHERE c.slug = 'pavana-college-of-engineering'
UNION ALL
SELECT c.id, 'ECE', '3A', 40176 FROM colleges c WHERE c.slug = 'pavana-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'GM', 27200 FROM colleges c WHERE c.slug = 'pavana-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'SC', 39440 FROM colleges c WHERE c.slug = 'pavana-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', 'ST', 36720 FROM colleges c WHERE c.slug = 'pavana-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '2A', 31279 FROM colleges c WHERE c.slug = 'pavana-college-of-engineering'
UNION ALL
SELECT c.id, 'AIML', '3A', 29376 FROM colleges c WHERE c.slug = 'pavana-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'GM', 58600 FROM colleges c WHERE c.slug = 'pavana-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'SC', 84970 FROM colleges c WHERE c.slug = 'pavana-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', 'ST', 79110 FROM colleges c WHERE c.slug = 'pavana-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '2A', 67390 FROM colleges c WHERE c.slug = 'pavana-college-of-engineering'
UNION ALL
SELECT c.id, 'ME', '3A', 63288 FROM colleges c WHERE c.slug = 'pavana-college-of-engineering'
UNION ALL
SELECT c.id, 'CSE', 'GM', 23800 FROM colleges c WHERE c.slug = 'sri-krishna-school-of-engineering-and-management'
UNION ALL
SELECT c.id, 'CSE', 'SC', 34510 FROM colleges c WHERE c.slug = 'sri-krishna-school-of-engineering-and-management'
UNION ALL
SELECT c.id, 'CSE', 'ST', 32130 FROM colleges c WHERE c.slug = 'sri-krishna-school-of-engineering-and-management'
UNION ALL
SELECT c.id, 'CSE', '2A', 27369 FROM colleges c WHERE c.slug = 'sri-krishna-school-of-engineering-and-management'
UNION ALL
SELECT c.id, 'CSE', '3A', 25704 FROM colleges c WHERE c.slug = 'sri-krishna-school-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ISE', 'GM', 29800 FROM colleges c WHERE c.slug = 'sri-krishna-school-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ISE', 'SC', 43210 FROM colleges c WHERE c.slug = 'sri-krishna-school-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ISE', 'ST', 40230 FROM colleges c WHERE c.slug = 'sri-krishna-school-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ISE', '2A', 34270 FROM colleges c WHERE c.slug = 'sri-krishna-school-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ISE', '3A', 32184 FROM colleges c WHERE c.slug = 'sri-krishna-school-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ECE', 'GM', 37800 FROM colleges c WHERE c.slug = 'sri-krishna-school-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ECE', 'SC', 54810 FROM colleges c WHERE c.slug = 'sri-krishna-school-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ECE', 'ST', 51030 FROM colleges c WHERE c.slug = 'sri-krishna-school-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ECE', '2A', 43470 FROM colleges c WHERE c.slug = 'sri-krishna-school-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ECE', '3A', 40824 FROM colleges c WHERE c.slug = 'sri-krishna-school-of-engineering-and-management'
UNION ALL
SELECT c.id, 'AIML', 'GM', 27800 FROM colleges c WHERE c.slug = 'sri-krishna-school-of-engineering-and-management'
UNION ALL
SELECT c.id, 'AIML', 'SC', 40310 FROM colleges c WHERE c.slug = 'sri-krishna-school-of-engineering-and-management'
UNION ALL
SELECT c.id, 'AIML', 'ST', 37530 FROM colleges c WHERE c.slug = 'sri-krishna-school-of-engineering-and-management'
UNION ALL
SELECT c.id, 'AIML', '2A', 31969 FROM colleges c WHERE c.slug = 'sri-krishna-school-of-engineering-and-management'
UNION ALL
SELECT c.id, 'AIML', '3A', 30024 FROM colleges c WHERE c.slug = 'sri-krishna-school-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ME', 'GM', 60400 FROM colleges c WHERE c.slug = 'sri-krishna-school-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ME', 'SC', 87580 FROM colleges c WHERE c.slug = 'sri-krishna-school-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ME', 'ST', 81540 FROM colleges c WHERE c.slug = 'sri-krishna-school-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ME', '2A', 69460 FROM colleges c WHERE c.slug = 'sri-krishna-school-of-engineering-and-management'
UNION ALL
SELECT c.id, 'ME', '3A', 65232 FROM colleges c WHERE c.slug = 'sri-krishna-school-of-engineering-and-management'
UNION ALL
SELECT c.id, 'CSE', 'GM', 24400 FROM colleges c WHERE c.slug = 'visvesvaraya-technological-university-regional-centre-kalaburagi'
UNION ALL
SELECT c.id, 'CSE', 'SC', 35380 FROM colleges c WHERE c.slug = 'visvesvaraya-technological-university-regional-centre-kalaburagi'
UNION ALL
SELECT c.id, 'CSE', 'ST', 32940 FROM colleges c WHERE c.slug = 'visvesvaraya-technological-university-regional-centre-kalaburagi'
UNION ALL
SELECT c.id, 'CSE', '2A', 28059 FROM colleges c WHERE c.slug = 'visvesvaraya-technological-university-regional-centre-kalaburagi'
UNION ALL
SELECT c.id, 'CSE', '3A', 26352 FROM colleges c WHERE c.slug = 'visvesvaraya-technological-university-regional-centre-kalaburagi'
UNION ALL
SELECT c.id, 'ISE', 'GM', 30400 FROM colleges c WHERE c.slug = 'visvesvaraya-technological-university-regional-centre-kalaburagi'
UNION ALL
SELECT c.id, 'ISE', 'SC', 44080 FROM colleges c WHERE c.slug = 'visvesvaraya-technological-university-regional-centre-kalaburagi'
UNION ALL
SELECT c.id, 'ISE', 'ST', 41040 FROM colleges c WHERE c.slug = 'visvesvaraya-technological-university-regional-centre-kalaburagi'
UNION ALL
SELECT c.id, 'ISE', '2A', 34960 FROM colleges c WHERE c.slug = 'visvesvaraya-technological-university-regional-centre-kalaburagi'
UNION ALL
SELECT c.id, 'ISE', '3A', 32832 FROM colleges c WHERE c.slug = 'visvesvaraya-technological-university-regional-centre-kalaburagi'
UNION ALL
SELECT c.id, 'ECE', 'GM', 38400 FROM colleges c WHERE c.slug = 'visvesvaraya-technological-university-regional-centre-kalaburagi'
UNION ALL
SELECT c.id, 'ECE', 'SC', 55680 FROM colleges c WHERE c.slug = 'visvesvaraya-technological-university-regional-centre-kalaburagi'
UNION ALL
SELECT c.id, 'ECE', 'ST', 51840 FROM colleges c WHERE c.slug = 'visvesvaraya-technological-university-regional-centre-kalaburagi'
UNION ALL
SELECT c.id, 'ECE', '2A', 44160 FROM colleges c WHERE c.slug = 'visvesvaraya-technological-university-regional-centre-kalaburagi'
UNION ALL
SELECT c.id, 'ECE', '3A', 41472 FROM colleges c WHERE c.slug = 'visvesvaraya-technological-university-regional-centre-kalaburagi'
UNION ALL
SELECT c.id, 'AIML', 'GM', 28400 FROM colleges c WHERE c.slug = 'visvesvaraya-technological-university-regional-centre-kalaburagi'
UNION ALL
SELECT c.id, 'AIML', 'SC', 41180 FROM colleges c WHERE c.slug = 'visvesvaraya-technological-university-regional-centre-kalaburagi'
UNION ALL
SELECT c.id, 'AIML', 'ST', 38340 FROM colleges c WHERE c.slug = 'visvesvaraya-technological-university-regional-centre-kalaburagi'
UNION ALL
SELECT c.id, 'AIML', '2A', 32659 FROM colleges c WHERE c.slug = 'visvesvaraya-technological-university-regional-centre-kalaburagi'
UNION ALL
SELECT c.id, 'AIML', '3A', 30672 FROM colleges c WHERE c.slug = 'visvesvaraya-technological-university-regional-centre-kalaburagi'
UNION ALL
SELECT c.id, 'ME', 'GM', 62200 FROM colleges c WHERE c.slug = 'visvesvaraya-technological-university-regional-centre-kalaburagi'
UNION ALL
SELECT c.id, 'ME', 'SC', 90190 FROM colleges c WHERE c.slug = 'visvesvaraya-technological-university-regional-centre-kalaburagi'
UNION ALL
SELECT c.id, 'ME', 'ST', 83970 FROM colleges c WHERE c.slug = 'visvesvaraya-technological-university-regional-centre-kalaburagi'
UNION ALL
SELECT c.id, 'ME', '2A', 71530 FROM colleges c WHERE c.slug = 'visvesvaraya-technological-university-regional-centre-kalaburagi'
UNION ALL
SELECT c.id, 'ME', '3A', 67176 FROM colleges c WHERE c.slug = 'visvesvaraya-technological-university-regional-centre-kalaburagi';

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
