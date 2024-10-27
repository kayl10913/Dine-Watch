<?php
include 'config.php';

// Initialize variables
$totalSales = 0;
$totalOrders = 0;
$totalSold = 0;
$totalCustomers = 0;

// Fetch total sales (only for completed orders by General Users)
$result = $conn->query("
    SELECT SUM(total_amount) AS totalSales 
    FROM orders 
    JOIN users u ON orders.user_id = u.user_id 
    WHERE status = 'Completed' AND u.role = 'General User'
");
if ($result) {
    $row = $result->fetch_assoc();
    $totalSales = $row['totalSales'] ?? 0; // Handle null
} else {
    error_log("Error fetching total sales: " . $conn->error);
}

// Fetch total orders (only for General Users)
$result = $conn->query("
    SELECT COUNT(*) AS totalOrders 
    FROM orders 
    JOIN users u ON orders.user_id = u.user_id 
    WHERE u.role = 'General User'
");
if ($result) {
    $row = $result->fetch_assoc();
    $totalOrders = $row['totalOrders'] ?? 0;
} else {
    error_log("Error fetching total orders: " . $conn->error);
}

// Fetch total items sold (for General Users)
$result = $conn->query("
    SELECT SUM(order_items.quantity) AS totalSold 
    FROM order_items 
    JOIN orders ON order_items.order_id = orders.order_id 
    JOIN users u ON orders.user_id = u.user_id 
    WHERE u.role = 'General User'
");
if ($result) {
    $row = $result->fetch_assoc();
    $totalSold = $row['totalSold'] ?? 0;
} else {
    error_log("Error fetching total sold: " . $conn->error);
}

// Fetch total customers (All General Users)
$result = $conn->query("
    SELECT COUNT(*) AS totalCustomers 
    FROM users 
    WHERE role = 'General User'
");
if ($result) {
    $row = $result->fetch_assoc();
    $totalCustomers = $row['totalCustomers'] ?? 0;
} else {
    error_log("Error fetching total customers: " . $conn->error);
}

$conn->close();

// Return data as JSON
echo json_encode([
    'totalSales' => $totalSales,
    'totalOrders' => $totalOrders,
    'totalSold' => $totalSold,
    'totalCustomers' => $totalCustomers
]);
?>
