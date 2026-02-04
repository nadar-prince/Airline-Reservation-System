<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IndiAir Registration</title>
<link rel="icon" href="logo.png" type="image/x-icon">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<script>
    function validateEmail() {
        var email = document.getElementById("email").value;
        var errorMessage = document.getElementById("email-error-message");
        var regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

        if (!regex.test(email)) {
            errorMessage.style.display = "block";
            return false;  
        } else {
            errorMessage.style.display = "none";
            return true;
        }
    }

    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("otpForm").addEventListener("submit", function (event) {
            if (!validateEmail()) {
                event.preventDefault(); 
            }
        });
    });
</script>

</head>
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
            .div1{
                font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
                display: flex;
                text-align: center;
                justify-content: center;
               
            }
             span{
                padding: 1px;
                }
                
                .div2{
               font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
            	position: relative;
                width: 100vw; 
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
            h1{
                color:cornflowerblue;
            }

            label{
                display: block;
                width: 100%;
                margin-top: 10px;
                margin-bottom: 5px;
                text-align:left;
                color: #555;
                font-weight: bold;
            }

            input{
                display: block;
                width: 100%;
                margin-bottom: 15px;
                padding: 10px;
                box-sizing: border-box;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            .subtn{
                padding: 15px;
                border-radius: 10px;
                margin-top: 15px;
                margin-bottom: 15px;
                border: none;
                color: white;
                cursor: pointer;
                background-color:cornflowerblue;
                width: 100%;
                font-size: 16px;
                 font-weight:bold;
            }
			.subtn:hover{
			background-color:darkblue;
			text-transform: uppercase;
                font-weight: bold;
                text-decoration: none;   
			}
            .submit{
                display: flex;
                justify-content: center;
                align-items: center;
            }
            a{
                color:black;
                font-weight: bold;
            }
            a:hover {
                color:black;
                 background-color: transparent;
                text-transform: uppercase;
                font-weight: bold;
                text-decoration: none;
                }
			  footer {
				  text-align: center;
				  padding: 10px 0;
				  font-size: 14px;
				  position: relative;
				  bottom: 0;
				  width: 100%;
				}    
  button {
            z-index: 9999;
            position: relative;
            cursor: pointer;
            color: red;
        }
         #sendOtpBtn {
        background-color: green;
        color: white;
        border: none;
        font-size: 16px;
        cursor: pointer;
        transition: background 0.3s ease-in-out;
        font-weight:bold;
    }

    #sendOtpBtn:hover {
        background-color: darkgreen; /
    }
    #getOtpBtn{
     background-color: green;
    }
    #getOtpBtn:hover{
    	 background-color: darkgreen; 
    }
    #email-error-message {
        color: red;
        display: none;
        font-size: 14px;
        margin-top: 5px;
    }
    .error{
    color:red;
    }
	    .input-container {
	    position: relative;
	    display: flex;
	    align-items: center;
	}
	
	.input-container i {
	    position: absolute;
	    left: 10px;
	    top: 22%; 
	    font-size: 16px;
	    color: #888;
	}
	
	.input-container input {
	    padding-left: 35px; 
	    width: 100%;
	    height: 40px;
	    border: 1px solid #ccc;
	    border-radius: 5px;
	}
    
	</style>
	
<body>	
<div class="div1">
            <img src="logo.png " alt="icon" width="80px" height="80px">
              <span><h2><i> Welcome To IndiAir </i></h2></span> 
            </div> 
            
            <div class="div2" style="text-align: center;">
               <strong><h2><marquee>✈️ Fly Smart, Travel Easy! Book Your Next Journey with IndiAir Today! 🚀</marquee></h2></strong>
                </div>

				<form action="Registrationservlet" method="post">
    <div class="login">
        <h1>IndiAir</h1>
        <h3>Create Account</h3>



<label for="fname">First Name <span style="color: red;">*</span></label>
<div class="input-container">
    <i class="fa fa-user"></i>
    <input type="text" name="fname" id="fname" placeholder="Enter your first name" 
           value="<%= (session.getAttribute("fname") != null) ? session.getAttribute("fname") : "" %>" 
           required="required" oninput="validateName('fname')" onkeypress="return restrictInput(event)">
