<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    if (session.getAttribute("name") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) session.getAttribute("name");

    // Fetch user details
    String fname = "", lname = "", email = "", mobile = "";
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/princedata?useSSL=false", "root", "Prince@1212");
        PreparedStatement ps = conn.prepareStatement("SELECT fname, lname, uemail, umobile FROM users WHERE uname2=?");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            fname = rs.getString("fname");
            lname = rs.getString("lname");
            email = rs.getString("uemail");
            mobile = rs.getString("umobile");
        }
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
 <link rel="icon" href="logo.png" type="image/x-icon">
    <title>Update Profile</title>
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
                background-color:green;
                width: 30%;
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
    </style>
</head>
<body>
    <div class="login">
        <h2>Update Profile</h2>
        <form action="UpdateDetailsServlet" method="post">
            <label>👤 First Name:</label>
            <input type="text" name="fname" value="<%= fname %>" required><br>
            <label>👤 Last Name:</label>
            <input type="text" name="lname" value="<%= lname %>" required><br>
            <label>📧 Email:</label>
            <input type="email" name="email" value="<%= email %>" required><br>
            <label>📞 Mobile:</label>
            <input type="text" name="mobile" value="<%= mobile %>" pattern="[0-9]{10}" required><br>
            <input type="hidden" name="username" value="<%= username %>">
            <button type="submit" class="b3" style="font-weight:bold";>Update</button>
             <button class="b2" type="submit"> <a style="text-decoration: none" href="UserProfile.jsp"  style="text-decoration:dotted;"> Go Back </a> </button> 
        </form>
    </div>
</body>
<footer>Copyright © 2025 IndiAir All Rights Reserved</footer>
</html>
