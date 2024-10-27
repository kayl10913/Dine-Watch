<?php
include_once "../assets/config.php";

// Initialize a message variable
$message = "";

// Handle form submission to change reservation status
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['reservation_id']) && isset($_POST['status'])) {
    $reservationId = intval($_POST['reservation_id']); // Convert to integer
    $status = $_POST['status']; // Get the new status

    // Update the reservation status in the database
    $updateSql = "UPDATE reservations SET status = ? WHERE reservation_id = ?";
    $stmt = $conn->prepare($updateSql);
    $stmt->bind_param("si", $status, $reservationId);

    if ($stmt->execute()) {
        $message = "Reservation status updated successfully."; // Success message
    } else {
        $message = "Error updating reservation status: " . htmlspecialchars($stmt->error); // Error message
    }

    $stmt->close();
    
    // Redirect back to the same page to see the updated data
    header("Location: " . $_SERVER['PHP_SELF'] . "?message=" . urlencode($message));
    exit; // Prevent further script execution
}

// Fetch reservations for display
$sql = "
    SELECT r.*, t.table_number, t.seating_capacity, 
           CONCAT(u.first_name, ' ', u.last_name) AS reserved_by
    FROM reservations r
    LEFT JOIN tables t ON r.table_id = t.table_id
    LEFT JOIN users u ON r.user_id = u.user_id";

$result = $conn->query($sql);
$count = 1;

// Get the message from the URL if it exists
if (isset($_GET['message'])) {
    $message = htmlspecialchars($_GET['message']); // Display message if available
}
?>

<div>
  <h3>Reservations</h3>
  <?php if (!empty($message)) { ?>
    <div class="alert alert-info"><?= $message ?></div> <!-- Show message -->
  <?php } ?>
  <table class="table table-striped">
    <thead>
      <tr>
        <th class="text-center">S.N.</th>
        <th class="text-center">Reserved By</th>
        <th class="text-center">Reservation Date</th>
        <th class="text-center">Reservation Time</th>
        <th class="text-center">Table Number</th>
        <th class="text-center">Seating Capacity</th>
        <th class="text-center">Status</th>
        <th class="text-center">Actions</th>
      </tr>
    </thead>
    <tbody>
      <?php
        if ($result && $result->num_rows > 0) {
          while ($row = $result->fetch_assoc()) {
      ?>
      <tr>
        <td class="text-center"><?= $count ?></td>
        <td class="text-center"><?= htmlspecialchars($row["reserved_by"]) ?></td>
        <td class="text-center"><?= htmlspecialchars($row["reservation_date"]) ?></td>
        <td class="text-center"><?= htmlspecialchars($row["reservation_time"]) ?></td>
        <td class="text-center"><?= htmlspecialchars($row["table_number"]) ?></td>
        <td class="text-center"><?= htmlspecialchars($row["seating_capacity"]) ?></td>
        <td class="text-center">
          <span class="badge <?= $row["status"] == 'Pending' ? 'badge-warning' : ($row["status"] == 'Confirmed' ? 'badge-success' : ($row["status"] == 'Canceled' ? 'badge-danger' : 'badge-info')) ?>">
            <?= htmlspecialchars($row["status"]) ?>
          </span>
        </td>
        <td class="text-center">
          <form action="<?= $_SERVER['PHP_SELF'] ?>" method="POST">
            <input type="hidden" name="reservation_id" value="<?= htmlspecialchars($row['reservation_id']) ?>">
            <select name="status" class="form-control">
              <option value="Pending" <?= $row['status'] == 'Pending' ? 'selected' : '' ?>>Pending</option>
              <option value="Confirmed" <?= $row['status'] == 'Confirmed' ? 'selected' : '' ?>>Confirmed</option>
              <option value="Canceled" <?= $row['status'] == 'Canceled' ? 'selected' : '' ?>>Canceled</option>
              <option value="Rescheduled" <?= $row['status'] == 'Rescheduled' ? 'selected' : '' ?>>Rescheduled</option>
            </select>
            <button type="submit" class="btn btn-primary mt-2">Update</button>
          </form>
        </td>
      </tr>
      <?php
            $count++;
          }
        } else {
          echo "<tr><td colspan='8' class='text-center'>No reservations found.</td></tr>";
        }
      ?>
    </tbody>
  </table>
</div>

<?php
$conn->close();
?>
