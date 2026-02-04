<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IndiAir Admin Login</title>
<link rel="icon" href="logo.png" type="image/x-icon">
<link rel="stylesheet" href="alert/dist/sweetalert.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<style>
            body{
            background-image:url("Bg.jpg");
            background-attachment:fixed;
            animation: changeBackground 12s infinite;
            background-size: 100% 100%;
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
                padding: 20px;
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
            button{
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
            .submit{
                display: flex;
                justify-content: center;
                align-items: center;
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
				    padding-left: 35px; /* Adjust to prevent text overlap with icon */
				    width: 100%;
				    height: 40px;
				    border: 1px solid #ccc;
				    border-radius: 5px;
				}
						
        </style>
   
                
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
          <form action="AdminLoginServlet" method="post">
            <div class="login">
                <h1>IndiAir</h1>
                <h3>Admin Login</h3>
                    <label for="name">Username<span style="color: red;">*</span> </label>
                    <div class="input-container">
    				<i class="fa fa-user"></i>
                    <input type="text" id="username" name="username" placeholder="Enter Your Username" required="required">
                    </div>
                    <label for="password">Password<span style="color: red;">*</span> </label>
                    <div class="input-container">
   		 			<i class="fa fa-lock"></i>
                    <input type="password" id="password" name="password" placeholder="Enter Your Password" required="required">
              		</div>
              <div class="submit">
               <button class="submitbtn" type="submit" name="login" onclick="solve()">Log in</button>
            </div>
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