<?php
require_once __DIR__ . '/db.php';
require_once __DIR__ . '/includes/college_repository.php';

$collegeData = getCollegesWithCutoffs($conn);

// Debug: Check if data is loaded and has cutoffs
$collegesWithCutoffs = 0;
foreach ($collegeData as $college) {
    if (!empty($college['cutoffs'])) {
        $collegesWithCutoffs++;
    }
}
// Uncomment the line below to see debug info in browser console
// error_log("Loaded " . count($collegeData) . " colleges, " . $collegesWithCutoffs . " with cutoffs");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>College Explorer - CET Navigator</title>
    <!-- Your CSS link, unchanged. Assumes 'frontend' folder is one level up -->
    <link rel="stylesheet" href="../frontend/colleges.css"> 
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Added a few styles for the new AI summary loader -->
    <style>
         .modal-content {
            max-height: 85vh; /* Set a maximum height (85% of viewport height) */
            overflow-y: auto; /* Add a vertical scrollbar *only* if content is too tall */
        }
        .ai-summary {
            margin-top: 1.5rem;
            background-color: var(--secondary-color-dark);
            padding: 1.5rem;
            border-radius: 12px;
            border: 1px solid var(--border-color-dark);
        }
        .ai-summary h3 {
            margin-top: 0;
            color: var(--primary-color-dark);
        }
        .ai-summary-content {
            color: var(--text-muted-dark);
            font-size: 0.95rem;
            line-height: 1.6;
        }
        .loading-dots span {
            display: inline-block;
            width: 8px;
            height: 8px;
            background-color: var(--text-muted-dark);
            border-radius: 50%;
            margin: 0 2px;
            animation: bounce 1.4s infinite ease-in-out both;
        }
        .loading-dots span:nth-child(2) { animation-delay: -0.16s; }
        .loading-dots span:nth-child(3) { animation-delay: -0.32s; }
        @keyframes bounce {
            0%, 80%, 100% { transform: scale(0); }
            40% { transform: scale(1.0); }
        }
    </style>
