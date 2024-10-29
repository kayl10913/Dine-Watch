<?php
// config.php

// Database configuration settings
$host = 'localhost';  // Database host
$dbname = 'dine-watch'; // Database name
$username = 'root';   // Database username (change if needed)
$password = '';       // Database password (change if needed)

// Create a new connection
$conn = new mysqli($host, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// To close the connection when done
// $conn->close();
