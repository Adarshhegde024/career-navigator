## Career Guidance Platform (CET Navigator)

### Overview
This project is a PHP-based mini portal that helps Karnataka CET aspirants research colleges, run simple recommendation scenarios, and chat with an AI counselor. The codebase is organized into a `backend` folder with PHP pages plus shared JavaScript, and a `frontend` folder containing the paired static HTML/CSS that inspired these screens.

### Stack & Structure
- PHP 8 style procedural pages served through XAMPP (`backend/*.php`)
- Plain JavaScript modules for interactivity (`backend/chat.js`, `backend/FIQ.js`)
- CSS-driven responsive layouts located in `frontend/*.css`
- MySQL connection bootstrap in `backend/db.php` (expects database `career_guidance_system`)
- Google Generative Language (Gemini 2.0 Flash) API used for AI features
- College metadata now lives in MySQL tables `colleges` + `branch_cutoffs` (see `backend/sql/colleges_schema.sql`)
- Dataset source of truth is `backend/data/colleges_karnataka.json`, generated via `python backend/scripts/build_college_dataset.py`
- Admin utilities live under `backend/admin/` (login, dashboard, upload pipeline) for yearly KEA updates

### Implemented Features
1. **User Accounts**
   - `signup.php` creates users in the `login` table with hashed passwords.
   - `login.php` authenticates, seeds `$_SESSION` with `user_id` and `user_fullname`, and redirects to `home.php`.

2. **Home & Static Content**
   - `home.php`, `about.php`, `FIQ.php` render branded navigation, hero sections, FAQ accordion, and team details.
   - `home.php` is session-aware (greets authenticated users) though guards are currently commented out.

3. **College Explorer**
   - `colleges.php` loads the catalog (currently 110 Karnataka institutes) and exposes nested branch/category cutoffs to the frontend.
   - Users can filter by name, city, course, sort by name/cutoff, and open a modal with GM plus category-wise cutoff details.
   - Modal integrates an “AI Summary” button that calls Gemini with a contextual prompt.

4. **Recommendation Sandbox**
   - `recommendations.php` reuses the college dataset to bucket colleges into Dream/Target/Safe lists based on entered rank, preferred branch, and reservation category.
   - Results show the cutoff actually used (e.g., SC/GM) and reuse the modal + AI summary flow for deeper inspection.

5. **Admin Data Ingestion**
   - `backend/admin/login.php` authenticates against the `admin_users` table (seeded with `cetnavigator151@gmail.com` / `Cetnavigator@1234`, hashed in the DB). Every successful login updates `last_login`.
   - `backend/admin/dashboard.php` lets the admin upload the official KEA cutoff file each year (`.csv`, `.xlsx`, or raw `.pdf` from KEA).
   - `backend/admin/process_upload.php` parses uploads via:
        - `backend/scripts/parse_cutoffs.py` + `openpyxl` for Excel
        - `backend/scripts/parse_cutoffs_pdf.py` + Google Gemini 1.5 Pro for PDFs  
     The extracted rows are normalized and upserted into `branch_cutoffs`.

5. **AI Career Counselor**
   - `AiCounselor.php` pairs with `chat.js` and `api.php` to offer a conversational interface.
   - The PHP endpoint proxies user prompts to Gemini, enforces a CET-focused system instruction, and streams the response back as JSON.

### Gaps & Risks (What Still Needs Work)
- **Secrets management**: Google API key is hard-coded in both PHP and client-side JS files; should move to environment variables or server-side proxy only.
- **Database coverage**: Colleges now live in MySQL, but FAQs, recommendations logic, and AI transcripts still rely on static markup or runtime arrays.
- **Route protection**: Auth checks on `home.php` (and other protected pages) are commented out, so unauthenticated access is possible.
- **Client/server split**: Duplicate college data in two PHP files invites drift. Consider central JSON or database-backed source with shared loader.
- **UX rough edges**: `home.php` JavaScript expects `homeSearchInput` and `homeSearchButton` elements that are not present; the search flow is incomplete.
- **Error handling & logging**: `db.php` echoes on successful connection, there is no structured logging for API failures, and CSRF protections are absent.
- **Deployment readiness**: No instructions for creating the `login` table, seeding data, or configuring Apache aliases/XAMPP virtual hosts.

### Recommended Next Steps
1. **Secure configuration**
   - Move API keys and database credentials into environment variables or a config file excluded from VCS.
   - Gate AI endpoints server-side so credentials never ship to the browser.

2. **Complete authentication flows**
   - Re-enable session guards on every PHP page that requires login.
   - Add logout link/state to the navigation bar.
   - Introduce CSRF tokens for forms.

3. **Back data with MySQL**
   - Create tables for colleges, branches, FAQs, and optionally recommendation histories.
   - Build lightweight REST/PHP endpoints that return JSON to front-end scripts.
   - Replace duplicated static arrays with DB queries or shared JSON includes.

4. **Finish UX wiring**
   - Implement the missing search input in `home.php` or remove the unused script.
   - Enhance FAQ accordion (expand/collapse icons, polish content).
   - Add loading and error states for college/recommendation fetches.

5. **Add project automation**
   - Provide SQL migrations or seed scripts.
   - Document setup (XAMPP config, composer/npm needs if any) and testing flow.
   - Consider bundling frontend assets or adopting a simple build step for minification.

### How to Run Locally (Current State)
1. Install XAMPP and ensure Apache & MySQL services are running.
2. Place this repository in `htdocs` (already assumed).
3. Create MySQL database `career_guidance_system`.
4. Using phpMyAdmin (or the MySQL CLI), select the `career_guidance_system` database and import `backend/sql/colleges_schema.sql`. This script creates both tables and seeds ~110 Karnataka engineering colleges plus their branch+category cutoffs, as well as the `admin_users` table (preloaded with the default admin credential).
5. Ensure you also have a `login` table with `id`, `FullName`, `Email`, `Password` columns for auth.
6. Install Python dependencies for admin uploads (one-time): `pip install openpyxl`.
7. If you plan to upload PDFs directly, also `pip install google-generativeai` and set `GEMINI_API_KEY` in your environment before running Apache (e.g., in Windows PowerShell: `$env:GEMINI_API_KEY="YOUR_KEY"`).
8. Update `backend/db.php` if your MySQL port, username, or password differ.
9. Visit `http://localhost/career-guidance/backend/signup.php` to seed a user, then log in via `login.php`.
10. Admins can visit `http://localhost/career-guidance/backend/admin/login.php` (email `cetnavigator151@gmail.com`, password `Cetnavigator@1234`) to upload the latest KEA cutoff sheet. The credential lives in the database, so change it there if needed.
11. Use the navigation bar to explore the remaining pages.

> Note: AI-powered sections will only work once you supply a valid Gemini API key. Replace the placeholder value in `backend/api.php` (and remove it from version control) and proxy all AI calls through the backend for security.

