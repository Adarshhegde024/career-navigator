<?php
session_start();
if (empty($_SESSION['is_admin'])) {
    header('Location: login.php');
    exit;
}

require_once __DIR__ . '/../db.php';

$uploadDir = __DIR__ . '/../uploads';
if (!is_dir($uploadDir)) {
    mkdir($uploadDir, 0775, true);
}

function redirect_with_message($status, $message) {
    header('Location: dashboard.php?status=' . urlencode($status) . '&message=' . urlencode($message));
    exit;
}

function slugify_name($name) {
    $slug = preg_replace('/[^a-z0-9]+/i', '-', strtolower(trim($name)));
    return trim($slug, '-');
}

function normalize_branch($value) {
    $value = strtoupper(trim($value));
    $map = [
        'COMPUTER' => 'CSE',
        'INFORMATION' => 'ISE',
        'ELECTRONICS' => 'ECE',
        'MECHANICAL' => 'ME',
        'ARTIFICIAL' => 'AIML',
        'AI' => 'AIML',
    ];

    foreach ($map as $keyword => $branch) {
        if (str_contains($value, $keyword)) {
            return $branch;
        }
    }

    if (in_array($value, ['CSE', 'ISE', 'ECE', 'ME', 'AIML'], true)) {
        return $value;
    }

    return null;
}

function normalize_category($value) {
    $value = strtoupper(trim($value));
    $value = str_replace([' ', '-', '_'], '', $value);

    $aliases = [
        'GM' => 'GM',
        'GMR' => 'GM',
        'SCG' => 'SC',
        'SC' => 'SC',
        'STG' => 'ST',
        'ST' => 'ST',
        '2A' => '2A',
        '2AG' => '2A',
        '3A' => '3A',
        '3AG' => '3A',
        '2B' => '2B',
        '3B' => '3B',
        'CAT1' => 'CAT-1',
        'CAT-1' => 'CAT-1',
    ];

    return $aliases[$value] ?? null;
}

if (empty($_FILES['cutoff_file']['name'])) {
    redirect_with_message('error', 'Please choose a file to upload.');
}

$file = $_FILES['cutoff_file'];
if ($file['error'] !== UPLOAD_ERR_OK) {
    redirect_with_message('error', 'Upload failed. Please try again.');
}

$fileType = $_POST['file_type'] ?? '';
$extension = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
$tempPath = $uploadDir . '/' . uniqid('cutoffs_', true) . '.' . $extension;

// Check if selected file type matches the file extension
if (($fileType === 'xlsx' && $extension !== 'xlsx') ||
    ($fileType === 'csv' && $extension !== 'csv') ||
    ($fileType === 'pdf' && $extension !== 'pdf')) {
    redirect_with_message('error', 'Selected file type does not match uploaded file extension.');
}

if (!move_uploaded_file($file['tmp_name'], $tempPath)) {
    redirect_with_message('error', 'Unable to store the uploaded file.');
}

$rows = [];

if ($fileType === 'csv') {
    if (($handle = fopen($tempPath, 'r')) !== false) {
        $header = fgetcsv($handle);
        if (!$header) {
            redirect_with_message('error', 'CSV file has no header row.');
        }
        $header = array_map(fn($h) => strtolower(trim($h)), $header);

        while (($data = fgetcsv($handle)) !== false) {
    // Skip rows with mismatched columns
    if (count($data) !== count($header)) {
        continue;
    }
    $row = array_combine($header, $data);
    $rows[] = [
        'college' => $row['college'] ?? $row['college name'] ?? $row['institute'] ?? '',
        'branch' => $row['branch'] ?? $row['course'] ?? '',
        'category' => $row['category'] ?? $row['quota'] ?? '',
        'cutoff' => $row['cutoff'] ?? $row['closing rank'] ?? '',
    ];
}
        fclose($handle);
    }
} elseif ($extension === 'xlsx') {
    $script = escapeshellcmd("python \"" . __DIR__ . "/../scripts/parse_cutoffs.py\" \"" . $tempPath . "\"");
    $output = shell_exec($script);
    if ($output === null) {
        redirect_with_message('error', 'Failed to parse the Excel file.');
    }
    $rows = json_decode($output, true);
    if (!is_array($rows)) {
        redirect_with_message('error', 'Invalid Excel format. Ensure it contains College, Branch, Category, and Cutoff columns.');
    }
} elseif ($extension === 'pdf') {
    $script = escapeshellcmd("python \"" . __DIR__ . "/../scripts/parse_cutoffs_pdf.py\" \"" . $tempPath . "\"");
    $output = shell_exec($script);
    if ($output === null) {
        redirect_with_message('error', 'Failed to parse the PDF file.');
    }
    $decoded = json_decode($output, true);
    if (isset($decoded['error'])) {
        redirect_with_message('error', 'Gemini error: ' . $decoded['error']);
    }
    $rows = $decoded;
} else {
    redirect_with_message('error', 'Unsupported file type. Please upload a .xlsx, .csv, or .pdf file.');
}

if (empty($rows)) {
    redirect_with_message('error', 'No rows detected in the uploaded file.');
}

$missingColleges = [];
$unknownBranches = [];
$unknownCategories = [];
$processed = 0;

$conn->begin_transaction();

$stmtLookup = $conn->prepare("SELECT id FROM colleges WHERE slug = ?");
$stmtInsert = $conn->prepare("
    INSERT INTO branch_cutoffs (college_id, branch, category, cutoff)
    VALUES (?, ?, ?, ?)
    ON DUPLICATE KEY UPDATE cutoff = VALUES(cutoff)
");

foreach ($rows as $row) {
    $collegeName = trim($row['college'] ?? '');
    $branchName = trim($row['branch'] ?? '');
    $categoryName = trim($row['category'] ?? '');
    $cutoffValue = trim($row['cutoff'] ?? '');

    if ($collegeName === '' || $branchName === '' || $categoryName === '' || $cutoffValue === '') {
        continue;
    }

    $branch = normalize_branch($branchName);
    if (!$branch) {
        $unknownBranches[$branchName] = true;
        continue;
    }

    $category = normalize_category($categoryName);
    if (!$category) {
        $unknownCategories[$categoryName] = true;
        $category = 'GM';
    }
    $cutoff = (int) preg_replace('/[^0-9]/', '', $cutoffValue);
    if ($cutoff <= 0) {
        continue;
    }

    $slug = slugify_name($collegeName);
    $stmtLookup->bind_param('s', $slug);
    $stmtLookup->execute();
    $result = $stmtLookup->get_result();
    $collegeRow = $result->fetch_assoc();
    if (!$collegeRow) {
        $missingColleges[$collegeName] = true;
        continue;
    }

    $collegeId = (int) $collegeRow['id'];
    $stmtInsert->bind_param('issi', $collegeId, $branch, $category, $cutoff);
    $stmtInsert->execute();
    $processed++;
}

$conn->commit();
$stmtLookup->close();
$stmtInsert->close();

unlink($tempPath);

$messages = [];
$messages[] = "Processed {$processed} cutoff rows.";
if ($missingColleges) {
    $messages[] = "Skipped unknown colleges: " . implode(', ', array_keys($missingColleges));
}
if ($unknownBranches) {
    $messages[] = "Skipped unknown branches: " . implode(', ', array_keys($unknownBranches));
}
if ($unknownCategories) {
    $messages[] = "Skipped unknown categories: " . implode(', ', array_keys($unknownCategories));
}

redirect_with_message('success', implode("\n", $messages));

