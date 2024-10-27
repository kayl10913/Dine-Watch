<div>
  <h2>All Customers</h2>

  <!-- Search and Filter Form -->
  <form method="GET" action="" class="mb-3">
    <div class="input-group">
      <input type="text" name="search" class="form-control" placeholder="Search by username, email, or contact number" value="<?= isset($_GET['search']) ? htmlspecialchars($_GET['search']) : '' ?>">
      <div class="input-group-append">
        <button class="btn btn-primary" type="submit">Search</button>
        <a href="?" class="btn btn-secondary">Clear</a> <!-- Reset search -->
      </div>
    </div>
  </form>

  <table class="table">
    <thead>
      <tr>
        <th class="text-center">S.N.</th>
        <th class="text-center">Username</th>
        <th class="text-center">Email</th>
        <th class="text-center">Contact Number</th>
        <th class="text-center">Joining Date</th> <!-- Change this to match created_at -->
      </tr>
    </thead>
    <tbody>
      <?php
        include_once "../assets/config.php";

        // Pagination logic
        $limit = 10; // Number of records per page
        if (isset($_GET['page'])) {
          $page = $_GET['page'];
        } else {
          $page = 1;
        }
        $offset = ($page - 1) * $limit;

        // Search logic
        $search = isset($_GET['search']) ? $conn->real_escape_string($_GET['search']) : '';

        // Modify SQL query to include search filter and check if user is not an admin
        $sql = "SELECT * FROM users WHERE role='General User'";

        if (!empty($search)) {
          $sql .= " AND (first_name LIKE '%$search%' OR last_name LIKE '%$search%' OR email LIKE '%$search%' OR contact_number LIKE '%$search%')";
        }

        // Count total users for pagination
        $total_sql = "SELECT COUNT(*) FROM users WHERE role='General User'";
        if (!empty($search)) {
          $total_sql .= " AND (first_name LIKE '%$search%' OR last_name LIKE '%$search%' OR email LIKE '%$search%' OR contact_number LIKE '%$search%')";
        }

        $total_result = $conn->query($total_sql);
        $total_users = $total_result->fetch_array()[0];
        $total_pages = ceil($total_users / $limit);

        // Append LIMIT and OFFSET for pagination
        $sql .= " LIMIT $limit OFFSET $offset";
        $result = $conn->query($sql);
        $count = $offset + 1;

        if ($result->num_rows > 0) {
          while ($row = $result->fetch_assoc()) {
      ?>
      <tr>
        <td class="text-center"><?= $count ?></td>
        <td class="text-center"><?= $row["first_name"] ?> <?= $row["last_name"] ?></td>
        <td class="text-center"><?= $row["email"] ?></td>
        <td class="text-center"><?= $row["contact_number"] ?></td>
        <td class="text-center"><?= $row["created_at"] ?></td> <!-- Use created_at instead of registered_at -->
      </tr>
      <?php
            $count++;
          }
        } else {
          echo "<tr><td colspan='5' class='text-center'>No results found</td></tr>";
        }
      ?>
    </tbody>
  </table>

  <!-- Pagination controls -->
  <nav aria-label="Page navigation">
    <ul class="pagination justify-content-center">
      <?php if ($page > 1) { ?>
        <li class="page-item">
          <a class="page-link" href="?search=<?= $search ?>&page=<?= $page - 1 ?>" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>
      <?php } ?>

      <?php for ($i = 1; $i <= $total_pages; $i++) { ?>
        <li class="page-item <?= $i == $page ? 'active' : '' ?>">
          <a class="page-link" href="?search=<?= $search ?>&page=<?= $i ?>"><?= $i ?></a>
        </li>
      <?php } ?>

      <?php if ($page < $total_pages) { ?>
        <li class="page-item">
          <a class="page-link" href="?search=<?= $search ?>&page=<?= $page + 1 ?>" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      <?php } ?>
    </ul>
  </nav>
</div>