</head>
<body>

    <header>
        <nav class="navbar">
            <a href="index.html" class="nav-brand">CET Navigator</a>
            <ul class="nav-menu">
                <li><a href="home.php" class="nav-link">Home</a></li>
                <li><a href="colleges.php" class="nav-link active">Colleges</a></li>
                <li><a href="recommendations.php" class="nav-link">Recommendations</a></li>
                <li><a href="AiCounselor.php" class="nav-link">AI Counselor</a></li>
                <li><a href="FIQ.php" class="nav-link">FAQ</a></li>
                <li><a href="about.php" class="nav-link">About</a></li>
            </ul>
            <div class="nav-right-items"></div>
        </nav>
    </header>

    <main>
        <div class="container">
            <h2 class="section-title">College Explorer</h2>
            
            <!-- --- FILTERS (Now with IDs) --- -->
            <div class="filters-container">
                <div class="filter-group">
                    <label for="searchName">Search by Name</label>
                    <input type="text" id="searchName" placeholder="e.g., PES Institute">
                </div>
                <div class="filter-group">
                    <label for="filterLocation">Filter by Location</label>
                    <select id="filterLocation">
                        <option value="All">All Locations</option>
                        <option value="Bengaluru">Bengaluru</option>
                        <option value="Mysuru">Mysuru</option>
                        <option value="Shivamogga">Shivamogga</option>
                        <option value="Tumakuru">Tumakuru</option>
                        <option value="Mangaluru">Mangaluru</option>
                        <option value="Belagavi">Belagavi</option>
                    </select>
                </div>
                <div class="filter-group">
                    <label for="filterCourse">Filter by Course</label>
                    <select id="filterCourse">
                        <option value="All">All Courses</option>
                        <option value="CSE">CSE</option>
                        <option value="ISE">ISE</option>
                        <option value="ECE">ECE</option>
                        <option value="ME">ME</option>
                        <option value="AIML">AIML</option>
                    </select>
                </div>
                <div class="filter-group">
                    <label for="sortBy">Sort By</label>
                    <select id="sortBy">
                        <option value="name_asc">Name (A-Z)</option>
                        <option value="name_desc">Name (Z-A)</option>
                        <option value="cutoff_asc">Cutoff (Low to High)</option>
                        <option value="cutoff_desc">Cutoff (High to Low)</option>
                    </select>
                </div>
            </div>

            <!-- --- COLLEGE GRID (To be filled by JavaScript) --- -->
            <div id="college-grid" class="college-grid">
                <!-- JavaScript will generate college cards here -->
            </div>
        </div>
    </main>

    <!-- --- MODAL (Structure unchanged, content will be filled by JS) --- -->
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
                <ul id="modalBranchList">
                    <!-- JS will generate branch list here -->
                </ul>
            </div>
            
            <!-- New AI Summary Section -->
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
        const collegeData = <?php echo json_encode($collegeData, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES); ?>;

        // =======================================================================
        // 1. API KEY (Add your key from AiCounselor.php)
        // =======================================================================
        const API_KEY = "AIzaSyBZjWXQjohyjOWuRzv1GKGyAa1I1tel_MA"; // <-- PASTE YOUR GOOGLE AI API KEY HERE
        const API_URL = `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=${API_KEY}`;

        // =======================================================================
        // 3. DOM ELEMENT REFERENCES
        // =======================================================================
        const collegeGrid = document.getElementById('college-grid');
        const modal = document.getElementById('collegeModal');
        const modalCloseBtn = document.getElementById('modalCloseBtn');
        const getAiSummaryBtn = document.getElementById('getAiSummaryBtn');
        
        // Filter Elements
        const searchName = document.getElementById('searchName');
        const filterLocation = document.getElementById('filterLocation');
        const filterCourse = document.getElementById('filterCourse');
        const sortBy = document.getElementById('sortBy');

        // Modal Content Elements
        const modalTitle = document.getElementById('modalTitle');
        const modalLocation = document.getElementById('modalLocation');
        const modalWebsite = document.getElementById('modalWebsite');
        const modalFees = document.getElementById('modalFees');
        const modalHighestPackage = document.getElementById('modalHighestPackage');
        const modalAvgPackage = document.getElementById('modalAvgPackage');
        const modalBranchList = document.getElementById('modalBranchList');
        const aiSummarySection = document.getElementById('aiSummarySection');
        const aiSummaryContent = document.getElementById('aiSummaryContent');
        
        // Helper: derive GM/default cutoff for a branch
        function getDefaultCutoff(college, branch) {
            const branchData = college.cutoffs && college.cutoffs[branch];
            if (!branchData) return null;
            if (branchData.GM) return branchData.GM;
            const values = Object.values(branchData);
            return values.length ? values[0] : null;
        }

        function hasCourseData(college, course) {
            if (course === 'All') return true;
            const branchData = college.cutoffs && college.cutoffs[course];
            return branchData && Object.keys(branchData).length > 0;
        }

        // =======================================================================
        // 4. RENDER COLLEGES FUNCTION (The Core)
        // =======================================================================
        function renderColleges() {
            collegeGrid.innerHTML = ''; // Clear existing grid

            // Debug: Log data structure
            if (collegeData.length > 0) {
                console.log('Sample college data:', collegeData[0]);
                console.log('Total colleges loaded:', collegeData.length);
            } else {
                console.error('No college data loaded!');
                collegeGrid.innerHTML = '<p style="color: var(--text-muted-dark); grid-column: 1 / -1; text-align: center;">No college data available. Please check database connection.</p>';
                return;
            }

            // Get filter values
            const searchTerm = searchName.value.toLowerCase();
            const location = filterLocation.value;
            const course = filterCourse.value;
            const sortOption = sortBy.value;

            // 1. Filter the data
            let filteredColleges = collegeData.filter(college => {
                // Name Filter
                const nameMatch = college.name.toLowerCase().includes(searchTerm);
                // Location Filter
                const locationMatch = (location === 'All') || (college.location === location);
                const courseMatch = hasCourseData(college, course);
                
                return nameMatch && locationMatch && courseMatch;
            });

            // 2. Sort the data
            filteredColleges.sort((a, b) => {
                const aCutoff = getDefaultCutoff(a, 'CSE') ?? 999999;
                const bCutoff = getDefaultCutoff(b, 'CSE') ?? 999999;
                
                switch (sortOption) {
                    case 'name_asc':
                        return a.name.localeCompare(b.name);
                    case 'name_desc':
                        return b.name.localeCompare(a.name);
                    case 'cutoff_asc':
                        return aCutoff - bCutoff;
                    case 'cutoff_desc':
                        return bCutoff - aCutoff;
                    default:
                        return a.name.localeCompare(b.name);
                }
            });

            // Debug: Log filtered results
            console.log(`Filtered ${filteredColleges.length} colleges for course: ${course}`);
            if (filteredColleges.length === 0 && course !== 'All') {
                // Check if any colleges have this course
                const collegesWithCourse = collegeData.filter(c => hasCourseData(c, course));
                console.log(`Colleges with ${course}:`, collegesWithCourse.length);
            }

            // 3. Create and append HTML cards
            if (filteredColleges.length === 0) {
                let message = 'No colleges match your criteria.';
                if (course !== 'All') {
                    message += ` Try selecting a different course or "All Courses".`;
                }
                collegeGrid.innerHTML = `<p style="color: var(--text-muted-dark); grid-column: 1 / -1; text-align: center; padding: 2rem;">${message}</p>`;
                return;
            }

            filteredColleges.forEach(college => {
                const card = document.createElement('div');
                card.className = 'college-card';
                // THIS IS THE KEY: We pass the college's unique ID to openModal
                card.onclick = () => openModal(college.id); 
                
                const gmCutoff = getDefaultCutoff(college, 'CSE');
                card.innerHTML = `
                    <h3>${college.name}</h3>
                    <p><strong>Location:</strong> ${college.location}</p>
                    <p><strong>GM CSE Cutoff:</strong> ~${gmCutoff ?? 'N/A'}</p>
                    <p><strong>Avg. Fees:</strong> ${college.fees}/year</p>
                `;
                collegeGrid.appendChild(card);
            });
        }

        // =======================================================================
        // 5. MODAL FUNCTIONS (Now Dynamic)
        // =======================================================================
        function openModal(collegeId) {
            // 1. Find the college in our database
            const college = collegeData.find(c => c.id === collegeId);
            if (!college) return; // Safety check

            // 2. Populate the modal with data from the database
            modalTitle.textContent = college.name;
            modalLocation.textContent = college.location;
            modalWebsite.href = college.website;
            modalWebsite.textContent = college.website;
            modalFees.textContent = college.fees;
            modalHighestPackage.textContent = college.packages.high;
            modalAvgPackage.textContent = college.packages.avg;

            // 3. Dynamically create the branch cutoff list
            modalBranchList.innerHTML = '';
            if (college.cutoffs) {
                for (const [branch, categories] of Object.entries(college.cutoffs)) {
                    const li = document.createElement('li');
                    const entries = Object.entries(categories || {});
                    if (entries.length === 0) {
                        li.textContent = `${branch}: data unavailable`;
                    } else {
                        const gm = categories?.GM ?? entries[0][1];
                        const categoryDetails = entries
                            .map(([cat, value]) => `${cat}: ~${value}`)
                            .join(', ');
                        li.innerHTML = `<strong>${branch}</strong>: GM ~${gm}${entries.length > 1 ? `<br/><small>${categoryDetails}</small>` : ''}`;
                    }
                    modalBranchList.appendChild(li);
                }
            } else {
                modalBranchList.innerHTML = '<li>Cutoff data not available.</li>';
            }

            // 4. Reset AI summary and store college name for API call
            aiSummarySection.style.display = 'none';
            aiSummaryContent.innerHTML = '';
            getAiSummaryBtn.dataset.collegeName = college.name; // Store name for AI
            getAiSummaryBtn.disabled = false;
            getAiSummaryBtn.textContent = 'Get AI Summary';

            // 5. Show the modal
            modal.style.display = 'block';
        }

        function closeModal() {
            modal.style.display = 'none';
        }

        // =======================================================================
        // 6. AI SUMMARY FUNCTION
        // =======================================================================
        async function fetchAiSummary() {
            const collegeName = getAiSummaryBtn.dataset.collegeName;
            if (!collegeName) return;

            if (!API_KEY) {
                aiSummarySection.style.display = 'block';
                aiSummaryContent.textContent = 'Error: API_KEY is not set. Please add your Google AI API key to the script.';
                return;
            }

            // Show loading state
            aiSummarySection.style.display = 'block';
            aiSummaryContent.innerHTML = '<div class="loading-dots"><span></span><span></span><span></span></div>';
            getAiSummaryBtn.disabled = true;
            getAiSummaryBtn.textContent = 'Generating...';

            const prompt = `Provide a brief, 2-3 sentence summary for a student asking about ${collegeName}, Karnataka. Focus on its reputation, key branches, and typical placement quality.`;

            try {
                const payload = {
                    contents: [{ parts: [{ text: prompt }] }],
                    systemInstruction: {
                        parts: [{ text: "You are an expert on Karnataka CET colleges, providing brief summaries for students." }]
                    },
                };

                const response = await fetch(API_URL, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(payload)
                });

                if (!response.ok) throw new Error(`API request failed with status ${response.status}`);

                const result = await response.json();
                const text = result.candidates?.[0]?.content?.parts?.[0]?.text;
                
                aiSummaryContent.textContent = text || 'Could not retrieve a summary.';

            } catch (error) {
                console.error('AI Summary Error:', error);
                aiSummaryContent.textContent = 'Sorry, unable to fetch AI summary at this time.';
            } finally {
                getAiSummaryBtn.disabled = false;
                getAiSummaryBtn.textContent = 'Get AI Summary';
            }
        }

        // =======================================================================
        // 7. EVENT LISTENERS
        // =======================================================================
        
        // Modal Listeners
        modalCloseBtn.onclick = closeModal;
        getAiSummaryBtn.onclick = fetchAiSummary;
        window.onclick = function(event) {
            if (event.target === modal) {
                closeModal();
            }
        }

        // Filter Listeners
        searchName.addEventListener('input', renderColleges);
        filterLocation.addEventListener('change', renderColleges);
        filterCourse.addEventListener('change', renderColleges);
        sortBy.addEventListener('change', renderColleges);

        // =======================================================================
        // 8. INITIAL PAGE LOAD
        // =======================================================================
        // Run renderColleges() once when the page loads to show all colleges
        document.addEventListener('DOMContentLoaded', renderColleges);

    </script>
</body>
</html>