<?php

include_once "assets/config.php"; // Database connection
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/panel.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> <!-- Include Chart.js -->
    <script src="Js/sales_chart.js"></script> <!-- Include your custom chart JS file -->
</head>
<body>
    <?php
        include "Header_nav/adminHeader.php"; // Header for admin panel
        include "Header_nav/sidebar.php"; // Sidebar for navigation
    ?>

    <div id="main-content" class="container allContent-section py-4">
        <div class="row">
            <!-- Total Sales -->
            <div class="col-sm-3">
                <div class="card text-center bg-success text-white">
                    <i class="fa fa-dollar mb-2" style="font-size: 70px;"></i>
                    <h4>Total Sales</h4>
                    <h5 id="totalSales">
                    <?php
                        // Calculate total sales
                        $sql = "SELECT SUM(total_amount) as total_sales FROM orders";
                        $result = $conn->query($sql);
                        $row = $result->fetch_assoc();
                        echo number_format($row['total_sales'] ?? 0, 2); // Default to 0 if null
                    ?>
                    </h5>
                </div>
            </div>

            <!-- Total Orders -->
            <div class="col-sm-3">
                <div class="card text-center bg-warning text-white">
                    <i class="fa fa-list mb-2" style="font-size: 70px;"></i>
                    <h4>Total Orders</h4>
                    <h5 id="totalOrders">
                    <?php
                        $sql = "SELECT COUNT(*) as order_count FROM orders"; // Update SQL query to count orders
                        $result = $conn->query($sql);
                        $row = $result->fetch_assoc();
                        echo $row['order_count'] ?? 0; // Default to 0 if null
                    ?>
                    </h5>
                </div>
            </div>

            <!-- Total Sold -->
            <div class="col-sm-3">
                <div class="card text-center bg-info text-white">
                    <i class="fa fa-dollar mb-2" style="font-size: 70px;"></i>
                    <h4>Total Sold</h4>
                    <h5 id="totalSold">
                    <?php
                        // Get the total sold amount from order_items using quantity * price
                        $sql = "SELECT SUM(quantity * price) AS total_sold FROM order_items";  // Fetch from order_items
                        $result = $conn->query($sql);
                        $row = $result->fetch_assoc();
                        $total_sold = $row['total_sold'] ?? 0; // Default to 0 if null
                        echo "$" . number_format($total_sold, 2); // Format as currency
                    ?>
                    </h5>
                </div>
            </div>

           <!-- Total Customers -->
<div class="col-sm-3">
    <div class="card text-center bg-primary text-white">
        <i class="fa fa-users mb-2" style="font-size: 70px;"></i>
        <h4>Total Customers</h4>
        <h5 id="totalCustomers">0</h5> <!-- Dynamically updated -->
    </div>
</div>

        </div>

        <!-- Graph Section with Two Columns -->
        <div class="row mt-5">
            <div class="col-sm-6">
                <div class="graph1">
                    <h5>Sales Overview</h5>
                    <canvas id="salesChart" width="400" height="200"></canvas>
                </div>

                <div class="graph2 mt-4">
                    <h5>Orders Overview</h5>
                    <canvas id="ordersChart" width="400" height="200"></canvas>
                </div>
            </div>

            <div class="col-sm-6">
                <div class="graph3">
                    <h5>Total Sold</h5>
                    <canvas id="soldChart" width="400" height="200"></canvas>
                </div>

                <div class="graph4 mt-4">
                    <h5>Customer Overview</h5>
                    <canvas id="customersChart" width="400" height="200"></canvas>
                </div>
            </div>
        </div>
    </div>

    <!-- Notification Handling -->
    <?php
        // Notification messages
        foreach (['category', 'size', 'variation'] as $type) {
            if (isset($_GET[$type])) {
                $message = $_GET[$type] == "success" ? ucfirst($type) . " Successfully Added" : "Adding Unsuccessful";
                echo '<script> alert("' . $message . '");</script>';
            }
        }
    ?>
    
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
    <script src="Js/panel.js"></script>
    <script src="Js/navb.js"></script>



</body>
</html>

<script>
    // Fetch data and dynamically update the stats
fetch('assets/fetch_data.php')
    .then(response => {
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        return response.json();
    })
    .then(data => {
        const totalCustomers = data.totalCustomers ?? 0; // Default to 0 if null

        // Update the Total Customers dynamically
        document.getElementById('totalCustomers').innerText = totalCustomers;
    })
    .catch(error => console.error('Error fetching customer data:', error));

</script>