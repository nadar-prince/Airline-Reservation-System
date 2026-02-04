<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Verify OTP</title>
</head>
<link rel="icon" href="logo.png" type="image/x-icon">
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
            overflow: scroll;
            overflow-x: hidden;
            }
            ::-webkit-scrollbar{
            width:0;
            }
            @keyframes changeBackground {
      		0% { background-image: url('Bg.jpg'); }
    		33% { background-image: url('bg2.jpg'); }
     		66% { background-image: url('bg3.jpg'); }
      		100% { background-image: url('bg4.jpg'); }
    		}

            .login{
                background-color: #fff;
                border-radius: 15px;
                box-shadow: 0 0 20px rgba(red, green, blue, alpha);
                padding: 10px 20px;
                transition: transform 0.2s;
                width: 500px;
                text-align:center;
            }
            #sendOtpBtn {
        background-color: green; /* Blue color */
        color: white;
        border: none;
        font-size: 16px;
        padding: 8px 15px;
        border-radius: 5px; 
        height: 45px;
        align-items: center;
        cursor: pointer;
        transition: background 0.3s ease-in-out;
        font-weight:bold;
    }
    #sendOtpBtn:hover {
        background-color: darkgreen; /* Darker blue on hover */
    }
    footer {
				  text-align: center;
				  padding: 10px 0;
				  font-size: 14px;
				  position: relative;
				  bottom: 0;
				  width: 100%;
				}
</style>
<body>
<div class="login">
    <h2>Email OTP Verification</h2>
	<p>OTP has been sent to: <%= session.getAttribute("uemail") %></p>
    <form action="VerifyEmailOTPServlet" method="post">
        <label for="otp">Enter OTP:</label>
        <input type="text" name="otp" id="otp" required>
        
    <input type="hidden" name="fname" value="<%= session.getAttribute("fname") %>">
    <input type="hidden" name="lname" value="<%= session.getAttribute("lname") %>">
    <input type="hidden" name="uemail" value="<%= session.getAttribute("uemail") %>">
    <input type="hidden" name="umobile" value="<%= session.getAttribute("umobile") %>">
    <input type="hidden" name="uname2" value="<%= session.getAttribute("uname2") %>">
    <input type="hidden" name="upwd" value="<%= session.getAttribute("upwd") %>">
        
        <button type="submit" id="sendOtpBtn">Verify OTP</button>
    </form>

    <% if (request.getAttribute("Message") != null) { %>
        <p style="color:red;"><%= request.getAttribute("Message") %></p>
    <% } %>
</div>
 <footer> Copyright © 2025 IndiAir All Rights Reserved</footer>
</body>
</html>
