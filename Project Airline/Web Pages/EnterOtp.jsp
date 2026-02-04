<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>OTP Verification</title>
<link rel="icon" href="logo.png" type="image/x-icon">
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
    background-size: cover;
    color: #505050;
    font-family: "Rubik", Helvetica, Arial, sans-serif;
    font-size: 14px;
    font-weight: normal;
    line-height: 1.5;
    text-transform: none;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
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
    padding: 20px;
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
.input-container {
				    position: relative;
				    display: flex;
				    align-items: center;
				}
				
				.input-container i {
				    position: absolute;
				    left: 10px;
				    top: 40%; 
				    font-size: 16px;
				    color: #888;
				}
				
				.input-container input {
				    padding-left: 35px; /* Adjust to prevent text overlap with icon */
				    width: 100%;
				    height: 40px;
				    border: 1px solid #ccc;
				    border-radius: 5px;
				}
</style>
</head>
<body>
    <div class="login">
        <h2>Enter OTP</h2>
        <% if(request.getAttribute("message") != null) { %>
            <p class='text-danger'><%= request.getAttribute("message") %></p>
        <% } %>
        <form action="ValidateOtp" method="post">
            <div class="form-group">
                <label for="otp">Enter OTP</label>
                <div class="input-container">
    			<i class="fa fa-key"></i>
                <input class="form-control" type="text" name="otp" id="otp" placeholder="Enter OTP" required>
            </div>
            </div>
            <button class="subtn subtn-success" type="submit">Reset Password</button>
        </form>
    </div>
    <footer> Copyright © 2025 IndiAir All Rights Reserved</footer>
</body>
</html>