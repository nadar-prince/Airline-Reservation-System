<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IndiAir Login</title>
<link rel="icon" href="logo.png" type="image/x-icon">
  <link rel="stylesheet" href="alert/dist/sweetalert.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
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
            button.submitbtn{
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
            .submitbtn:hover{
            background-color:darkblue;
            }
            .b1{
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
            }
            .b1:hover{
            background-color:darkblue;
            }
            .submit{
                display: flex;
                justify-content: center;
                align-items: center;
            }
            a:link{
                color:black;
                background-color: transparent;
                font-weight: bold;
                text-decoration: none;
            }
            a{
                color:black;
                font-weight: bold;
            } 
            .register{
            color:white;
            font-weight: bold;
            }
            
            .forgot:hover{
                text-transform: uppercase;
                font-weight: bold;
                text-decoration: none;    
            }
            .b1:hover{
                text-transform: uppercase;
                font-weight: bold;
                text-decoration: none;    
            }
            .submitbtn:hover{
            	text-transform: uppercase;
                font-weight: bold;
                text-decoration: none; 
            }
       
		    .drop {
		      margin: 0;
		      font-family: Arial, sans-serif;
		    }
		    .dropdown {
		      position: absolute;
		      top: 10px;
		      right: 10px;
		    }
		    .dropdown select {
		      padding: 5px;
		      font-size: 16px;
		      color: cornflowerblue;
		      border: 1px solid #ccc;
		      border-radius: 10px; 
		      outline: none; 
		      transition: border-color 0.3s; 
		    }
		    .dropdown select:focus {
		      border-color: cornflowerblue; 
		    }
		    .dropdown select option:disabled {
		      font-weight: bold;
		    }
			 footer {
				  text-align: center;
				  padding: 10px 0;
				  font-size: 14px;
				  position: relative;
				  bottom: 0;
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
    <!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='api key';// your tawk to api key
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->
                
  <body>
  <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script type="text/javascript">
  var status=document.getElementById("status").value;
  if(status=="failed"){
	  swal("Sorry","Wrong Username or Password","error");
  }
  
  else if(status=="invaliduname2"){
	  swal("Sorry"," Username is Required","error");
  }
  
  else if(status=="invalidupwd"){
	  swal("Sorry"," Password is Required","error");
  }
  else if(status=="resetSuccess"){
	  swal("Congarts"," Password Reset done Successfully","success");
  }
  else if(status=="resetFailed"){
	  swal("Sorry"," Password Reset Failed","error");
  }
  </script>  
  
  
	<div class="div1">
        <img src="logo.png " alt="icon" width="80px" height="80px">
          <span><h2><i> Welcome To IndiAir </i></h2></span> 
        </div> 
        
        
        <div class="div2" style="text-align: center;">
           <strong><h2><marquee>✈️ Fly Smart, Travel Easy! Book Your Next Journey with IndiAir Today! 🚀</marquee></h2></strong>
            </div>
          <form method="post" action="loginServlet">
            <div class="login">
                <h1>IndiAir</h1>
                <h3>Login For Booking</h3>
                
                <%
    String message = (String) session.getAttribute("message");
    if (message != null) {
%>
    <div id="sessionMessage" style="color: red; font-weight: bold; text-align: center;">
        <%= message %>
    </div>
    <script>
        // Hide message after 5 seconds
        setTimeout(function() {
            document.getElementById("sessionMessage").style.display = 'none';
        }, 5000);
    </script>
<%
    session.removeAttribute("message"); 
    }
%>
                
                
                    <label for="name"> Username <span style="color: red;">*</span> </label>
                    <div class="input-container">
    				<i class="fa fa-user"></i>
                    <input type="text" id="name" name="username" placeholder="Enter your username" required="required">
                    </div>
                    <label for="password"> Password <span style="color: red;">*</span> </label>
                    <div class="input-container">
   		 			<i class="fa fa-lock"></i>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required="required">
              		</div>
              <div class="submit">
               <button class="submitbtn" type="submit" name="login" onclick="solve()">Log in</button>
            </div>
           <div class="forgot"><a style="text-decoration: none"  href="forgotPassword.jsp">Forgot Password</a>
                </div>    <p> Not Registered ? 
                <button class="b1" type="submit" onclick="solve()"> <a style="text-decoration: none" href="register.jsp" class="register" style="text-decoration:dotted;"> Register </a> </button> 
                </p>          
                   
                    
               <% String rs=request.getParameter("registration");
             if(rs !=null && rs.equals("success"))
             { %>
             <p style="color:green;"> User Registered Successful, Please Login.</p>
             <%} %>  
			    
                </div>
                </form>    
</body>
<body class=drop>
  <div class="dropdown">
    <select id="dropdown" onchange="navigateToPage()">
     <option value="" disabled selected >Login as</option> 
      <option value="login.jsp">User</option>
      <option value="admin.jsp">Admin</option>
    </select>
  </div>
  <script>
    function navigateToPage() {
      const dropdown = document.getElementById('dropdown');
      const selectedValue = dropdown.value;
      if (selectedValue) {
        window.location.href = selectedValue;
      }
    }
  </script>
   <footer>Copyright © 2025 IndiAir All Rights Reserved</footer>

</body>

</html>
