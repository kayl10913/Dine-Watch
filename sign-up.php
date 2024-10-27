<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Dine&Watch</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' href='css/Style.css'>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
    <link rel='stylesheet' href='css/sign-up.css'> <!-- New CSS for Sign-Up Page -->
</head>
<body>

    <div class="page">

        <div class="head">
            <div class="return">
                <a href="index.php"><img src="Images/back.png" alt="Go back"></a>
            </div>
        </div>
       
        <div class="S-section">
            <div class="form-container">
                <h1>Sign Up</h1>
                <?php 
                    // Include the form processing logic
                    include 'assets/process_signup.php'; 
                    
                    // Display any error messages
                    if (!empty($error)): 
                ?>
                    <p style="color:red;"><?= htmlspecialchars($error); ?></p>
                <?php endif; ?>

                <!-- Sign-Up Form -->
                <form class="form" action="" method="POST">
                    <input type="email" name="email" placeholder="Email" required value="<?= htmlspecialchars($email ?? ''); ?>">

                    <div class="password-container">
                        <input type="password" name="password" id="password" placeholder="Password" required>
                        
                        <!-- Boxicons for show/hide password -->
                        <span id="togglePassword" class="eye-icon">
                            <box-icon id="hideIcon" name="hide" type="solid" style="cursor: pointer;"></box-icon>
                            <box-icon id="showIcon" name="show" type="solid" style="cursor: pointer; display: none;"></box-icon>
                        </span>
                    </div>

                    <!-- First Name and Last Name Fields -->
                    <input type="text" name="firstName" placeholder="First Name" required value="<?= htmlspecialchars($firstName ?? ''); ?>">
                    
                    <!-- Middle Initial and Suffix grouped together -->
                    <div class="input-group">
                        <input type="text" name="middleInitial" placeholder="Middle Initial" value="<?= htmlspecialchars($middleInitial ?? ''); ?>">
                        <input type="text" name="suffix" placeholder="Suffix (Optional)" value="<?= htmlspecialchars($suffix ?? ''); ?>">
                    </div>
                    <input type="text" name="lastName" placeholder="Last Name" required value="<?= htmlspecialchars($lastName ?? ''); ?>">
                    <input type="text" name="address" placeholder="Address" required value="<?= htmlspecialchars($address ?? ''); ?>">
                    <input type="tel" name="phone" placeholder="Phone Number" required value="<?= htmlspecialchars($phone ?? ''); ?>">
                    <input type="text" name="zipCode" placeholder="Zip Code" required value="<?= htmlspecialchars($zipCode ?? ''); ?>">
                    
                    <button type="submit">Sign Up</button>
                </form>
            </div>
        </div>

        <footer class="footer">
        </footer>
    </div>

    <script>
        // Toggle Password Visibility
        const togglePassword = document.querySelector('#togglePassword');
        const passwordField = document.querySelector('#password');
        const showIcon = document.querySelector('#showIcon');
        const hideIcon = document.querySelector('#hideIcon');

        togglePassword.addEventListener('click', function () {
            const isPasswordHidden = passwordField.getAttribute('type') === 'password';
            passwordField.setAttribute('type', isPasswordHidden ? 'text' : 'password');
            showIcon.style.display = isPasswordHidden ? 'none' : 'inline';
            hideIcon.style.display = isPasswordHidden ? 'inline' : 'none';
        });
    </script>

</body>
</html>