</div>
<p id="error-message-fname" style="color: red; display: none;">Invalid Name. Must start with an uppercase letter and contain only alphabets.</p>

<% if ("fnameError".equals(request.getParameter("error"))) { %>
    <p style="color: red;">Invalid Name. Must start with an uppercase letter and contain only alphabets.</p>
<% } %>


<label for="lname">Last Name <span style="color: red;">*</span></label>
<div class="input-container">
    <i class="fa fa-user"></i>
<input type="text" name="lname" id="lname" placeholder="Enter your last name" value="<%= (session.getAttribute("lname") != null) ? session.getAttribute("lname") : "" %>" required="required" oninput="validateName('lname')" onkeypress="return restrictInput(event)">
</div>
<p id="error-message-lname" style="color: red; display: none;">Invalid Name. Must start with an uppercase letter and contain only alphabets.</p>

<% if ("lnameError".equals(request.getParameter("error"))) { %>
    <p style="color: red;">Invalid Name. Must start with an uppercase letter and contain only alphabets.</p>
<% } %>

<script>
  function validateName(field) {
    var nameField = document.getElementById(field);
    var name = nameField.value;
    var errorMessage = document.getElementById("error-message-" + field);

    var regex = /^[A-Z][a-zA-Z]*$/;

    if (name.length > 0) {
      name = name.charAt(0).toUpperCase() + name.slice(1).replace(/[^a-zA-Z]/g, ""); 
      nameField.value = name;
    }

    if (!regex.test(name)) {
      errorMessage.style.display = "block";
    } else {
      errorMessage.style.display = "none";
    }
  }

  function restrictInput(event) {
    var char = String.fromCharCode(event.which);
    if (!/^[a-zA-Z]$/.test(char)) {
      event.preventDefault();
      return false;
    }
  }

  document.getElementById("fname").addEventListener("paste", function (event) {
    event.preventDefault();
  });

  document.getElementById("lname").addEventListener("paste", function (event) {
    event.preventDefault();
  });
</script>

	<!-- email otp system -->
		<script>
    function validateEmail() {
        var email = document.getElementById("email").value;
        var errorMessage = document.getElementById("email-error-message");
        var regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

        if (regex.test(email)) {
            errorMessage.style.display = "none";
            setTimeout(function () {
                errorMessage.style.visibility = "hidden";
            }, 3000); 
        } else {
            errorMessage.style.display = "block";
            errorMessage.style.visibility = "visible";
        }
    }

    function sendOtp() {
        var email = document.getElementById("email").value;
        var errorMessage = document.getElementById("email-error-message");

        if (!email) {
            alert("Please enter an email before sending OTP.");
            return;
        }

        if (errorMessage.style.display === "block") {
            alert("Please enter a valid email.");
            return;
        }

        window.location.href = "EmailOTPServlet?email=" + encodeURIComponent(email);
    }
</script>

<label for="email">Email <span style="color: red;">*</span></label>
<div style="display: flex; align-items: center; gap: 5px;">
<div class="input-container">
    <i class="fa fa-envelope"></i>
<input type="email" name="email" id="email" placeholder="Enter your email address" value="<%= session.getAttribute("uemail") != null ? session.getAttribute("uemail") : "" %>" style="width: 350px;" required oninput="validateEmail()">
</div>
<button id="sendOtpBtn" style="padding: 8px 15px; border: none; border-radius: 5px; cursor: pointer; height: 45px; display: flex; align-items: center; position: relative; top: -8px;" onclick="sendOtp()">Send OTP</button>
</div>
<p id="email-error-message">Invalid Email.</p>
<% if (request.getAttribute("Message") != null) { %>
    <p style="color:green;"><%= request.getAttribute("Message") %></p>
<% } %>

<%
    String error = request.getParameter("error");
    if ("email_exists".equals(error)) {
%>
    <div class="error">Email is already registered. Please use another email.</div>
<%
    }
