<div>
  <h2>Product Items</h2>

  <!-- Add Item Button at the Top -->
  <div class="d-flex justify-content-between mb-3">
    <!-- Item Type Filter -->
    <div>
      <label for="filter_item_type">Filter by Item Type: </label>
      <select id="filter_item_type" class="form-control" style="width: 200px; display: inline-block;" onchange="filterItems()">
        <option value="All">All</option>
        <option value="Drink">Drink</option>
        <option value="Meal">Meal</option>
        <option value="Dessert">Dessert</option>
        <option value="Add-on">Add-on</option>
      </select>
    </div>

    <!-- Add Item Button -->
    <button type="button" class="btn btn-secondary" style="height:40px" data-toggle="modal" data-target="#myModal">
      Add Item
    </button>
  </div>

  <!-- Product List Container -->
  <div class="product-list">
    <table class="table">
      <thead>
        <tr>
          <th class="text-center">S.N.</th>
          <th class="text-center">Image</th>
          <th class="text-center">Item Name</th>
          <th class="text-center">Item Type</th>
          <th class="text-center">Stock</th>
          <th class="text-center">Unit Price</th>
          <th class="text-center">Special Instructions</th>
        </tr>

      </thead>
      <tbody id="product_table_body">
        <?php
        include_once "../assets/config.php";

        // Fetch all product items initially
        $sql = "SELECT * FROM product_items";
        $result = $conn->query($sql);
        $count = 1;

        if ($result->num_rows > 0) {
          while ($row = $result->fetch_assoc()) {
        ?>
        <tr class="product-row" data-item-type="<?= htmlspecialchars($row["category"]) ?>">
          <td class="text-center"><?= $count ?></td>
          <td class="text-center">
            <?php if ($row["product_image"]): ?>
              <img src="<?= htmlspecialchars($row["product_image"]) ?>" alt="<?= htmlspecialchars($row["product_name"]) ?>" style="width: 50px; height: 50px;">
            <?php else: ?>
              No Image
            <?php endif; ?>
          </td>
          <td><?= htmlspecialchars($row["product_name"]) ?></td>
          <td><?= htmlspecialchars($row["category"]) ?></td>
          <td><?= htmlspecialchars($row["quantity"]) ?></td>
          <td><?= htmlspecialchars($row["price"]) ?></td>
          <td><?= htmlspecialchars($row["special_instructions"]) ?></td>
        </tr>
        <?php
            $count++;
          }
        } else {
          echo "<tr><td colspan='8' class='text-center'>No items found</td></tr>";
        }
        ?>
      </tbody>
    </table>
  </div>


</div>
