<?php
// updateAdmin.php

error_reporting(E_ALL);
ini_set('display_errors', 1);

include_once "../assets/config.php";  // Include your DB connection file

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['user_id'])) {
    $user_id = intval($_POST['user_id']);  // Ensure user_id is an integer

    // Sanitize inputs
    $first_name = htmlspecialchars(trim($_POST['first_name']));
    $middle_initial = htmlspecialchars(trim($_POST['middle_initial']));
    $last_name = htmlspecialchars(trim($_POST['last_name']));
    $suffix = htmlspecialchars(trim($_POST['suffix']));
    $username = htmlspecialchars(trim($_POST['username']));
    $role = htmlspecialchars(trim($_POST['role']));
    $contact_number = htmlspecialchars(trim($_POST['contact_number']));
    $email = htmlspecialchars(trim($_POST['email']));
    $address = htmlspecialchars(trim($_POST['address']));
    $zip_code = htmlspecialchars(trim($_POST['zip_code']));

    // Validate email
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo json_encode(['status' => 'error', 'message' => 'Invalid email format.']);
        http_response_code(400);  // Bad Request
        exit;
    }

    // Validate contact number
    if (!preg_match('/^09\d{9}$/', $contact_number)) {
        echo json_encode(['status' => 'error', 'message' => 'Invalid contact number format.']);
        http_response_code(400);  // Bad Request
        exit;
    }

    // Validate zip code
    if (!empty($zip_code) && !preg_match('/^\d{5}$/', $zip_code)) {
        echo json_encode(['status' => 'error', 'message' => 'Invalid zip code format.']);
        http_response_code(400);  // Bad Request
        exit;
    }

    // Check if the email or username already exists for other users
    $check_sql = "SELECT user_id FROM users WHERE (email = ? OR username = ?) AND user_id != ?";
    $check_stmt = $conn->prepare($check_sql);
    if ($check_stmt === false) {
        error_log("MySQL prepare error: " . $conn->error);
        echo json_encode(['status' => 'error', 'message' => 'Database error while checking duplicates.']);
        http_response_code(500);  // Internal Server Error
        exit;
    }
    $check_stmt->bind_param("ssi", $email, $username, $user_id);
    $check_stmt->execute();
    $check_stmt->store_result();

    if ($check_stmt->num_rows > 0) {
        echo json_encode(['status' => 'error', 'message' => 'Email or Username already exists. Please choose another.']);
        $check_stmt->close();
        http_response_code(409);  // Conflict
        exit;
    }
    $check_stmt->close();

    // Prepare SQL query to update the user details
    $update_sql = "UPDATE users SET first_name = ?, middle_initial = ?, last_name = ?, suffix = ?, username = ?, role = ?, contact_number = ?, email = ?, address = ?, zip_code = ?, updated_at = NOW() WHERE user_id = ?";
    $stmt = $conn->prepare($update_sql);
    if ($stmt === false) {
        error_log("MySQL prepare error: " . $conn->error);
        echo json_encode(['status' => 'error', 'message' => 'Database preparation error.']);
        http_response_code(500);  // Internal Server Error
        exit;
    }

    $stmt->bind_param("ssssssssssi", $first_name, $middle_initial, $last_name, $suffix, $username, $role, $contact_number, $email, $address, $zip_code, $user_id);

    if ($stmt->execute()) {
        echo json_encode(['status' => 'success', 'message' => 'Admin/Staff updated successfully!']);
        http_response_code(200);  // Success
    } else {
        error_log("Execute error: " . $stmt->error);
        echo json_encode(['status' => 'error', 'message' => 'Error updating the user.']);
        http_response_code(500);  // Internal Server Error
    }

    $stmt->close();
    $conn->close();

} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request.']);
    http_response_code(400);  // Bad Request
}
