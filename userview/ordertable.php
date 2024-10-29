<div class="container p-5"> 
    <h4 class="text-center">Pick Food</h4>
    <div class="menu_nav text-center mb-3">
        <button class="menu-nav">Meal</button>
        <button class="menu-nav">Drink</button>
        <button class="menu-nav">Add-on</button>
        <button class="menu-nav">Food</button>
    </div>

    <h1 class="text-center">Delicious Starts Here!</h1>

    <!-- Food Selection Section -->
    <div class="food-selection-container text-center row">
        <?php
include_once "../assets/config.php"; // Ensure correct path to your config file

        $query = "SELECT product_id, product_name, price, special_instructions, product_image FROM product_items";
        $result = $conn->query($query);

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                ?>
                <div class="food-box col-md-3">
                    <button class="food-btn" data-toggle="modal" data-target="#productModal<?php echo $row['product_id']; ?>">
                        <img src="<?php echo $row['product_image']; ?>" alt="<?php echo $row['product_name']; ?>">
                    </button>
                </div>

                <!-- Modal for Product Details -->
                <div class="modal fade" id="productModal<?php echo $row['product_id']; ?>" tabindex="-1" role="dialog" aria-labelledby="productModalLabel<?php echo $row['product_id']; ?>" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="productModalLabel<?php echo $row['product_id']; ?>"><?php echo $row['product_name']; ?></h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body d-flex">
                                <!-- Left side: Product Image -->
                                <div class="col-md-6">
                                    <img src="<?php echo $row['product_image']; ?>" alt="<?php echo $row['product_name']; ?>" class="img-fluid rounded">
                                </div>
                                <!-- Right side: Product Details -->
                                <div class="col-md-6">
                                    <p><strong>Price per Item:</strong> &#x20B1; <span id="pricePerItem<?php echo $row['product_id']; ?>"><?php echo number_format($row['price'], 2); ?></span></p>
                                    <p><strong>Total Price:</strong> &#x20B1; <span id="totalPrice<?php echo $row['product_id']; ?>"><?php echo number_format($row['price'], 2); ?></span></p>
                                    <p><strong>Instructions:</strong> <?php echo $row['special_instructions']; ?></p>
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
</div>
<script>


function updateTotalPrice(productId) {
        const quantity = document.getElementById(`quantity${productId}`).value;
        const pricePerItem = parseFloat(document.getElementById(`pricePerItem${productId}`).innerText);
        const totalPrice = pricePerItem * quantity;
        document.getElementById(`totalPrice${productId}`).innerText = totalPrice.toFixed(2);
    }

    function confirmOrder(productId) {
        const quantity = document.getElementById(`quantity${productId}`).value;
        const totalPrice = document.getElementById(`totalPrice${productId}`).innerText;
        alert(`Order confirmed! Product ID: ${productId}, Quantity: ${quantity}, Total Price: $${totalPrice}`);
        // Additional functionality to save the order can be added here.
    }
</script>
