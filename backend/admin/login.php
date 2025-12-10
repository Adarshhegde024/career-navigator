<?php
session_start();
require_once __DIR__ . '/../db.php';

$error = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';

    if ($email === '' || $password === '') {
        $error = 'Please enter email and password.';
    } else {
        $stmt = $conn->prepare("SELECT id, email, password_hash FROM admin_users WHERE email = ?");
        if ($stmt) {
        $stmt->bind_param('s', $email);
        $stmt->execute();
        $result = $stmt->get_result();
        $admin = $result->fetch_assoc();
        $stmt->close();

        if ($admin && password_verify($password, $admin['password_hash'])) {
            session_regenerate_id(true);
            $_SESSION['is_admin'] = true;
            $_SESSION['admin_email'] = $admin['email'];
            $_SESSION['admin_id'] = (int) $admin['id'];

            $update = $conn->prepare("UPDATE admin_users SET last_login = NOW() WHERE id = ?");
                if ($update) {
            $update->bind_param('i', $admin['id']);
            $update->execute();
            $update->close();
                }

            header('Location: dashboard.php');
            exit;
        } else {
            $error = 'Invalid admin credentials.';
            }
        } else {
            $error = 'Admin login is not configured correctly. Please ensure the admin_users table exists.';
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - CET Navigator</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #0f172a;
            color: #e2e8f0;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
        }
        .card {
            background: #1e293b;
            padding: 2rem;
            border-radius: 16px;
            width: 100%;
            max-width: 420px;
            box-shadow: 0 20px 50px rgba(15, 23, 42, 0.5);
        }
        h1 {
            margin-top: 0;
            font-size: 1.5rem;
            color: #38bdf8;
        }
        .input-group {
            margin-bottom: 1rem;
        }
        label {
            display: block;
            font-size: 0.9rem;
            margin-bottom: 0.4rem;
        }
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 0.8rem;
            border-radius: 10px;
            border: none;
            background: #0f172a;
            color: #e2e8f0;
        }
        button {
            width: 100%;
            padding: 0.9rem;
            border: none;
            border-radius: 10px;
            background: linear-gradient(135deg, #2563eb, #38bdf8);
            color: #fff;
            font-weight: 600;
            cursor: pointer;
        }
        .error {
            background: rgba(239,68,68,0.15);
            color: #fecaca;
            padding: 0.8rem;
            border-radius: 10px;
            margin-bottom: 1rem;
        }
        .password-wrapper {
            position: relative;
        }
        .show-password {
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
            font-size: 0.85rem;
            color: #94a3b8;
            margin-top: 0.4rem;
        }
        .show-password input {
            width: auto;
            margin: 0;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>Admin Login</h1>
        <?php if ($error): ?>
            <div class="error"><?= htmlspecialchars($error) ?></div>
        <?php endif; ?>
        <form method="post" action="login.php">
            <div class="input-group">
                <label for="email">Admin Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <div class="password-wrapper">
                    <input type="password" id="password" name="password" required>
                </div>
                <label class="show-password">
                    <input type="checkbox" id="togglePassword">
                    Show password
                </label>
            </div>
            <button type="submit">Sign In</button>
        </form>
        <p style="text-align:center; margin-top:1.5rem; font-size:0.9rem;">
            <a href="../home.php" style="color:#38bdf8; text-decoration:none;">Back to CET Navigator</a>
        </p>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const checkbox = document.getElementById('togglePassword');
            const passwordInput = document.getElementById('password');
            checkbox.addEventListener('change', () => {
                passwordInput.type = checkbox.checked ? 'text' : 'password';
            });
        });
    </script>
</body>
</html>

