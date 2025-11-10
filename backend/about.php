<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About - CET Navigator</title>
    <!-- Your CSS path, updated to match your other files -->
    <link rel="stylesheet" href="../frontend/about.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>

    <header>
        <nav class="navbar">
            <a href="index.html" class="nav-brand">CET Navigator</a>
            <ul class="nav-menu">
                <!-- Changed to .php to match your other files -->
                <li><a href="home.php" class="nav-link">Home</a></li>
                <li><a href="colleges.php" class="nav-link">Colleges</a></li>
                <li><a href="recommendations.php" class="nav-link">Recommendations</a></li>
                <li><a href="AiCounselor.php" class="nav-link">AI Counselor</a></li>
                <li><a href="FIQ.php" class="nav-link">FAQ</a></li>
                <li><a href="about.php" class="nav-link active">About</a></li>
            </ul>
            <div class="nav-right-items"></div>
        </nav>
    </header>

    <main>
        <div class="container">
            <h2 class="section-title">About This Project</h2>
            <div class="about-content">
                <p>
                    The Career Guidance System for CET Students is a mini-project designed to address the challenges students face after completing their PUC. The primary goal is to provide a clear, reliable, and user-friendly web application that centralizes crucial information for the CET counseling process.
                </p>
                <p>
                    This platform helps students understand college options, cutoff trends, and the option entry process, empowering them to make informed decisions with confidence and reducing the stress associated with college admissions.
                </p>
                
                <h3 class="team-title">Developed By</h3>
                
                <!-- === MODIFIED HTML FOR ACCORDION === -->
                <ul class="team-list">
                    
                    <li class="team-member">
                        <button class="developer-name">
                            <span>Anand Holi</span>
                            <svg class="faq-arrow" width="24" height="24" viewBox="0 0 24 24"><path d="M7.41 8.59L12 13.17l4.59-4.58L18 10l-6 6-6-6 1.41-1.41z"/></svg>
                        </button>
                        <div class="developer-info">
                            <!-- !!! IMPORTANT: Replace '#' with the real LinkedIn URL -->
                            <a href="http://linkedin.com/in/anand-holi-2920b22a8" target="_blank">
                                For more information, visit LinkedIn profile &rarr;
                            </a>
                        </div>
                    </li>
                    
                    <li class="team-member">
                        <button class="developer-name">
                            <span>Adarsh Hegde</span>
                            <svg class="faq-arrow" width="24" height="24" viewBox="0 0 24 24"><path d="M7.41 8.59L12 13.17l4.59-4.58L18 10l-6 6-6-6 1.41-1.41z"/></svg>
                        </button>
                        <div class="developer-info">
                            <!-- !!! IMPORTANT: Replace '#' with the real LinkedIn URL -->
                            <a href="https://www.linkedin.com/in/adarsh-hegde-a53291314/" target="_blank">
                                For more information, visit LinkedIn profile &rarr;
                            </a>
                        </div>
                    </li>

                    <li class="team-member">
                        <button class="developer-name">
                            <span>Linganagouda Patil</span>
                            <svg class="faq-arrow" width="24" height="24" viewBox="0 0 24 24"><path d="M7.41 8.59L12 13.17l4.59-4.58L18 10l-6 6-6-6 1.41-1.41z"/></svg>
                        </button>
                        <div class="developer-info">
                            <!-- !!! IMPORTANT: Replace '#' with the real LinkedIn URL -->
                            <a href="https://www.linkedin.com/in/linganagouda-patil-3675a3299" target="_blank">
                                For more information, visit LinkedIn profile &rarr;
                            </a>
                        </div>
                    </li>

                    <li class="team-member">
                        <button class="developer-name">
                            <span>Chetan Magadum</span>
                            <svg class="faq-arrow" width="24" height="24" viewBox="0 0 24 24"><path d="M7.41 8.59L12 13.17l4.59-4.58L18 10l-6 6-6-6 1.41-1.41z"/></svg>
                        </button>
                        <div class="developer-info">
                            <!-- !!! IMPORTANT: Replace '#' with the real LinkedIn URL -->
                            <a href="https://www.linkedin.com/in/chetan-s-magadum-194418295" target="_blank">
                                For more information, visit LinkedIn profile &rarr;
                            </a>
                        </div>
                    </li>

                </ul>
            </div>
        </div>
    </main>

    <!-- === NEW JAVASCRIPT FOR ACCORDION === -->
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const teamMembers = document.querySelectorAll('.developer-name');

            teamMembers.forEach(member => {
                member.addEventListener('click', () => {
                    // Toggle the 'active' class on the parent <li> (which is .team-member)
                    member.parentElement.classList.toggle('active');
                });
            });
        });
    </script>

</body>
</html>
