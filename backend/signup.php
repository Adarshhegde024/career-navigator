
<?php
require 'db.php';

$message = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $fullName = $_POST['fullName'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    if (empty($fullName) || empty($email) || empty($password)) {
        $message = '<div class="message error">All fields are required.</div>';
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $message = '<div class="message error">Invalid email format.</div>';
    } else {
        // Check if email already exists in the 'login' table
        $stmt = $conn->prepare("SELECT id FROM login WHERE Email = ?"); // CHANGED HERE
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->store_result();

        if ($stmt->num_rows > 0) {
            $message = '<div class="message error">This email is already registered.</div>';
        } else {
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);

            // Insert new user into the 'login' table
            $stmt = $conn->prepare("INSERT INTO login (FullName, Email, Password) VALUES (?, ?, ?)"); // CHANGED HERE
            $stmt->bind_param("sss", $fullName, $email, $hashed_password);

            if ($stmt->execute()) {
                $message = '<div class="message success">Registration successful! You can now <a href="login.php">login</a>.</div>';
            } else {
                $message = '<div class="message error">Error: ' . $stmt->error . '</div>';
            }
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
    <title>Sign Up - CET Guidance</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../frontend/signup.css">
</head>
<body>

    <div class="auth-container">
        <div class="auth-form-wrapper">
            <form id="signupForm" class="auth-form" action="signup.php" method="post">
                <h2>Create Account</h2>
                <?php echo $message; ?>
                <div class="input-group">
                    <label for="signupName">Full Name</label>
                    <input type="text" id="signupName" name="fullName" required>
                </div>
                <div class="input-group">
                    <label for="signupEmail">Email</label>
                    <input type="email" id="signupEmail" name="email" required>
                </div>
                <div class="input-group">
                    <label for="signupPassword">Password</label>
                    <input type="password" id="signupPassword" name="password" required>
                </div>
                <button type="submit">Create Account</button>
                <p class="auth-toggle-link">
                    Already have an account? <a href="login.php">Login</a>
                </p>
            </form>
        </div>
    </div>

</body>
</html>