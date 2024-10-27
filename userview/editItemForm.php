<div class="container p-5">
    <h4>Edit Product Item Detail</h4>
    <?php
    include_once "../assets/config.php"; // Ensure correct path to config file
    $ID = $_POST['record']; // Get the product item ID from the POST request
    $qry = mysqli_query($conn, "SELECT * FROM product_items WHERE product_id='$ID'");
    $numberOfRow = mysqli_num_rows($qry);

    if ($numberOfRow > 0) {
        $row1 = mysqli_fetch_array($qry); // Fetch only one row since ID is unique
        $product_image_path = $row1['product_image'];
    ?>
    <form id="update-Items" onsubmit="updateItems(event)" enctype="multipart/form-data"> <!-- Changed to handle updates -->
        <input type="hidden" class="form-control" name="product_id" id="product_id" value="<?= $row1['product_id'] ?>">

        <div class="form-group">
            <label for="product_name">Product Name:</label>
            <input type="text" class="form-control" name="product_name" id="product_name" value="<?= $row1['product_name'] ?>" required>
        </div>

        <div class="form-group">
            <label for="category">Category:</label>
            <select id="category" name="category" class="form-control" required>
                <option value="Drink" <?= $row1['category'] == 'Drink' ? 'selected' : '' ?>>Drink</option>
                <option value="Meal" <?= $row1['category'] == 'Meal' ? 'selected' : '' ?>>Meal</option>
                <option value="Dessert" <?= $row1['category'] == 'Dessert' ? 'selected' : '' ?>>Dessert</option>
                <option value="Add-on" <?= $row1['category'] == 'Add-on' ? 'selected' : '' ?>>Add-on</option>
            </select>
        </div>

        <div class="form-group">
            <label for="quantity">Quantity:</label>
            <input type="number" class="form-control" name="quantity" id="quantity" value="<?= $row1['quantity'] ?>" required>
        </div>

        <div class="form-group">
            <label for="price">Unit Price:</label>
            <input type="number" class="form-control" name="price" id="price" value="<?= $row1['price'] ?>" step="0.01" required>
        </div>

        <div class="form-group">
            <label for="special_instructions">Special Instructions:</label>
            <textarea class="form-control" name="special_instructions" id="special_instructions"><?= $row1['special_instructions'] ?></textarea>
        </div>

        <div class="form-group">
            <label for="product_image">Product Image:</label>
            <!-- Display current image if it exists -->
            <?php if (!empty($row1['product_image'])): ?>
                <p>Current Image:</p>
                <img src="<?= htmlspecialchars($row1['product_image']) ?>" alt="Product Image" style="max-width: 150px; height: auto;" />
            <?php endif; ?>
            <!-- Allow new image upload -->
            <input type="file" class="form-control-file" id="item_image" name="item_image" accept="image/*">
            <small class="form-text text-muted">Leave empty if you don't want to change the image.</small>
        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-primary">Update Item</button>
        </div>
    </form>

    <?php
    } else {
        echo "<p>No item found with the provided ID.</p>";
    }
    ?>
</div>
