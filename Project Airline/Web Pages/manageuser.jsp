<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Users</title>
<link rel="icon" href="logo.png" type="image/x-icon">
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
    		 .login{
                background-color: #fff;
                border-radius: 15px;
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
            .a{
                color:black;
                font-weight: bold;
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
</style>
<body>

<div class="div1">
        <img src="logo.png " alt="icon" width="80px" height="80px">
          <span><h2><i> Welcome To IndiAir </i></h2></span> 
        </div>
        <h1>Management Dashboard</h1> 
	<div class="login">
    <form action="UserManageServlet" method="post">
        <input type="hidden" name="operation" value="view" />
        <div class="submit">
        <button class="submitbtn" type="submit" onclick="solve()">View Users</button>
        </div>
    </form><br>

    <form action="adduser.jsp" method="get">
    <div class="submit">
        <button class="submitbtn" type="submit" onclick="solve()">Add Users</button>
        </div>
    </form><br>

     <form action="updateuser.jsp" method="post">
        <input type="hidden" name="operation" value="update" />
       <button class="submitbtn" type="submit" onclick="solve()">Update User</button>
    </form><br>

    <form action="deleteuser.jsp" method="post">
        <input type="hidden" name="operation" value="delete" />
        <div class="submit">
       <button class="submitbtn" type="submit" onclick="solve()">Delete User</button>
        </div>
        <a href="admin.jsp" style="color:red; font-weight: bold;">Logout</a>
    </form><br>
	</div>
    </body>
     <footer>Copyright © 2025 IndiAir All Rights Reserved</footer>
</html>