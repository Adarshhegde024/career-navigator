<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recommendations - CET Navigator</title>
    <!-- Your CSS link, assumes 'frontend' folder is one level up -->
    <link rel="stylesheet" href="../frontend/recommendations.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Added CSS from colleges.php for the modal and AI summary -->
    <style>
        /* --- Styles for Modal --- */
        .modal {
            display: none; position: fixed; z-index: 1000; left: 0; top: 0;
            width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.8);
            backdrop-filter: blur(5px); animation: fadeIn 0.3s ease-out;
        }
        @keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }
        
        .modal-content {
            background-color: var(--background-color-dark); margin: 5% auto; padding: 2rem;
            border-radius: 16px; width: 80%; max-width: 700px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5); position: relative;
            border: 1px solid var(--border-color-dark);
            animation: slideInDown 0.4s ease-out; transform-origin: top center;
            max-height: 85vh; /* Fix for scrolling */
            overflow-y: auto; /* Fix for scrolling */
        }
        @keyframes slideInDown {
            from { opacity: 0; transform: translateY(-50px) scale(0.9); }
            to { opacity: 1; transform: translateY(0) scale(1); }
        }

        .close {
            color: var(--text-muted-dark); float: right; font-size: 32px;
            font-weight: bold; cursor: pointer; transition: all 0.3s ease;
            position: relative; z-index: 10;
        }
        .close:hover { color: var(--text-color-dark); transform: scale(1.1) rotate(90deg); }

        .modal h2 { color: var(--primary-color-dark); margin-top: 0; font-size: 1.8rem; }
        .modal .college-info, .modal .branch-cutoffs {
            margin: 1.5rem 0; background-color: var(--secondary-color-dark);
            padding: 1.5rem; border-radius: 12px; border: 1px solid var(--border-color-dark);
        }
        .modal .college-info li, .modal .branch-cutoffs li {
            margin: 0.8rem 0; color: var(--text-muted-dark); font-size: 0.95rem;
            list-style: none; padding-left: 1.5rem; position: relative;
        }
        .modal .college-info li::before, .modal .branch-cutoffs li::before {
            content: "▶"; color: var(--primary-color-dark); position: absolute;
            left: 0; top: 0; font-size: 0.8rem;
        }
        .modal a { color: var(--primary-color-dark); text-decoration: none; }
        .modal a:hover { text-decoration: underline; }

        .get-ai-summary {
            background: linear-gradient(135deg, var(--primary-color-dark), #1d4ed8);
            color: white; padding: 1rem 2rem; border: none; border-radius: 12px;
            font-size: 1rem; cursor: pointer; margin-top: 1.5rem; width: 100%;
            font-family: 'Poppins', sans-serif; font-weight: 600;
            transition: all 0.3s ease; box-shadow: 0 4px 15px rgba(59, 130, 246, 0.3);
        }
        .get-ai-summary:hover { transform: translateY(-3px); box-shadow: 0 8px 25px rgba(59, 130, 246, 0.5); }
        
        .ai-summary {
            margin-top: 1.5rem; background-color: var(--secondary-color-dark);
            padding: 1.5rem; border-radius: 12px; border: 1px solid var(--border-color-dark);
        }
        .ai-summary h3 { margin-top: 0; color: var(--primary-color-dark); }
        .ai-summary-content { color: var(--text-muted-dark); font-size: 0.95rem; line-height: 1.6; }
        .loading-dots span {
            display: inline-block; width: 8px; height: 8px; background-color: var(--text-muted-dark);
            border-radius: 50%; margin: 0 2px; animation: bounce 1.4s infinite ease-in-out both;
        }
        .loading-dots span:nth-child(2) { animation-delay: -0.16s; }
        .loading-dots span:nth-child(3) { animation-delay: -0.32s; }
        @keyframes bounce { 0%, 80%, 100% { transform: scale(0); } 40% { transform: scale(1.0); } }

        /* --- Hide results by default --- */
        .recommendation-results {
            display: none;
        }
    </style>
</head>
<body>

    <header>
        <nav class="navbar">
            <a href="index.html" class="nav-brand">CET Navigator</a>
            <ul class="nav-menu">
                <li><a href="home.php" class="nav-link">Home</a></li>
                <li><a href="colleges.php" class="nav-link">Colleges</a></li>
                <li><a href="recommendations.php" class="nav-link active">Recommendations</a></li>
                <li><a href="AiCounselor.php" class="nav-link">AI Counselor</a></li>
                <li><a href="FIQ.php" class="nav-link">FAQ</a></li>
                <li><a href="about.php" class="nav-link">About</a></li>
            </ul>
            <div class="nav-right-items">
                
            </div>
        </nav>
    </header>

    <main>
        <div class="container">
            <h2 class="section-title">Personalized College Recommendations</h2>
            <p class="section-subtitle">Enter your rank and preferred branch to get a tailored list of college options.</p>

            <!-- --- The Form (with ID) --- -->
            <form id="recommendation-form" class="recommendation-form">
                <div class="input-group">
                    <label for="cet-rank">Enter your CET Rank</label>
                    <input type="number" id="cet-rank" placeholder="e.g., 15000" required>
                </div>
                <div class="input-group">
                    <label for="course-pref">Select Preferred Course</label>
                    <!-- Updated courses to match our database -->
                    <select id="course-pref">
                        <option value="CSE">Computer Science & Engineering</option>
                        <option value="ISE">Information Science & Engineering</option>
                        <option value="AIML">AI & Machine Learning</option>
                        <option value="ECE">Electronics & Communication</option>
                        <option value="ME">Mechanical Engineering</option>
                    </select>
                </div>
                <button type="submit">Get Recommendations</button>
            </form>

            <!-- --- Dynamic Results Container (Empty) --- -->
            <div id="recommendation-results" class="recommendation-results">
                <!-- JavaScript will generate results here -->
            </div>

        </div>
    </main>

    <!-- --- Modal HTML (Copied from colleges.php) --- -->
    <div id="collegeModal" class="modal">
        <div class="modal-content">
            <span class="close" id="modalCloseBtn">&times;</span>
            <h2 id="modalTitle"></h2>
            <div class="college-info">
                <p><strong>Location:</strong> <span id="modalLocation"></span></p>
                <p><strong>Website:</strong> <a href="#" target="_blank" id="modalWebsite"></a></p>
                <ul>
                    <li>Avg. Annual Fees: <span id="modalFees"></span></li>
                    <li>Highest Package: <span id="modalHighestPackage"></span></li>
                    <li>Average Package: <span id="modalAvgPackage"></span></li>
                </ul>
            </div>
            <div class="branch-cutoffs">
                <h3>Branch Cutoffs (Estimated)</h3>
                <ul id="modalBranchList"></ul>
            </div>
            <div id="aiSummarySection" class="ai-summary" style="display: none;">
                <h3>AI Summary</h3>
                <div id="aiSummaryContent" class="ai-summary-content"></div>
            </div>
            <button id="getAiSummaryBtn" class="get-ai-summary">Get AI Summary</button>
        </div>
    </div>

    <!-- =================================================================== -->
    <!-- START: JAVASCRIPT LOGIC -->
    <!-- =================================================================== -->
    <script>
        // =======================================================================
        // 1. API KEY (Add your key from AiCounselor.php)
        // =======================================================================
        const API_KEY = "AIzaSyBZjWXQjohyjOWuRzv1GKGyAa1I1tel_MA"; // <-- PASTE YOUR GOOGLE AI API KEY HERE
        const API_URL = `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=${API_KEY}`;
        
        // =======================================================================
        // 2. COLLEGE DATABASE (Copied from colleges.php)
        // =======================================================================
        const collegeData = [
            { id: 'bnmit', name: 'B.N.M Institute of Technology', location: 'Bengaluru', fees: '₹1,10,000', website: 'https.bnmit.org/', packages: { high: '18 LPA', avg: '6 LPA' }, cutoffs: { CSE: 22000, ISE: 28000, ECE: 35000, AIML: 25000 } },
            { id: 'bmsce', name: 'BMS College of Engineering', location: 'Bengaluru', fees: '₹2,10,000', website: 'https://www.bmsce.ac.in/', packages: { high: '50 LPA', avg: '9 LPA' }, cutoffs: { CSE: 3000, ISE: 4500, ECE: 7000, ME: 25000, AIML: 4000 } },
            { id: 'jssstu', name: 'JSS Science and Technology University', location: 'Mysuru', fees: '₹1,00,000', website: 'https://jssst.in/', packages: { high: '40 LPA', avg: '7 LPA' }, cutoffs: { CSE: 12000, ISE: 16000, ECE: 20000, ME: 45000 } },
            { id: 'pesitm', name: 'PES Institute of Technology and Management', location: 'Shivamogga', fees: '₹90,000', website: 'https://pesitm.ac.in/', packages: { high: '12 LPA', avg: '5 LPA' }, cutoffs: { CSE: 15000, ISE: 21000, ECE: 28000, ME: 60000 } },
            { id: 'msrit', name: 'M.S. Ramaiah Institute of Technology', location: 'Bengaluru', fees: '₹2,50,000', website: 'https://www.msrit.edu/', packages: { high: '50 LPA', avg: '8.5 LPA' }, cutoffs: { CSE: 5000, ISE: 7000, ECE: 10000, ME: 30000, AIML: 6000 } },
            { id: 'rvce', name: 'RV College of Engineering', location: 'Bengaluru', fees: '₹2,00,000', website: 'https.rvce.edu.in/', packages: { high: '62 LPA', avg: '10 LPA' }, cutoffs: { CSE: 800, ISE: 1200, ECE: 2500, ME: 15000 } },
            { id: 'dsce', name: 'Dayananda Sagar College of Engineering', location: 'Bengaluru', fees: '₹1,80,000', website: 'https://dsce.edu.in/', packages: { high: '45 LPA', avg: '7 LPA' }, cutoffs: { CSE: 12000, ISE: 15000, ECE: 18000, AIML: 14000 } },
            { id: 'bmsit', name: 'BMS Institute of Technology and Management', location: 'Bengaluru', fees: '₹1,20,000', website: 'https://bmsit.ac.in/', packages: { high: '28 LPA', avg: '6.5 LPA' }, cutoffs: { CSE: 18000, ISE: 23000, ECE: 29000, AIML: 20000 } },
            { id: 'sit', name: 'Siddaganga Institute of Technology', location: 'Tumakuru', fees: '₹80,000', website: 'https://www.sit.ac.in/', packages: { high: '30 LPA', avg: '5.5 LPA' }, cutoffs: { CSE: 25000, ISE: 30000, ECE: 38000, ME: 70000 } },
            { id: 'nie', name: 'National Institute of Engineering', location: 'Mysuru', fees: '₹95,000', website: 'https://nie.ac.in/', packages: { high: '43 LPA', avg: '7 LPA' }, cutoffs: { CSE: 14000, ISE: 17000, ECE: 22000, ME: 50000 } },
            { id: 'iiitb', name: 'IIIT Bangalore', location: 'Bengaluru', fees: '₹4,00,000', website: 'https://www.iiitb.ac.in/', packages: { high: '2 Cr', avg: '35 LPA' }, cutoffs: { CSE: 8000, ECE: 12000 } },
            { id: 'pesu', name: 'PES University', location: 'Bengaluru', fees: '₹4,50,000', website: 'https://www.pes.edu/', packages: { high: '1.5 Cr', avg: '12 LPA' }, cutoffs: { CSE: 2000, ECE: 4000, ME: 20000, AIML: 2500 } },
            { id: 'nmamit', name: 'NMAM Institute of Technology', location: 'Mangaluru', fees: '₹1,30,000', website: 'https://nmamit.nitte.edu.in/', packages: { high: '45 LPA', avg: '5 LPA' }, cutoffs: { CSE: 28000, ISE: 34000, ECE: 40000, AIML: 30000 } },
            { id: 'sjec', name: 'St. Joseph Engineering College', location: 'Mangaluru', fees: '₹1,00,000', website: 'https://www.sjec.ac.in/', packages: { high: '20 LPA', avg: '4.5 LPA' }, cutoffs: { CSE: 35000, ECE: 50000, ME: 90000, AIML: 40000 } },
            { id: 'kle', name: 'KLE Technological University', location: 'Belagavi', fees: '₹1,50,000', website: 'https://www.kletech.ac.in/', packages: { high: '33 LPA', avg: '6 LPA' }, cutoffs: { CSE: 20000, ECE: 30000, ME: 65000 } },
            { id: 'reva', name: 'REVA University', location: 'Bengaluru', fees: '₹2,80,000', website: 'https://www.reva.edu.in/', packages: { high: '50 LPA', avg: '5.5 LPA' }, cutoffs: { CSE: 40000, ISE: 50000, ECE: 60000, AIML: 45000 } },
            { id: 'cmrit', name: 'CMR Institute of Technology', location: 'Bengaluru', fees: '₹2,00,000', website: 'https://www.cmrit.ac.in/', packages: { high: '25 LPA', avg: '6 LPA' }, cutoffs: { CSE: 26000, ISE: 32000, ECE: 39000, AIML: 29000 } },
            { id: 'acharya', name: 'Acharya Institute of Technology', location: 'Bengaluru', fees: '₹2,20,000', website: 'https://acharya.ac.in/', packages: { high: '20 LPA', avg: '4.5 LPA' }, cutoffs: { CSE: 50000, ISE: 60000, ECE: 75000, AIML: 55000 } },
            { id: 'jain', name: 'Jain University', location: 'Bengaluru', fees: '₹3,50,000', website: 'https://www.jainuniversity.ac.in/', packages: { high: '42 LPA', avg: '6.5 LPA' }, cutoffs: { CSE: 45000, ECE: 70000, AIML: 50000 } },
            { id: 'oxford', name: 'The Oxford College of Engineering', location: 'Bengaluru', fees: '₹1,70,000', website: 'https://www.theoxford.edu/', packages: { high: '18 LPA', avg: '5 LPA' }, cutoffs: { CSE: 48000, ISE: 58000, ECE: 72000, AIML: 52000 } }
        ];

        // =======================================================================
        // 3. RECOMMENDATION LOGIC
        // =======================================================================
        document.addEventListener('DOMContentLoaded', () => {
            const form = document.getElementById('recommendation-form');
            const resultsDiv = document.getElementById('recommendation-results');
            const subtitle = document.querySelector('.section-subtitle');

            form.addEventListener('submit', (event) => {
                event.preventDefault(); // Stop the form from reloading the page
                
                const rankInput = document.getElementById('cet-rank');
                const rank = parseInt(rankInput.value);
                const course = document.getElementById('course-pref').value; // Already uppercase

                // --- Validation ---
                if (!rank || rank <= 0) {
                    subtitle.textContent = 'Please enter a valid rank!';
                    subtitle.style.color = 'var(--danger-color)';
                    rankInput.focus();
                    return;
                }
                subtitle.textContent = 'Here are your tailored college options:';
                subtitle.style.color = 'var(--text-muted-dark)';

                // --- Categorization Logic ---
                // A cutoff is the *last* rank admitted. 
                // So, if rank=10k and cutoff=12k, you GET IN.
                // if rank=15k and cutoff=12k, you DON'T get in.
                
                // --- 1. DEFINE THE RANK ZONES ---
                
                // 'dreamMargin' defines the "Dream" zone. 0.75 means we look for colleges with cutoffs 
                // between 75% of your rank and your actual rank.
                // Ex: Your rank is 10000. 75% is 7500. The "Dream" zone is any college with a cutoff between 7500 and 9999.
                const dreamMargin = 0.75; // Cutoff can be up to 25% better (lower) than your rank
                
                // 'targetMargin' defines the "Target" and "Safe" zones. 1.5 means 150% of your rank.
                // Ex: Your rank is 10000. 150% is 15000.
                // The "Target" zone is from 10000 to 15000.
                // The "Safe" zone is any cutoff *above* 15000.
                const targetMargin = 1.5; // Cutoff can be up to 50% worse (higher) than your rank

                // --- 2. CREATE EMPTY BUCKETS ---
                // We create three empty arrays to hold the colleges that match our rules.
                let dream = [], target = [], safe = [];

                // --- 3. LOOP THROUGH ALL COLLEGES ---
                for (const college of collegeData) {
                    // Get the cutoff for the *specific course* the user selected (e.g., CSE)
                    const cutoff = college.cutoffs[course];
                    
                    // If the college doesn't offer this course (no cutoff data), skip it and move to the next college.
                    if (!cutoff) continue; 

                    // --- 4. CATEGORIZE THE COLLEGE ---

                    // RULE 1: DREAM COLLEGE
                    // The cutoff must be BETTER (less than) your rank, BUT not *too* much better (must be >= 75% of your rank).
                    // Ex: Your Rank = 15000. Dream Zone = 11250 to 14999.
                    // A college with cutoff 12000 fits this rule.
                    if (cutoff < rank && cutoff >= rank * dreamMargin) {
                        dream.push(college);
                    
                    // RULE 2: TARGET COLLEGE
                    // The cutoff must be WORSE (greater than or equal to) your rank, BUT not *too* much worse (must be < 150% of your rank).
                    // Ex: Your Rank = 15000. Target Zone = 15000 to 22500.
                    // A college with cutoff 18000 fits this rule.
                    } else if (cutoff >= rank && cutoff < rank * targetMargin) {
                        target.push(college);

                    // RULE 3: SAFE COLLEGE
                    // The cutoff is WORSE (greater than or equal to) the target margin.
                    // Ex: Your Rank = 15000. Safe Zone = 22501 and higher.
                    // A college with cutoff 25000 fits this rule.
                    } else if (cutoff >= rank * targetMargin) {
                        safe.push(college);
                    }
                    // Note: Colleges with cutoffs *way* better than your rank (e.g., < 75% of your rank) are ignored,
                    // as they are too unrealistic to be a "dream" choice.
                }
                
                // --- 5. SORT THE RESULTS ---
                // Sort each list internally by cutoff, from best (lowest rank) to worst (highest rank).
                dream.sort((a,b) => a.cutoffs[course] - b.cutoffs[course]);
                target.sort((a,b) => a.cutoffs[course] - b.cutoffs[course]);
                safe.sort((a,b) => a.cutoffs[course] - b.cutoffs[course]);

                // --- Render Results ---
                resultsDiv.innerHTML = ''; // Clear previous results
                renderCategory(resultsDiv, 'Dream Choices', 'Colleges where admission is challenging but possible.', dream, 'danger');
                renderCategory(resultsDiv, 'Target Choices', 'Colleges that are a good match for your rank.', target, 'warning');
                renderCategory(resultsDiv, 'Safe Choices', 'Colleges where you have a very high chance of admission.', safe, 'success');
                
                resultsDiv.style.display = 'grid'; // Show the results
            });
        });

        function renderCategory(container, title, description, colleges, type) {
            const categoryDiv = document.createElement('div');
            categoryDiv.className = 'recommendation-category';
            categoryDiv.style.borderLeftColor = `var(--${type}-color)`;

            let collegeList = '';
            if (colleges.length === 0) {
                collegeList = '<li>No colleges found in this category.</li>';
            } else {
                collegeList = colleges.map(college => 
                    // This is the key: we add onclick to open the modal
                    `<li onclick="openModal('${college.id}')">${college.name}</li>`
                ).join('');
            }

            categoryDiv.innerHTML = `
                <h3 style="color: var(--${type}-color);">${title}</h3>
                <p>${description}</p>
                <ul>
                    ${collegeList}
                </ul>
            `;
            container.appendChild(categoryDiv);
        }

        // =======================================================================
        // 4. MODAL FUNCTIONS (Copied from colleges.php)
        // =======================================================================
        function openModal(collegeId) {
            const college = collegeData.find(c => c.id === collegeId);
            if (!college) return;
            
            document.getElementById('modalTitle').textContent = college.name;
            document.getElementById('modalLocation').textContent = college.location;
            const websiteEl = document.getElementById('modalWebsite');
            websiteEl.href = college.website;
            websiteEl.textContent = college.website;
            document.getElementById('modalFees').textContent = college.fees;
            document.getElementById('modalHighestPackage').textContent = college.packages.high;
            document.getElementById('modalAvgPackage').textContent = college.packages.avg;

            const branchList = document.getElementById('modalBranchList');
            branchList.innerHTML = '';
            for (const [branch, cutoff] of Object.entries(college.cutoffs)) {
                const li = document.createElement('li');
                li.innerHTML = `${branch}: <span>~${cutoff}</span>`;
                branchList.appendChild(li);
            }

            document.getElementById('aiSummarySection').style.display = 'none';
            document.getElementById('aiSummaryContent').innerHTML = '';
            const aiBtn = document.getElementById('getAiSummaryBtn');
            aiBtn.dataset.collegeName = college.name;
            aiBtn.disabled = false;
            aiBtn.textContent = 'Get AI Summary';

            document.getElementById('collegeModal').style.display = 'block';
        }

        function closeModal() {
            document.getElementById('collegeModal').style.display = 'none';
        }

        document.getElementById('modalCloseBtn').onclick = closeModal;
        window.onclick = function(event) {
            if (event.target === document.getElementById('collegeModal')) {
                closeModal();
            }
        }

        document.getElementById('getAiSummaryBtn').onclick = fetchAiSummary;

        async function fetchAiSummary() {
            const collegeName = document.getElementById('getAiSummaryBtn').dataset.collegeName;
            if (!collegeName) return;

            if (!API_KEY) {
                document.getElementById('aiSummarySection').style.display = 'block';
                document.getElementById('aiSummaryContent').textContent = 'Error: API_KEY is not set. Please add your Google AI API key.';
                return;
            }

            const aiSummarySect = document.getElementById('aiSummarySection');
            const aiSummaryCont = document.getElementById('aiSummaryContent');
            const aiBtn = document.getElementById('getAiSummaryBtn');

            aiSummarySect.style.display = 'block';
            aiSummaryCont.innerHTML = '<div class="loading-dots"><span></span><span></span><span></span></div>';
            aiBtn.disabled = true;
            aiBtn.textContent = 'Generating...';

            const prompt = `Provide a brief, 2-3 sentence summary for a student asking about ${collegeName}, Karnataka. Focus on its reputation, key branches, and typical placement quality.`;

            try {
                const payload = {
                    contents: [{ parts: [{ text: prompt }] }],
                    systemInstruction: { parts: [{ text: "You are an expert on Karnataka CET colleges, providing brief summaries for students." }] },
                };

                const response = await fetch(API_URL, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(payload)
                });

                if (!response.ok) throw new Error(`API request failed`);
                const result = await response.json();
                const text = result.candidates?.[0]?.content?.parts?.[0]?.text;
                aiSummaryCont.textContent = text || 'Could not retrieve a summary.';

            } catch (error) {
                console.error('AI Summary Error:', error);
                aiSummaryCont.textContent = 'Sorry, unable to fetch AI summary.';
            } finally {
                aiBtn.disabled = false;
                aiBtn.textContent = 'Get AI Summary';
            }
        }
    </script>

</body>
</html>
