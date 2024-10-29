<?php
session_start();

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php"); // Redirect to login if not logged in
    exit();
}

// Get the user_id and username from the session
$user_id = $_SESSION['user_id'];
$username = $_SESSION['username'];

include_once "../assets/config.php"; // Ensure correct path to your config file
?>

<div class="container p-5"> 
    <h4 class="text-center">Pick Food</h4>
    <div class="menu_nav text-center mb-3">
        <?php
        // Fetch categories from the database
        $categoryQuery = "SELECT category_id, category_name FROM product_categories";
        $categoryResult = $conn->query($categoryQuery);

        if ($categoryResult->num_rows > 0) {
            while ($category = $categoryResult->fetch_assoc()) {
                echo '<button class="menu-nav" onclick="filterProducts(' . $category['category_id'] . ', this)">' . htmlspecialchars($category['category_name']) . '</button>';
            }
        } else {
            echo "<p>No categories available</p>";
        }
        ?>
    </div>

    <h1 class="text-center">Delicious Starts Here!</h1>

    <!-- Food Selection Section -->
    <div class="food-selection-container text-center row" id="foodSelectionContainer">
        <?php
        // Fetch all products initially
        $query = "SELECT product_id, product_name, price, special_instructions, product_image, category_id FROM product_items";
        $result = $conn->query($query);

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                ?>
                <div class="food-box col-md-3 product-item" data-category="<?php echo $row['category_id']; ?>">
                    <button class="food-btn" data-toggle="modal" data-target="#productModal<?php echo $row['product_id']; ?>">
                        <img src="<?php echo htmlspecialchars($row['product_image']); ?>" alt="<?php echo htmlspecialchars($row['product_name']); ?>">
                    </button>
                </div>

                <!-- Modal for Product Details -->
                <div class="modal fade" id="productModal<?php echo $row['product_id']; ?>" tabindex="-1" role="dialog" aria-labelledby="productModalLabel<?php echo $row['product_id']; ?>" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="productModalLabel<?php echo $row['product_id']; ?>"><?php echo htmlspecialchars($row['product_name']); ?></h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body d-flex">
                                <!-- Left side: Product Image -->
                                <div class="col-md-6">
                                    <img src="<?php echo htmlspecialchars($row['product_image']); ?>" alt="<?php echo htmlspecialchars($row['product_name']); ?>" class="img-fluid rounded">
                                </div>
                                <!-- Right side: Product Details -->
                                <div class="col-md-6">
                                    <p><strong>Price per Item:</strong> &#x20B1; <span id="pricePerItem<?php echo $row['product_id']; ?>"><?php echo number_format($row['price'], 2); ?></span></p>
                                    <p><strong>Total Price:</strong> &#x20B1; <span id="totalPrice<?php echo $row['product_id']; ?>"><?php echo number_format($row['price'], 2); ?></span></p>
                                    <p><strong>Instructions:</strong> <?php echo htmlspecialchars($row['special_instructions']); ?></p>
                                    <div class="form-group">
                                        <label for="quantity<?php echo $row['product_id']; ?>">Quantity:</label>
                                        <input type="number" id="quantity<?php echo $row['product_id']; ?>" name="quantity" min="1" value="1" class="form-control" onchange="updateTotalPrice(<?php echo $row['product_id']; ?>)">
                                    </div>
                                    <button class="btn btn-primary" onclick="confirmOrder(<?php echo $row['product_id']; ?>)">Confirm Order</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <?php
            }
        } else {
            echo "<p class='text-center'>No food items available</p>";
        }
        ?>
    </div>

    <!-- Proceed Button Section -->
    <div class="proceed-container">
        <button class="btn btn-secondary proceed-button" onclick="order_list()">Proceed</button>
    </div>
</div>

<script>
    let selectedCategory = null;

    function updateTotalPrice(productId) {
        const quantity = document.getElementById(`quantity${productId}`).value;
        const pricePerItem = parseFloat(document.getElementById(`pricePerItem${productId}`).innerText);
        const totalPrice = pricePerItem * quantity;
        document.getElementById(`totalPrice${productId}`).innerText = totalPrice.toFixed(2);
    }

    function confirmOrder(productId) {
    const quantity = document.getElementById(`quantity${productId}`).value;
    const totalPrice = document.getElementById(`totalPrice${productId}`).innerText;

    // Send an AJAX request to save the order
    $.ajax({
        url: "/Usercontrol/saveOrder.php", // Path to the saveOrder.php file
        method: "POST",
        data: {
            product_id: productId,
            quantity: quantity,
            price: parseFloat(totalPrice), // Ensure the price is a number
            user_id: <?php echo json_encode($user_id); ?> // Send the user ID
        },
        success: function(response) {
            const data = JSON.parse(response); // Parse the JSON response
            alert(data.message); // Show success message

            // Close the modal after successful order
            $('#yourModalId').modal('hide'); // Replace 'yourModalId' with the actual ID of your modal
        },
        error: function() {
            alert("There was an error processing your order.");
        }
    });
}


    function filterProducts(categoryId, button) {
        const products = document.querySelectorAll('.product-item');
        const isActive = button.classList.contains('active');

        // Toggle the active state of the button
        if (isActive) {
            button.classList.remove('active');
            selectedCategory = null; // Show all products
        } else {
            // Deselect other buttons
            const buttons = document.querySelectorAll('.menu-nav');
            buttons.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');
            selectedCategory = categoryId; // Set selected category
        }

        // Show or hide products based on selected category
        products.forEach(product => {
            if (selectedCategory === null || product.getAttribute('data-category') == selectedCategory) {
                product.style.display = 'block';
            } else {
                product.style.display = 'none';
            }
        });
    }
</script>
