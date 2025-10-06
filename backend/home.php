<?php
session_start(); // Must start the session to access session variables

// Check if the user is logged in. If not, redirect to the login page.
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// Get user's full name from session to display
$user_fullname = $_SESSION['user_fullname'];
?>

<!DOCTYPE html>
<html lang="en" data-theme="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Career Guidance System</title>
    
    <link rel="stylesheet" href="../frontend/home.css">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <header>
        <nav class="navbar">
            <a href="index.html" class="nav-brand">CET Guidance</a>
            <ul class="nav-menu">
                <li><a href="home.php" class="nav-link active">Home</a></li>
                <li><a href="colleges.php" class="nav-link">Colleges</a></li>
                <li><a href="recommendations.php" class="nav-link">Recommendations</a></li>
                <li><a href="AiCounselor.php" class="nav-link">AI Counselor</a></li>
                <li><a href="FIQ.php" class="nav-link">FAQ</a></li>
                <li><a href="about.php" class="nav-link">About</a></li>
            </ul>
            <div class="nav-right-items">
                                    <a href="logout.php" class="logout-button">Logout</a>
            </div>
        </nav>
    </header>

    <main id="home">
        <div class="container">
            <h1>Welcome, <?php echo htmlspecialchars($user_fullname); ?>!</h1>
            <p>Your ultimate guide for CET counseling, college selection, and option entry. Make informed decisions with confidence and clarity.</p>
            <div class="home-search-container">
                <input type="text" placeholder="Quick search for colleges...">
                <button>Search</button>
            </div>
        </div>
    </main>
</body>
</html>