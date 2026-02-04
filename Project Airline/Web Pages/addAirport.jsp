<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Airport</title>
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
	   .message {
        font-size: 16px;
        font-weight: bold;
        padding: 10px;
        margin: 10px auto;
        width: 80%;
        text-align: center;
        border-radius: 5px;
    }
    .success {
        color: green;
        background-color: #d4edda;
        border: 1px solid #c3e6cb;
    }
    .error {
        color: red;
        background-color: #f8d7da;
        border: 1px solid #f5c6cb;
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
                gap: 20px;
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
            
            .b1{
                padding: 15px;
                border-radius: 10px;
                margin-top: 15px;
                margin-bottom: 15px;
                border: none;
                color: white;
                cursor: pointer;
                background-color:green;
                width: 40%;
                gap: 10px;
                font-size: 16px;
            }
            .b1:hover{
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
    <img src="logo.png" alt="icon" width="80px" height="80px">
    <span><h2><i> Welcome Admin </i></h2></span> 
</div> 

<div class="login">
    <header>
        <h1>Add New Airport</h1>
    </header>
    
    <% 
        String message = request.getParameter("message");
        String status = request.getParameter("status");
        if (message != null && status != null) { 
    %>
        <div class="message <%= status %>"><%= message %></div>
    <% } %>

    <form action="AddAirportServlet" method="post">
        <label for="locationName" style="position: relative; top: 32px; font-size:18px; display: inline-block;">Airport Name:</label>
        <input type="text" id="locationName" name="locationName" required><br><br>

       <button class="b1"type="submit"> Add Airport </button> 
        <button class="b2" type="submit"> <a style="text-decoration: none" href="admindash.jsp" "> Go Back </a> </button> 
    </form>
</div>
</body>
 <footer>Copyright © 2025 IndiAir All Rights Reserved</footer>
</html>