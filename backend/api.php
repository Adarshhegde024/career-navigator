<?php
// Set the content type header to application/json
header('Content-Type: application/json');

// 1. RECEIVE THE USER'S MESSAGE
$jsonInput = file_get_contents('php://input');
$data = json_decode($jsonInput);

if (!isset($data->prompt)) {
    echo json_encode(['reply' => 'Error: No prompt provided.']);
    exit;
}

$userPrompt = $data->prompt;
$botReply = '';

// 2. PROCESS THE MESSAGE (THIS IS WHERE YOU CALL THE AI)

/*
// --- START: Simple Demo Logic (Commented out) ---
// This block is disabled.
$lowerPrompt = strtolower($userPrompt);
if (strpos($lowerPrompt, 'hello') !== false || strpos($lowerPrompt, 'hi') !== false) {
    $botReply = 'Hello! This is a test.';
} else {
    $botReply = "THIS IS A NEW TEST 123. THE FILE IS WORKING.";
}
// --- END: Simple Demo Logic ---
*/


// --- START: Real AI API Call (This is now active) ---

// ▼▼▼▼▼▼▼NT_API_KEY_HERE';
// 
// PLEASE create a new, safe key and put it here.
// The key you pasted in our chat is not safe to use!
//
$apiKey = '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';
$apiUrl = 'https://api.groq.com/openai/v1/chat/completions';

$postData = [
    'model' => 'openai/gpt-oss-120b',
    'messages' => [
        [
            'role' => 'system',
            'content' => "You are an expert career counselor for CET exams in India. Keep your answers brief (2-3 sentences) and helpful."
        ],
        [
            'role' => 'user',
            'content' => $userPrompt
        ]
    ]
];

$ch = curl_init($apiUrl);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($postData));
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    'Content-Type: application/json',
    'Authorization: Bearer ' . $apiKey
]);
$apiResponse = curl_exec($ch);
if (curl_errno($ch)) {
    error_log('cURL error: ' . curl_error($ch));
}
curl_close($ch);

$result = json_decode($apiResponse, true);
if (isset($result['choices'][0]['message']['content'])) {
    $botReply = $result['choices'][0]['message']['content'];
} else {
    $errorDetails = json_encode($result['error'] ?? 'Unknown API error');
    $botReply = "Sorry, I couldn't get a response from the AI. Please try again later. Error: " . $errorDetails;
}
// --- END: Real AI API Call ---


// 3. SEND THE REPLY BACK TO THE FRONTEND
// Encode the reply as JSON and send it
echo json_encode(['reply' => $botReply]);

?>
