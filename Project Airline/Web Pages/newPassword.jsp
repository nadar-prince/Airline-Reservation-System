<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>New Password</title>
<link rel="icon" href="logo.png" type="image/x-icon">
<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<style>
body {
    background-image: url("Bg.jpg");
    background-attachment: fixed;
    background-size: 100% 100%;
    animation: changeBackground 12s infinite;
    background-position: center;
    background-color: #eee;
    background-repeat: no-repeat;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    font-family: Arial, sans-serif;
}

@keyframes changeBackground {
    0% { background-image: url('Bg.jpg'); }
    33% { background-image: url('bg2.jpg'); }
    66% { background-image: url('bg3.jpg'); }
    100% { background-image: url('bg4.jpg'); }
}

.login {
    background-color: #fff;
    border-radius: 15px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
    padding: 35px;
    transition: transform 0.2s;
    width: 400px;
    text-align: center;
}

.subtn {
    padding: 15px;
    border-radius: 10px;
    margin-top: 15px;
    margin-bottom: 15px;
    border: none;
    color: white;
    cursor: pointer;
    width: 100%;
    font-size: 16px;
    font-weight: bold;
}

.subtn-success {
    background-color: green;
}

.subtn-danger {
    background-color: red;
    text-decoration: none;
}

.subtn-danger a {
    color: white;
    text-decoration: none;
}

.form-control {
    width: 100%;
    padding: 8px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
}

footer {
    text-align: center;
    padding: 10px 0;
    font-size: 14px;
    position: absolute;
    bottom: 10px;
    width: 100%;
}

a {
    color: white;
    text-decoration: none;
}

.input-container {
				    position: relative;
				    display: flex;
				    align-items: center;
				}
				
				.input-container i {
				    position: absolute;
				    left: 10px;
				    top: 34%; 
				    font-size: 16px;
				    color: #888;
				}
				
				.input-container input {
				    padding-left: 35px; /* Adjust to prevent text overlap with icon */
				    width: 100%;
				    height: 20px;
				    border: 1px solid #ccc;
				    border-radius: 5px;
				}
</style>
</head>
<body>
    <div class="login">
        <h2>Reset Password</h2>
        <form action="newPassword" method="POST">
            <div class="form-group">
                <div class="input-container">
   		 			<i class="fa fa-lock"></i>
                <input type="text" name="password" placeholder="New Password" class="form-control" required>
            	</div>
            </div>
            <div class="form-group">
                <div class="input-container">
   		 			<i class="fa fa-lock"></i>
                <input type="password" name="confPassword" placeholder="Confirm New Password" class="form-control" required>
            	</div>
            </div>
            <button class="subtn subtn-success" type="submit">Reset</button>
        </form>
    </div>
 <footer> Copyright © 2025 IndiAir All Rights Reserved</footer>
</body>
</html>