%>

        <% if ("email".equals(request.getParameter("error"))) { %>
            <p style="color: red;">Invalid Email. Email should be a valid format.</p>
        <% } %>

    <script>
    
        function openOtpModal() {
            document.getElementById("otpModal").style.display = "block";
        }

        function closeOtpModal() {
            document.getElementById("otpModal").style.display = "none";
        }

        function getOtp() {
            var mobile = document.getElementById("mobile").value;
            var verificationMessage = document.getElementById("verificationMessage");

            verificationMessage.innerHTML = "";

            if (!/^[6789]\d{9}$/.test(mobile)) {
                alert("Invalid Mobile Number. It should start with 9, 8, 7, or 6 and be 10 digits long.");
                return;
            }

            fetch('GenerateOtpServlet?mobile=' + mobile)
                .then(response => response.text())
                .then(data => {
                    if (data.trim() === "OTP_SENT") {
                        openOtpModal();
                    } else {
                        alert("Error generating OTP. Try again.");
                    }
                });
        }

        function verifyOtp() {
            var otp = document.getElementById("otp").value;
            var verificationMessage = document.getElementById("verificationMessage");

            fetch('VerifyOtpServlet?otp=' + otp)
                .then(response => response.text())
                .then(data => {
                    if (data.trim() === "OTP_VALID") {
                        verificationMessage.innerHTML =
                            "<span style='color: green; font-weight: bold;'>Mobile No Verified Successfully</span>";
                        closeOtpModal();
                        setTimeout(function () {
                            verificationMessage.innerHTML = "";
                        }, 2000);
                    } else {
                        alert("Invalid OTP. Please try again.");
                    }
                });
        }
    </script>

        <!-- Mobile -->
<label for="mobile">Mobile Number <span style="color: red;">*</span></label>
<div style="display: flex; align-items: center; gap: 5px;">
    <div style="display: flex; align-items: center;">
        <span style="padding: 5px; line-height: normal; display: inline-block; align-items: center;  top: -8px; height: 30px; font-weight: bold;">+91</span>
        <div class="input-container">
    <i class="fa fa-phone"></i>
        <input type="text" name="mobile" id="mobile" placeholder="Enter your mobile no" value="<%= session.getAttribute("umobile") != null ? session.getAttribute("umobile") : "" %>" required="required" style="width: 300px;" oninput="validateMobile()">
    </div>
    </div>
    <button id="getOtpBtn" onclick="getOtp()" style="background-color: green; font-size: 16px; font-weight: bold; color: white; padding: 8px 15px; border: none; border-radius: 5px; cursor: pointer; height: 45px; display: flex; align-items: center; position: relative; top: -8px;">Send OTP</button>
</div>
<p id="mobile-error-message" style="color: red; display: none;">Invalid Mobile Number. Number must start with 6,7,8,9 and it should be 10-digit number.</p>

<p id="verificationMessage" style="margin-top: 5px;"></p>

<script>
function validateMobile() {
    var mobileField = document.getElementById("mobile");
    var mobile = mobileField.value;
    var errorMessage = document.getElementById("mobile-error-message");

    if (mobile === "") {
        errorMessage.style.display = "none";
        return;
    }

    var regex = /^[6789]\d{9}$/;

    if (!regex.test(mobile)) {
        errorMessage.style.display = "block";
    } else {
        errorMessage.style.display = "none"; 
    }
}
document.getElementById("mobile").addEventListener("input", function (event) {
    this.value = this.value.replace(/[^0-9]/g, "");
});
</script>

<div id="otpModal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5);">
    <div style="background: white; padding: 20px; border-radius: 5px; width: 300px; margin: 100px auto; text-align: center;">
        <h3>Enter OTP</h3>
        <div style="display: flex; align-items: center;">
            <input type="text" id="otp" placeholder="Enter OTP" required="required" style="width: 300px;">
        </div>
        <div>
            <button onclick="verifyOtp()" style="background-color: green; color: white; padding: 8px 15px; border: none; border-radius: 5px; cursor: pointer; height: 35px;">Verify OTP</button>
            <button onclick="closeOtpModal()" style="margin-left: 10px; background-color: red; color: white; padding: 8px 15px; border: none; border-radius: 5px; cursor: pointer; height: 35px;">Close</button>
        </div>
    </div>
</div>

        <!-- Username -->
<label for="username">Username <span style="color: red;">*</span></label>
<div class="input-container">
    <i class="fa fa-user"></i>
