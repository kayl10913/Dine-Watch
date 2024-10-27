<?php
include_once "../assets/config.php";

// Query to fetch all users with the role 'General User'
$sql = "SELECT * FROM users WHERE role = 'General User'";

$result = $conn->query($sql);

// Check if the query returns results and output the data
if ($result->num_rows > 0) {
    $count = 1;
    while ($row = $result->fetch_assoc()) {
        echo "<tr>
                <td class='text-center'>{$count}</td>
                <td class='text-center'>" . htmlspecialchars($row['first_name']) . " " . htmlspecialchars($row['last_name']) . "</td>
                <td class='text-center'>" . htmlspecialchars($row['email']) . "</td>
                <td class='text-center'>" . htmlspecialchars($row['contact_number']) . "</td>
                <td class='text-center'>" . htmlspecialchars($row['created_at']) . "</td>
              </tr>";
        $count++;
    }
} else {
    echo '<tr><td colspan="5" class="text-center">No users found.</td></tr>';
}
?>
