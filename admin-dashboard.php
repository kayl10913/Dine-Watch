<?php
session_start(); // Start the session
// Check if the user is logged in
if (!isset($_SESSION['username'])) {
    header("Location: login.php"); // Redirect to login page if not logged in
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Dine&Watch</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/dashboard.css'>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="Js/sales_chart.js"></script>
</head>
<body>

    <div class="page">
        <div class="head">
            <div class="prof">
                <img id="menu-icon" src="Images/menu.png" alt="Open Navigation" style="cursor:pointer;">
            </div>
            <div class="welc">Welcome, <?= htmlspecialchars($_SESSION['username']); ?></div>
        </div>

       

        <div class="section1">
        <div class="navbar" id="mySidenav">
        <nav>
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()"><img id="menu-icon" src="Images/back.png" alt="Open Navigation" style="cursor:pointer;"></a>
            <div class="avatar">
                <img id="profile-icon" src="Images/profile.png" alt="Profile" style="cursor:pointer;">
                <a href="assets/log-out.php"><h5>Log-out</h5></a>
            </div>
            <a href="#">Dashboard</a>
            <a href="#">Orders</a>
            <a href="#">Reservations</a>
            <a href="#">Stocks</a>
            <a href="#">Activity Log</a>
            </nav>
        </div>
       
        <div class="graph contaner">
            <div class="data">
                <h1>Total Sales</h1>
                <h2>Total Summary</h2>
                <div class="sales-row">
                    <div class="total-sales bg-primary text-white p-3">
                        Total Sales Content: <span id="totalSales"></span>
                    </div>
                    <div class="total-order bg-secondary text-white p-3">
                        Total Orders Content: <span id="totalOrders"></span>
                    </div>
                    <div class="total-sold bg-success text-white p-3">
                        Total Sold Content: <span id="totalSold"></span>
                    </div>
                    <div class="total-customers bg-danger text-white p-3">
                        Total Customers Content: <span id="totalCustomers"></span>
                    </div>
                </div>
            </div>

            <div class="graph_1">
                <div class="graph1">
                <canvas id="salesChart" width="400" height="200"></canvas>
                </div>

                <div class="graph2">
                <canvas id="ordersChart" width="400" height="200"></canvas>
                </div>

                <div class="graph3">
                <canvas id="soldChart" width="400" height="200"></canvas>
                </div>
                
                <div class="graph4">
                <canvas id="customersChart" width="400" height="200"></canvas>
                </div>
                
                
                
                
            </div>
        </div>
        </div>

        <footer class="footer">
            <!-- Add footer content here -->
        </footer>
    </div>

    <script src="Js/sales_chart.js"></script>
    <?php include 'assets/fetch_data.php'; ?>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>
