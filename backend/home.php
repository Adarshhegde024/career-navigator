<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - CET NAVIGATOR</title>
    
    <!-- Make sure this path is correct for your folder structure -->
    <link rel="stylesheet" href="../frontend/home.css"> 
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>

    <?php
    session_start(); 

    /*
    // --- SECURITY CHECK (Temporarily Disabled for Testing) ---
    // This code checks if a user is logged in and redirects them if they are not.
    // We have "commented it out" so you can test the page design.
    //
    if (!isset($_SESSION['user_id'])) {
        header("Location: login.php");
        exit();
    }
    // $user_fullname = $_SESSION['user_fullname'];
    // --- END OF DISABLED CODE ---
    */

    // --- PLACEHOLDER FOR TESTING ---
    // This line welcomes a logged-in user by name, 
    // or just says "Student" if they are a public visitor.
    $user_fullname = $_SESSION['user_fullname'] ?? "Student"; 

    ?>

    <header>
        <nav class="navbar">
            
            <!-- This container holds the new animated logo and brand name -->
            <div class="nav-brand-container">
                <a href="home.php" class="nav-brand-logo-link">
                    
                    <!-- SVG for the animated book logo -->
                    <svg class="book-logo" viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
                        
                        <!-- Book Covers -->
                        <rect class="book-cover left" x="0" y="10" width="48" height="80" rx="5" fill="#3B82F6"/>
                        <rect class="book-cover right" x="52" y="10" width="48" height="80" rx="5" fill="#3B82F6"/>
                        
                        <!-- Book Pages (animated) -->
                        <rect class="book-page left-page-1" x="5" y="15" width="40" height="70" rx="3" fill="#E0F2FE"/>
                        <rect class="book-page left-page-2" x="10" y="15" width="35" height="70" rx="3" fill="#BFDBFE"/>
                        <rect class="book-page right-page-1" x="55" y="15" width="40" height="70" rx="3" fill="#E0F2FE"/>
                        <rect class="book-page right-page-2" x="55" y="15" width="35" height="70" rx="3" fill="#BFDBFE"/>

                        <!-- Book Spine -->
                        <rect class="book-spine" x="48" y="10" width="4" height="80" fill="#2563EB"/>
                        
                        <!-- Text (animated) -->
                        <text class="book-text cet" x="50" y="45" font-size="20" font-weight="bold" fill="#1E40AF" text-anchor="middle" dominant-baseline="middle">CET</text>
                        <text class="book-text navigator" x="50" y="70" font-size="12" font-weight="bold" fill="#1E40AF" text-anchor="middle" dominant-baseline="middle">NAVIGATOR</text>
                    </svg>
                    
                    <!-- This text is next to the logo, as in your sketch -->
                    <span class="nav-brand-text">CET NAVIGATOR</span>
                </a>
            </div>

            <!-- Main Navigation Menu -->
            <ul class="nav-menu">
                <li><a href="home.php" class="nav-link active">Home</a></li>
                <li><a href="colleges.php" class="nav-link">Colleges</a></li>
                <li><a href="recommendations.php" class="nav-link">Recommendations</a></li>
                <li><a href="AiCounselor.php" class="nav-link">AI Counselor</a></li>
                <li><a href="FIQ.php" class="nav-link">FAQ</a></li>
                <li><a href="about.php" class="nav-link">About</a></li>
            </ul>
            
            <!-- Logout Button -->
            <div class="nav-right-items">
                <a href="admin/login.php" class="nav-link" style="padding: 0.6rem 1rem; border: 1px solid rgba(255,255,255,0.2); border-radius: 999px;">
                    Admin Login
                </a>
            </div>
        </nav>
    </header>

    <main>
        <!-- Hero Section with Welcome and Search -->
        <div class="hero-section">
            <h1 class="welcome-message">Welcome, <?php echo htmlspecialchars($user_fullname); ?>!</h1>
            <p class="hero-subtitle">Your personalized guide to CET college admissions.</p>
           
        </div>

        <!-- Vision and Mission Section -->
        <div class="content-sections container">
            <div class="vision-mission-grid">
                <div class="card">
                    <h3 class="card-title">Our Vision</h3>
                    <p class="card-content">To empower every CET student with comprehensive, accessible, and personalized guidance, ensuring they make informed decisions for a successful academic and professional future.</p>
                </div>
                <div class="card">
                    <h3 class="card-title">Our Mission</h3>
                    <p class="card-content">To provide a dynamic web platform offering up-to-date college information, cutoff analyses, and an intuitive option entry process, supported by AI-driven insights.</p>
                </div>
            </div>
        </div>
    </main>

    <!-- JavaScript for the Search Bar -->
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const searchInput = document.getElementById('homeSearchInput');
            const searchButton = document.getElementById('homeSearchButton');

            const performSearch = () => {
                const query = searchInput.value.trim();
                if (query) {
                    // Store the query in localStorage to be picked up by colleges.php
                    localStorage.setItem('homeSearchQuery', query);
                    window.location.href = 'colleges.php'; // Redirect to colleges page
                }
            };

            searchButton.addEventListener('click', performSearch);

            // Allow search on Enter key press
            searchInput.addEventListener('keypress', (event) => {
                if (event.key === 'Enter') {
                    event.preventDefault(); // Stop form submission (if it was in a form)
                    performSearch(); // Trigger the search
                }
            });
        });
    </script>

</body>
</html>

