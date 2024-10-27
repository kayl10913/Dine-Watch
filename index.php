<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Dine&Watch</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/Style.css'>
</head>
<body>
<?php if (isset($_GET['signup']) && $_GET['signup'] === 'success'): ?>
    <script>
        // Display the alert message
        alert("Your account has been created successfully! You can now log in.");
    </script>
<?php endif; ?>

    <div class="page">

        <div class="head">
            <div class="home">
                <a href="landing_page.php"><img src="Images/home.png" alt="Go back"></a>
            </div>
        </div>
        
        <div class="section">
            <div class="logo">
                <h1>Dine&Watch</h1> <!-- Main logo or heading -->
            </div>

            <!-- Buttons for Sign-Up and Log-In -->
            <div class="btn">
            

                <a href="sign-up.php"><button class="btn-regester">Sign-Up</button></a>
                <a href="sign-in.php"><button class="btn-log-in">Log-In</button></a>
            </div>
        </div>

        <footer class="footer">
            <!-- Footer content -->
        </footer>
        
    </div>

</body>
</html>
