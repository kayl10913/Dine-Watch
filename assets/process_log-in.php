<?php
// Start the session
session_start();

// Include the database connection configuration
include 'assets/config.php';

// Initialize message and error variables
$message = '';
$error = '';

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Sanitize and capture form inputs
    $email = trim(htmlspecialchars($_POST['email']));
    $password = trim(htmlspecialchars($_POST['password']));

    // Basic validation
    if (!empty($email) && !empty($password)) {
        // Prepare the SQL statement for General Users only
        $sql = "SELECT password_hash, role, username, user_id FROM users WHERE email = ? AND role = 'General User'";
        $stmt = $conn->prepare($sql);

        // Check for errors in preparing the statement
        if (!$stmt) {
            die("Database query error: " . $conn->error);
        }

        $stmt->bind_param('s', $email);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            // User found, now check the password
            $row = $result->fetch_assoc();
            $hashedPassword = $row['password_hash'];
            $role = $row['role'];
            $username = $row['username'];
            $user_id = $row['user_id']; // Capture user_id

            // Verify the entered password against the hashed password
            if (password_verify($password, $hashedPassword)) {
                // Store user info in session
                $_SESSION['email'] = $email;
                $_SESSION['role'] = $role;
                $_SESSION['username'] = $username; // Store username for welcome message
                $_SESSION['user_id'] = $user_id; // Store user_id

                // Log the login activity
                $action_type = "Login";
                $action_details = "$username logged in";
                $log_sql = "INSERT INTO activity_logs (action_by, action_type, action_details) VALUES (?, ?, ?)";
                $log_stmt = $conn->prepare($log_sql);
                $log_stmt->bind_param('iss', $user_id, $action_type, $action_details);
                $log_stmt->execute();
                $log_stmt->close(); // Close the statement

                // Redirect to General User dashboard
                header('Location: user_dashboard.php');
                exit();
            } else {
                $error = "Invalid password. Please try again.";
            }
        } else {
            $error = "No user found with this email.";
        }
        $stmt->close(); // Close the prepared statement
    } else {
        $error = "Please fill in all the required fields.";
    }
}

// Close the database connection
$conn->close();
?>
