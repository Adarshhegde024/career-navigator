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
$apiKey = 'AIzaSyBZjWXQjohyjOWuRzv1GKGyAa1I1tel_MA';
//
// ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲

//
// This is the correct model name you gave me from your curl command
//
$apiUrl = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent';

// The data to send to the API
$postData = [
    'contents' => [
        [
            'parts' => [
                // You can change this system prompt to guide the AI
                ['text' => "You are an expert career counselor for CET exams in India. Keep your answers brief (2-3 sentences) and helpful. User's question: " . $userPrompt]
            ]
        ]
    ]
];

// Use cURL to make the API request
$ch = curl_init($apiUrl);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($postData));
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    'Content-Type: application/json',
    'X-goog-api-key: ' . $apiKey
]);


$apiResponse = curl_exec($ch);
curl_close($ch);

// Decode the API's response
$result = json_decode($apiResponse, true);

// Extract the text from the response
if (isset($result['candidates'][0]['content']['parts'][0]['text'])) {
    $botReply = $result['candidates'][0]['content']['parts'][0]['text'];
} else {
    // If the API fails, send back the error message it returned
    $errorDetails = json_encode($result['error'] ?? 'Unknown API error');
    $botReply = "Sorry, I couldn't get a response from the AI. Please try again later. Error: " . $errorDetails;
    // You can also log the error: error_log($apiResponse);
}
// --- END: Real AI API Call ---


// 3. SEND THE REPLY BACK TO THE FRONTEND
// Encode the reply as JSON and send it
echo json_encode(['reply' => $botReply]);

?>
