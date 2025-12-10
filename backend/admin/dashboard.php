<?php
session_start();
if (empty($_SESSION['is_admin'])) {
    header('Location: login.php');
    exit;
}

$status = $_GET['status'] ?? '';
$message = $_GET['message'] ?? '';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - CET Navigator</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #0f172a;
            color: #e2e8f0;
            margin: 0;
            min-height: 100vh;
        }
        header {
            padding: 1.5rem;
            background: #020617;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        main {
            max-width: 800px;
            margin: 2rem auto;
            padding: 0 1rem;
        }
        .card {
            background: #1e293b;
            padding: 2rem;
            border-radius: 16px;
            box-shadow: 0 20px 50px rgba(15, 23, 42, 0.5);
        }
        input[type="file"],
        button,
        select {
            width: 100%;
            margin-top: 0.5rem;
            padding: 0.8rem;
            border: none;
            border-radius: 10px;
            background: #0f172a;
            color: #e2e8f0;
        }
        button {
            background: linear-gradient(135deg, #2563eb, #38bdf8);
            cursor: pointer;
            font-weight: 600;
        }
        .alert {
            padding: 1rem;
            border-radius: 10px;
            margin-bottom: 1rem;
        }
        .alert.success {
            background: rgba(34,197,94,0.15);
            color: #bbf7d0;
        }
        .alert.error {
            background: rgba(248,113,113,0.15);
            color: #fecaca;
        }
        a.logout {
            color: #e2e8f0;
            text-decoration: none;
        }
        ul.hints {
            padding-left: 1.2rem;
            color: #94a3b8;
            font-size: 0.95rem;
        }
    </style>
</head>
<body>
    <header>
        <div>
            <strong>Admin</strong> &middot; <?= htmlspecialchars($_SESSION['admin_email'] ?? '') ?>
        </div>
        <a class="logout" href="logout.php">Logout</a>
    </header>
    <main>
        <div class="card">
            <h2>Upload Latest KEA Cutoffs</h2>
            <p>Upload the official KEA cutoff sheet (Excel <code>.xlsx</code>, CSV, or the raw KEA PDF). The system will read college, branch, category, and rank, then update the database automatically.</p>
            <ul class="hints">
                <li>Ensure the sheet has headers for College, Branch/Course, Category, and Cutoff Rank.</li>
                <li>PDF uploads require a valid <code>GEMINI_API_KEY</code> environment variable so Gemini 1.5 Pro can extract the tables.</li>
                <li>Existing cutoffs for the affected colleges/branches will be updated in place.</li>
            </ul>
            <?php if ($status && $message): ?>
                <div class="alert <?= $status === 'success' ? 'success' : 'error' ?>">
                    <?= nl2br(htmlspecialchars($message)) ?>
                </div>
            <?php endif; ?>
            <form action="process_upload.php" method="post" enctype="multipart/form-data">
    <label for="file-type">File Type</label>
    <select id="file-type" name="file_type" required>
        <option value="xlsx">Excel (.xlsx)</option>
        <option value="csv">CSV (.csv)</option>
        <option value="pdf">PDF (.pdf)</option>
    </select>
    <label for="cutoff-file">Cutoff File</label>
    <input type="file" id="cutoff-file" name="cutoff_file" accept=".xlsx,.csv,.pdf" required>
    <button type="submit">Upload &amp; Process</button>
</form>
        </div>
    </main>
</body>
</html>

