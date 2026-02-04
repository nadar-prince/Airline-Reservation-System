<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%
    // Ensure user is logged in by checking session
    if (session.getAttribute("name") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="icon" href="logo.png" type="image/x-icon">
    <title>User Profile</title>
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
        .profile-details {
            margin: 20px 0;
            padding: 15px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .profile-details p {
            margin: 10px 0;
            font-size: 16px;
        }
        .profile-details p strong {
            color: #444;
        }
        .logout-link {
            margin-top: 20px;
            display: block;
            color: #007bff;
            text-decoration: none;
        }
        .logout-link:hover {
            text-decoration: underline;
        }
         .div1{
                font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
                display: flex;
                text-align: center;
                justify-content: center;
                }
                .b1{
                padding: 15px;
                border-radius: 10px;
                margin-top: 15px;
                margin-bottom: 15px;
                border: none;
                color: white;
                cursor: pointer;
                background-color:red;
                width: 20%;
                gap: 10px;
                font-size: 16px;
            }
            .b2{
                padding: 15px;
                border-radius: 10px;
                margin-top: 15px;
                margin-bottom: 15px;
                border: none;
                color: white;
                cursor: pointer;
                background-color:green;
                width: 20%;
                gap: 10px;
                font-size: 16px;
            }
            .b3{
                padding: 15px;
                border-radius: 10px;
                margin-top: 15px;
                margin-bottom: 15px;
                border: none;
                color: white;
                cursor: pointer;
                background-color:cornflowerblue;
                width: 20%;
                gap: 10px;
                font-size: 16px;
            }
            .logout{
            color:white;
            font-weight: bold;
            }
            
            .update{
            color:white;
            font-weight: bold;
            }
            .forgot{
            color: green;
            font-weight: itaic;
            }
            .forgot:hover{
                text-transform: uppercase;
                font-weight: bold;
                text-decoration: none;    
            }
            .change{
                color:green;
                font-weight: bold;
            }
            .b1:hover{
            text-transform: uppercase;
                font-weight: bold;
                text-decoration: none;
            }
            .b2:hover{
            text-transform: uppercase;
                font-weight: bold;
                text-decoration: none;
            }
            .b3:hover{
            text-transform: uppercase;
                font-weight: bold;
                text-decoration: none;
            }
             .b4{
                padding: 15px;
                border-radius: 10px;
                margin-top: 15px;
                margin-bottom: 15px;
                border: none;
                color: white;
                cursor: pointer;
                background-color:cornflowerblue;
                width: 20%;
                gap: 10px;
                font-size: 16px;
            }
            .b4:hover{
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
			table {
			    width: 100%;
			    border-collapse: collapse;
			    margin: 10px auto;
			}
			
			td {
			    padding: 10px;
			    text-align: center; 
			    font-size: 16px;
			}
			
			tr td:first-child {
			    font-weight: bold;
			    text-align: right; 
			    padding-right: 10px;
			}
			
			tr td:last-child {
			    text-align: left; 
			    padding-left: 5px;
			}
    </style>
</head>
<body>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
%>
 <div class="div1">
        <img src="logo.png " alt="icon" width="80px" height="80px">
        </div> 
        <h1>Profile</h1>
<div class="login">
    <h2>Hello, <%= session.getAttribute("name") %>!</h2>
   <table>
   <%
    String message = (String) session.getAttribute("message");
    if (message != null) {
%>
    <p id="message" style="color: green; text-align: center; font-weight: bold;"><%= message %></p>
    <script>
        setTimeout(function() {
            document.getElementById("message").style.display = "none";
        }, 3000); // Message disappears after 3 seconds
    </script>
<%
        session.removeAttribute("message"); // Remove message from session
    }
%>
   <%
   try{
	   Class.forName("com.mysql.cj.jdbc.Driver");
       Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/princedata?useSSL=false", "root", "Prince@1212");
	   Statement smt=conn.createStatement();
	   String u1=(String)session.getAttribute("name");
	   String s1="select * from users where uname2='"+u1+"'";
	   ResultSet rs=smt.executeQuery(s1);
	   if(rs.next())
	   {%>
		 <tr><td>🧑‍💼 First Name: </td><td> <% out.println(rs.getString(2)); %></td></tr>  
		 <tr><td>🧑‍💼 Last Name: </td><td> <% out.println(rs.getString(3)); %></td></tr>
		 <tr><td>👤 UserName: </td><td> <% out.println(rs.getString(4)); %></td></tr> 
		 <tr><td>🔒 Password: </td><td> <% out.println(rs.getString(5)); %></td></tr>
		 <tr><td>📧 Email: </td><td> <% out.println(rs.getString(6)); %></td></tr> 
		 <tr><td>📞 Mobile No: </td><td> <% out.println(rs.getString(7)); %></td></tr>
	   <%}
   }catch(Exception e)
   {
	   out.println("e");
   }
   %>
   </table>
   <div class="btn">
   <button class="b4" type="submit"> <a style="text-decoration: none" href="index.jsp"  style="text-decoration:dotted;"> Go Back </a> </button> 
    <button class="b2" type="submit" onclick="solve()"> <a style="text-decoration: none" class="update" href="updatedetails.jsp"> Edit Details </button>
    <button class="b1" type="submit" onclick="solve()"> <a style="text-decoration: none" class="logout" href="deleteaccount.jsp"> Delete Account </button>
     <button class="b3" type="submit" onclick="solve()"> <a style="text-decoration: none" class="logout" href="logout.jsp"> Logout </button>
    </div>
     <div class="forgot"><a class="change" style="text-decoration: none"  href="changepassword.jsp">Change Password</a></div>
</div>
</body>
<footer>Copyright © 2025 IndiAir All Rights Reserved</footer>
</html>