<?php
session_start();
require 'db.php';

$message = '';

if (isset($_SESSION['user_id'])) {
    header("Location: home.php");
    exit();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    if (empty($email) || empty($password)) {
        $message = '<div class="message error">Email and password are required.</div>';
    } else {
        // Prepare a statement to select the user from the 'login' table
        $stmt = $conn->prepare("SELECT id, FullName, Password FROM login WHERE Email = ?"); // CHANGED HERE
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows == 1) {
            $user = $result->fetch_assoc();
            if (password_verify($password, $user['Password'])) {
                $_SESSION['user_id'] = $user['id'];
                $_SESSION['user_fullname'] = $user['FullName'];
                
                header("Location: home.php");
                exit();
            } else {
                $message = '<div class="message error">Invalid email or password.</div>';
            }
        } else {
            $message = '<div class="message error">Invalid email or password.</div>';
        }
        $stmt->close();
    }
    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - CET Guidance</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../frontend/login.css">
</head>
<body>

    <div class="auth-container">
        <div class="auth-form-wrapper">

            <form method="post" action="login.php" id="loginForm" class="auth-form">
                <h2>Student Login</h2>
                <?php echo $message; ?>
                <div class="input-group">
                    <label for="loginEmail">Email</label>
                    <input type="email" id="loginEmail" name="email" required>
                </div>
                <div class="input-group">
                    <label for="loginPassword">Password</label>
                    <input type="password" id="loginPassword" name="password" required>
                </div>
                <button type="submit">Login</button>
                <p class="auth-toggle-link">
                    Don't have an account? <a href="signup.php">Sign Up</a>
                </p>
            </form>
        </div>
    </div>

</body>
</html>