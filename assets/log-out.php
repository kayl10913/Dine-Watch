<?php
session_start(); // Start the session

// Include the database connection configuration
include '../assets/config.php';

// Check if the user is logged in
if (isset($_SESSION['username']) && isset($_SESSION['user_id']) && isset($_SESSION['role'])) {
    // Capture user details from the session
    $username = $_SESSION['username'];
    $user_id = $_SESSION['user_id'];
    $role = $_SESSION['role'];

    // Log the logout activity
    $action_type = "Logout";
    $action_details = "$username logged out";
    $log_sql = "INSERT INTO activity_logs (action_by, action_type, action_details) VALUES (?, ?, ?)";
    $log_stmt = $conn->prepare($log_sql);
    $log_stmt->bind_param('iss', $user_id, $action_type, $action_details);
    $log_stmt->execute();
    $log_stmt->close(); // Close the statement

    // Unset all session variables
    $_SESSION = [];

    // Destroy the session
    session_destroy();

    // Redirect based on user role
    if (in_array($role, ['Owner', 'Admin', 'Staff'])) {
        header("Location: ../ad-sign-in.php");
    } else {
        header("Location: ../index.php");
    }
    exit();
} else {
    // If the user is not logged in, redirect directly to the index page
    header("Location: ../ad-sign-in.php");
    exit();
}
?>
