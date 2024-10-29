<?php
session_start();
include_once "../assets/config.php";

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['order_item_id'])) {
    $userId = $_SESSION['user_id'];
    $orderItemId = intval($_POST['order_item_id']); // Sanitize input

    // Prepare the delete query
    $deleteQuery = "DELETE FROM order_items WHERE order_item_id = ? AND user_id = ?";
    $stmt = $conn->prepare($deleteQuery);
    $stmt->bind_param("ii", $orderItemId, $userId);

    if ($stmt->execute()) {
        // Successful deletion
        echo json_encode(["status" => "success", "message" => "Item deleted successfully."]);
    } else {
        // Error occurred
        echo json_encode(["status" => "error", "message" => "Failed to delete item."]);
    }

    $stmt->close();
} else {
    echo json_encode(["status" => "error", "message" => "Invalid request."]);
}
?>
