<?php
$servername = "localhost";
$username = "root";
$password = "";  // default in XAMPP is empty
$database = "career_guidance_system"; // change to your database name
$port = 3308; // if you changed MySQL port

// Create connection
$conn = new mysqli($servername, $username, $password, $database, $port);

// Check connection
if ($conn->connect_error) {
    die("❌ Connection failed: " . $conn->connect_error);
} else {
    echo " ";
}

// Don't close connection here - let user.php use it
?>
