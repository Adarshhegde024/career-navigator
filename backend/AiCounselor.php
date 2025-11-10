<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Counselor - CET Navigator</title>
    <link rel="stylesheet" href="../frontend/AiCounselor.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>

    <header>
        <nav class="navbar">
            <a href="index.html" class="nav-brand">CET Navigator</a>
            <ul class="nav-menu">
                <li><a href="home.php" class="nav-link">Home</a></li>
                <li><a href="colleges.php" class="nav-link">Colleges</a></li>
                <li><a href="recommendations.php" class="nav-link">Recommendations</a></li>
                <li><a href="AiCounselor.php" class="nav-link active">AI Counselor</a></li>
                <li><a href="FIQ.php" class="nav-link">FAQ</a></li>
                <li><a href="about.php" class="nav-link">About</a></li>
            </ul>
            
        </nav>
    </header>

    <main>
        <div class="container">
            <h2 class="section-title">AI Career Counselor</h2>
            <p class="section-subtitle">Have questions about colleges, branches, or career paths? Ask our AI assistant.</p>
            
                        <div class="chat-window" id="chatWindow">
                <div class="chat-message bot-message">
                    Hello! How can I help you with your CET and career questions today?
                </div>
                                <div class="chat-message user-message">
                    What are the placement opportunities for ECE?
                </div>
                                 <div class="chat-message bot-message">
                    Electronics and Communication Engineering (ECE) offers diverse career paths in telecommunications, IoT, VLSI design, and embedded systems. Many top companies recruit ECE graduates for roles in both hardware and software.
                </div>
            </div>

                        <form class="chat-form" id="chatForm">
                <input type="text" id="chatInput" placeholder="Ask a question..." required>
                <button type="submit" id="chatSendBtn">Send</button>
            </form>
        </div>
    </main>

    <script src="chat.js"></script>

</body>
</html>