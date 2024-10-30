<?php
session_start();
include_once "../assets/config.php"; // Ensure correct path to your config file

// Check if the required POST data is set
if (isset($_POST['product_id'], $_POST['quantity'], $_POST['price'], $_POST['user_id'])) {
    $product_id = $_POST['product_id'];
    $quantity = (int)$_POST['quantity'];
    $price = (float)$_POST['price'];
    $user_id = $_POST['user_id'];

    // Assuming you have an `orders` table and can retrieve or create an `order_id`
    $order_id = 1; // Replace with your logic to fetch/create order ID

    // Check if the product already exists for the user in the order_items table
    $checkQuery = "SELECT order_item_id, quantity, totalprice FROM order_items WHERE order_id = ? AND user_id = ? AND product_id = ?";
    $checkStmt = $conn->prepare($checkQuery);
    $checkStmt->bind_param("iii", $order_id, $user_id, $product_id);
    $checkStmt->execute();
    $checkResult = $checkStmt->get_result();

    if ($checkResult->num_rows > 0) {
        // If the product exists, update the quantity and total price
        $existingOrder = $checkResult->fetch_assoc();
        $existingQuantity = (int)$existingOrder['quantity'];
        $existingTotalPrice = (float)$existingOrder['totalprice'];

        // Update the quantity and calculate the new total price based on the combined quantity
        $newQuantity = $existingQuantity + $quantity;
        $pricePerItem = $existingTotalPrice / $existingQuantity; // Calculate the original price per item
        $newTotalPrice = $pricePerItem * $newQuantity;

        $updateQuery = "UPDATE order_items SET quantity = ?, totalprice = ? WHERE order_item_id = ?";
        $updateStmt = $conn->prepare($updateQuery);
        $updateStmt->bind_param("idi", $newQuantity, $newTotalPrice, $existingOrder['order_item_id']);

        if ($updateStmt->execute()) {
            echo json_encode(["message" => "Order updated successfully!"]);
        } else {
            echo json_encode(["message" => "Error: Could not update the order."]);
        }
        $updateStmt->close();
    } else {
        // If the product does not exist, insert a new record
        $insertStmt = $conn->prepare("INSERT INTO order_items (order_id, user_id, product_id, quantity, totalprice) VALUES (?, ?, ?, ?, ?)");
        if ($insertStmt) {
            $insertStmt->bind_param("iiidi", $order_id, $user_id, $product_id, $quantity, $price);

            if ($insertStmt->execute()) {
                echo json_encode(["message" => "Order confirmed successfully!"]);
            } else {
                echo json_encode(["message" => "Error: Could not confirm the order."]);
            }
            $insertStmt->close();
        } else {
            echo json_encode(["message" => "Error preparing insert statement."]);
        }
    }
    $checkStmt->close();
} else {
    echo json_encode(["message" => "Error: Invalid data."]);
}

$conn->close();
?>
