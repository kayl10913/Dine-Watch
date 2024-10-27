<?php
include_once "../assets/config.php";

// Initialize a message variable
$message = "";

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

<div class="container mt-5">
  <h3>Reservations</h3>
  <?php if (!empty($message)) { ?>
    <div class="alert alert-info"><?= $message ?></div> <!-- Show message -->
  <?php } ?>
  <table class="table table-bordered table-hover">
    <thead class="thead">
      <tr>
        <th class="text-center">S.N.</th>
        <th class="text-center">Reserved By</th>
        <th class="text-center">Reservation Date</th>
        <th class="text-center">Reservation Time</th>
        <th class="text-center">Duration</th>
        <th class="text-center">Table Number</th>
        <th class="text-center">Seating Capacity</th>
        <th class="text-center">Status</th>
      </tr>
    </thead>
    <tbody>
      <?php
        if ($result && $result->num_rows > 0) {
          while ($row = $result->fetch_assoc()) {
              // Calculate duration in hours, assuming a fixed duration (e.g., 2 hours)
              $duration = "2 hours"; // Replace this with actual duration calculation if available
      ?>
      <tr>
        <td class="text-center"><?= $count ?></td>
        <td class="text-center"><?= htmlspecialchars($row["reserved_by"]) ?></td>
        <td class="text-center"><?= htmlspecialchars($row["reservation_date"]) ?></td>
        <td class="text-center"><?= htmlspecialchars($row["reservation_time"]) ?></td>
        <td class="text-center"><?= $duration ?></td>
        <td class="text-center"><?= htmlspecialchars($row["table_number"]) ?></td>
        <td class="text-center"><?= htmlspecialchars($row["seating_capacity"]) ?></td>
        <td class="text-center">
          <span class="badge <?= $row["status"] == 'Pending' ? 'badge-warning' : ($row["status"] == 'Confirmed' ? 'badge-success' : ($row["status"] == 'Canceled' ? 'badge-danger' : 'badge-info')) ?>">
            <?= htmlspecialchars($row["status"]) ?>
          </span>
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