<input type="text" name="username" id="username" placeholder="Enter a username" value="<%= session.getAttribute("uname2") != null ? session.getAttribute("uname2") : "" %>" required="required" oninput="validateUsername()">
</div>
<p id="username-error-message" style="color: red; display: none;">Invalid Username. Must start with a lowercase letter and be a maximum of 16 characters.</p>

<script>
  function validateUsername() {
    var inputField = document.getElementById("username");
    var errorMessage = document.getElementById("username-error-message");

    if (inputField.value.length > 0) {
      inputField.value = inputField.value.charAt(0).toLowerCase() + inputField.value.slice(1);
    }

    var regex = /^[a-z][a-zA-Z0-9@_]{0,15}$/;

    if (!regex.test(inputField.value)) {
      errorMessage.style.display = "block"; 
    } else {
      errorMessage.style.display = "none";  
    }
  }

  document.getElementById("username").addEventListener("input", validateUsername);
</script>

<% if ("username_taken".equals(request.getParameter("error"))) { %>
    <p style="color: red;">Username already taken. Please try with some changes another.</p>
<% } %>

<% if ("username".equals(request.getParameter("error"))) { %>
  <p style="color: red;">Invalid Username. Must start with a lowercase letter and be a maximum of 16 characters.</p>
<% } %>
     

        <!-- Password -->
        <label for="password">Password <span style="color: red;">*</span></label>
		<div class="input-container">
   		 <i class="fa fa-lock"></i>
		<input type="password" name="password" id="password" placeholder="****************" value="<%= session.getAttribute("upwd") != null ? session.getAttribute("upwd") : "" %>" required="required" oninput="validatePassword()">
		</div>
			<p id="password-error-message" style="color: red; display: none;">
  		Invalid Password. Must start with an uppercase letter, followed by lowercase letters, contain a symbol and a number, and have a length of 8–16 characters.
		</p>
		<button type="button" id="showPasswordBtn" onclick="togglePasswordVisibility()" style="background-color: gray; font-weight: bold; color: black; padding: 8px 15px; border: none; border-radius: 5px; cursor: pointer; margin-left: 10px;">
  Show Password
</button>
	
<script>
function validatePassword() {
	  var password = document.getElementById("password").value;
	  var errorMessage = document.getElementById("password-error-message");

	  if (password === "") {
	    errorMessage.style.display = "none";  
	    return;
	  }

	  var regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,16}$/;

	  if (!regex.test(password)) {
	    errorMessage.style.display = "block";  
	  } else {
	    errorMessage.style.display = "none";   
	  }
	}
  function togglePasswordVisibility() {
	    var passwordField = document.getElementById("password");
	    var showPasswordBtn = document.getElementById("showPasswordBtn");
	    if (passwordField.type === "password") {
	      passwordField.type = "text";
	      showPasswordBtn.textContent = "Hide Password";
	    } else {
	      passwordField.type = "password";
	      showPasswordBtn.textContent = "Show Password";
	    }
	  }
</script>
        <% if ("password".equals(request.getParameter("error"))) { %>
 		<p style="color: red;">
        Invalid Password. Must start with an uppercase letter, followed by a symbol, a number, and have a length of 8–16 characters.</p>
		<% } %>

        <!-- Confirm Password -->
        <label for="confpassword">Confirm Password <span style="color: red;">*</span></label>
		<div class="input-container">
    	<i class="fa fa-lock"></i>
		<input type="password" name="confpassword" id="confpassword" placeholder="****************" required="required" oninput="validateConfirmPassword()">
		</div>
		<p id="confpassword-error-message" style="color: red; display: none;">
  		Please make sure that your password match.
		</p>
<script>
function validateConfirmPassword() {
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confpassword").value;
    var errorMessage = document.getElementById("confpassword-error-message");

    if (confirmPassword !== password) {
      errorMessage.style.display = "block";
    } else {
      errorMessage.style.display = "none";
    }
  }
</script>
        <% if ("confpassword".equals(request.getParameter("error"))) { %>
            <p style="color: red;">Passwords do not match. Please re-enter.</p>
        <% } %>

        <div class="submit">
            <button class="subtn" type="submit" name="signup" id="signup">Submit</button>
        </div>
        <a style="text-decoration: none" href="login.jsp">Return To Login Page</a>
    </div>
</form>
 <footer> Copyright © 2025 IndiAir All Rights Reserved</footer>
</body>
</html>