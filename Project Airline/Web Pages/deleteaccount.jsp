<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("name") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="logo.png" type="image/x-icon">
    <title>Delete Account</title>
    <style>
        body{
            background-image:url("Bg.jpg");
            background-attachment:fixed;
            background-size: 100% 100%;
            animation: changeBackground 12s infinite;
            color:#000000;
            display: flex;
            align-items: center;
            justify-content: center;
            line-height: 1.6;
            min-height: 100vh;
            flex-direction:column;
            margin: 0;
            }
             @keyframes changeBackground {
      		0% { background-image: url('Bg.jpg'); }
    		33% { background-image: url('bg2.jpg'); }
     		66% { background-image: url('bg3.jpg'); }
      		100% { background-image: url('bg4.jpg'); }
    		}
        h2 {
            color: #333;
        }
        .login{
                background-color: #fff;
                border-radius: 15px;
                justify-content: center;
                align-items: center;
                box-shadow: 0 0 20px rgba(red, green, blue, alpha);
                padding: 10px 20px;
                transition: transform 0.2s;
                width: 500px;
                text-align:center;
            }
         .div1{
                font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
                display: flex;
                text-align: center;
                justify-content: center;
                }
            .b3{
                padding: 15px;
                border-radius: 10px;
                margin-top: 15px;
                margin-bottom: 15px;
                border: none;
                color: white;
                cursor: pointer;
                background-color:red;
                width: 60%;
                gap: 10px;
                font-size: 16px;
            }
            .b3:hover{
            text-transform: uppercase;
                font-weight: bold;
                text-decoration: none;
            }
            .b2{
                padding: 15px;
                border-radius: 10px;
                margin-top: 15px;
                margin-bottom: 15px;
                border: none;
                color: white;
                cursor: pointer;
                background-color:cornflowerblue;
                width: 30%;
                gap: 10px;
                font-size: 16px;
            }
            .b2:hover{
            text-transform: uppercase;
                font-weight: bold;
                text-decoration: none;
            }
            a
            {
            color: white;
            }
            footer {
				  text-align: center;
				  padding: 10px 0;
				  font-size: 14px;
				  position: relative;
				  bottom: 0;
				  width: 100%;
				}  
				::-webkit-scrollbar{
            width:0;
            }
    </style>
    <script>
        function validateForm() {
            let reasons = document.querySelectorAll('input[name="reason"]:checked');
            let optionalReason = document.getElementById("optionalReason").value.trim();
            let password = document.getElementById("password").value.trim();

            if (reasons.length === 0 && optionalReason === "") {
                alert("Please select at least one reason or provide your own.");
                return false;
            }
            if (password === "") {
                alert("Please enter your password to confirm deletion.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="login">
        <h2>Are you sure you want to delete your account?</h2>
        <p>Please select a reason for deleting your account:</p>
        <form action="DeleteAccountServlet" method="post" onsubmit="return validateForm()">
            <div class="">
                <input type="radio" name="reason" value="Privacy concerns"> Privacy concerns <br>
                <input type="radio" name="reason" value="Not satisfied with service"> Not satisfied with service <br>
                <input type="radio" name="reason" value="Found an alternative service"> Found an alternative service <br> <br>
                <label for="optionalReason" style="position: relative; top: -10px; display: inline-block;"><strong>Other (optional):</strong></label>
				<textarea name="optionalReason" id="optionalReason" placeholder="Your reason here..."></textarea>
            </div>
			<br>
            <label for="password"><strong>Confirm Password:</strong></label>
            <input type="password" name="password" id="password" placeholder="Enter your password" required><br>

            <button type="submit" class="b3">Yes, Delete My Account</button>
            <a href="UserProfile.jsp"><button type="button" class="b2">Cancel</button></a>
        </form>
    </div>
</body>
<footer>Copyright © 2025 IndiAir All Rights Reserved</footer>
</html>
