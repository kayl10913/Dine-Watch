<?php
session_start();
include_once "../assets/config.php";

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['record'])) {
    $userId = $_SESSION['user_id'];

    // Fetch all categories in descending order
    $categoriesQuery = "
        SELECT * FROM product_categories
        ORDER BY category_name DESC"; // Descending order
    $categoriesResult = $conn->query($categoriesQuery);

    if ($categoriesResult->num_rows > 0) {
        echo '<div class="container order">'; // Main container

        // Fetch all orders for the user in descending order
        $ordersQuery = "
            SELECT oi.*, pi.product_name, pi.product_image, pi.price, pc.category_name
            FROM order_items oi
            JOIN product_items pi ON oi.product_id = pi.product_id
            JOIN product_categories pc ON pi.category_id = pc.category_id
            WHERE oi.user_id = ?
            ORDER BY pc.category_name DESC, oi.order_item_id"; // Descending order for categories and order items

        $stmt = $conn->prepare($ordersQuery);
        $stmt->bind_param("i", $userId);
        $stmt->execute();
        $ordersResult = $stmt->get_result();
        
        // Prepare an associative array to hold orders by category
        $ordersByCategory = [];
        while ($order = $ordersResult->fetch_assoc()) {
            $ordersByCategory[$order['category_name']][] = $order;
        }
        $stmt->close();

        // Loop through each category
        while ($category = $categoriesResult->fetch_assoc()) {
            $categoryName = htmlspecialchars($category['category_name']);
            echo "<h3 class='category-separator mt-4'>$categoryName</h3>";
            echo '<div class="row">'; // Start new category group
            
            // Check if there are orders for this category
            if (isset($ordersByCategory[$categoryName])) {
                foreach ($ordersByCategory[$categoryName] as $order) {
                    // Order item as a card
                    echo '<div class="col-md-4 mb-4">';
                    echo '<div class="card h-100">';
                    echo '<img src="' . htmlspecialchars($order['product_image']) . '" alt="' . htmlspecialchars($order['product_name']) . '" class="card-img-top" style="height: 150px; object-fit: cover;">';
                    echo '<div class="card-body">';
                    echo '<h5 class="card-title">' . htmlspecialchars($order['product_name']) . '</h5>';
                    echo '<p class="card-text">Quantity: <span id="quantity-' . $order['order_item_id'] . '">' . $order['quantity'] . '</span></p>';
                    echo '<p class="card-text">Total Price: &#x20B1; <span id="total-price-' . $order['order_item_id'] . '">' . number_format($order['price'] * $order['quantity'], 2) . '</span></p>'; // Total price calculated here
                    echo '</div>';

                    // Card footer with edit and delete buttons
                    echo '<div class="card-footer text-center">';
                    echo '<button class="btn btn-primary mr-2" onclick="openEditModal(' . $order['order_item_id'] . ', ' . $order['quantity'] . ', ' . $order['price'] . ')">Edit</button>'; // Pass unit price
                    echo '<button class="btn btn-danger" onclick="deleteOrder(' . $order['order_item_id'] . ')">Delete</button>';
                    echo '</div>';

                    echo '</div>'; // Close card
                    echo '</div>'; // Close column
                }
            }

            // Add Plus button card immediately after the last item in the category
            echo '<div class="col-md-4 mb-4">'; // Ensure the same column structure
            echo '<div class="card h-100" style="background-color: #f0f0f0;">'; // Grey background
            echo '<div class="d-flex flex-column justify-content-center align-items-center" style="height: 100%;">';
            echo '<button class="btn btn-plus" onclick="ordertable()" style="width: 100%; height: 100%; font-size: 2rem;"><i class="fa fa-plus" aria-hidden="true"></i></button>'; // Plus button
            echo '<h5 class="card-title mt-2">Add Foods</h5>'; // Optional title for context
            echo '</div>';
            echo '</div>';
            echo '</div>';  // Close Plus button card column

            echo '</div>'; // Close category group
        }

        echo '</div>'; // Close main container

        // Proceed and Back buttons
        echo '<div class="d-flex justify-content-end mt-4">'; // Flex container for right alignment
        echo '<button class="btn proceed-button" onclick="ordertable()">Back</button>';
        echo '<form action="next_page.php" method="post" class="mr-2">'; // Add margin right for spacing
        echo '<button type="submit" class="btn proceed-button">Proceed</button>';
        echo '</form>';
        echo '</div>';

    } else {
        echo "No categories found.";
    }

    $categoriesResult->close();
}
?>

<!-- Edit Quantity Modal -->
<div class="modal fade" id="editQuantityModal" tabindex="-1" role="dialog" aria-labelledby="editQuantityModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editQuantityModalLabel">Edit Quantity</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editQuantityForm">
                    <input type="hidden" id="orderItemId" name="order_item_id">
                    <div class="form-group">
                        <label for="quantity">Quantity</label>
                        <input type="number" class="form-control" id="quantity" name="quantity" min="1" required oninput="updateTotalPrice()">
                    </div>
                    <div class="form-group">
                        <label for="totalPrice">Total Price</label>
                        <input type="text" class="form-control" id="totalPrice" name="total_price" readonly>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="updateQuantity()">Update Quantity</button>
            </div>
        </div>
    </div>
</div>


<script>
function openEditModal(orderItemId, currentQuantity, unitPrice) {
    $('#orderItemId').val(orderItemId);
    $('#quantity').val(currentQuantity);
    $('#totalPrice').val((currentQuantity * unitPrice).toFixed(2)); // Set initial total price based on unit price
    $('#totalPrice').data('unitPrice', unitPrice); // Store unit price in data attribute
    $('#editQuantityModal').modal('show');
}

function updateTotalPrice() {
    const quantity = parseFloat($('#quantity').val()) || 0; // Get current quantity in modal
    const unitPrice = parseFloat($('#totalPrice').data('unitPrice')) || 0; // Retrieve unit price
    $('#totalPrice').val((quantity * unitPrice).toFixed(2)); // Update total price in modal
}

function updateQuantity() {
    const orderItemId = $('#orderItemId').val();
    const newQuantity = parseFloat($('#quantity').val());

    // Get the unit price from the modal
    const unitPrice = parseFloat($('#totalPrice').data('unitPrice')) || 0; // Fetch unit price
    const newTotalPrice = unitPrice * newQuantity; // Calculate new total price

    // AJAX request to update the quantity in the database
    $.ajax({
        url: '/Usercontrol/updatequantity.php', // Update endpoint
        type: 'POST',
        data: {
            order_item_id: orderItemId,
            quantity: newQuantity,
            total_price: newTotalPrice
        },
        success: function(response) {
            const result = JSON.parse(response);
            if (result.status === 'success') {
                alert(result.message);

                // Update the displayed quantity and price on the card
                $('#quantity-' + orderItemId).text(newQuantity);  // Update quantity on the card
                $('#total-price-' + orderItemId).text(newTotalPrice.toFixed(2)); // Update total price on the card

                // Also update the total price displayed in the modal (if needed)
                $('#totalPrice').val(newTotalPrice.toFixed(2));

                $('#editQuantityModal').modal('hide'); // Close the modal
            } else {
                alert(result.message);
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert('An error occurred: ' + textStatus + ' - ' + errorThrown);
        }
    });
}

</script>


<style>
.category-separator {
    border-bottom: 2px solid #ddd;
    padding-bottom: 10px;
    margin-bottom: 10px;
    font-size: 1.25rem;
    color: #333;
}
.card {
    transition: transform 0.3s;
}
.card:hover {
    transform: scale(1.05);
}
</style>
