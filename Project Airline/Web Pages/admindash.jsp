<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="icon" href="logo.png" type="image/x-icon">
</head>
<style>
        body{
            background-image:url("bg2.jpg");
            background-attachment:fixed;
            background-size: 100% 100%;
            animation: changeBackground 12s infinite;
            color:#000000;
            display:flex;
            align-items: center;
            justify-content: center; 
            flex-direction:column;
            margin: 1%;
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
           .div2{
               font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
               position: relative;
                width: 100vw;
            }

           span{
                padding: 1px;
                }

            .div3{
                background-color: #fff;
                border-radius: 15px;
                box-shadow: 0 0 20px rgba(red, green, blue, alpha);
                padding: 2px 20px;
                transition: transform 0.2s;
                width: 450px;
                text-align:center;
            }
            h2{
                color:;
            }
            h3{
            color:red;
            text-decoration: none;
            }
            label{
                display: block;
                width: 100%;
                margin-top: 5px;
                margin-bottom: 1px;
                text-align:left;
                color: #555;
                font-weight: bold;
            }
            .logout{
             display: flex;
 			 align-items: right;
 			 justify-content: right;
 			 flex-direction: row;
 			 gap:4rem;
 			  } 
            input{
                display: block;
                width: 100%;
                margin-bottom: 5px;
                padding: 10px;
                box-sizing: border-box;
                border: 1px solid #ddd;
                border-radius: 5px;
                text-align: left;
            }
            button{
                padding: 15px;
                border-radius: 10px;
                margin-top: 5px;
                margin-bottom: 5px;
                border: none;
                color: white;
                cursor: pointer;
                background-color:cornflowerblue;
                width: 50%;
                font-size: 16px;
            }
            .submit{
                display: flex;
                justify-content: center;
                align-items: center;
            }
            a{
                color:#fff;
                font-weight: bold;
                text-decoration:none;
            }
            a:hover {
                color:;
                 background-color: transparent;
                text-transform: uppercase;
                font-weight: bold;
                text-decoration: none;
                }
                
 			  
 			  nav{
 			  max-width:var(--max-width);
 			  margin:auto;
 			  padding:0rem;
 			  display:flex;
 			  align-items:center;
 			  justify-content:space-between;
 			  gap:1rem;
 			  }
			
			.nav_logo{
			font-size:2.0rem;
			font-weight:600;
			color:var(--text-dark);
			align-items:left;
			}
			
			.nav_links{
			font-size:1.0rem;
			list-style:none;
			display:flex;
			align-items:center;
			gap:5rem;
			}
			
			.link a{
			font-weight:500;
			color:var(--text-light);
			transition:0.3s;			
			}
			
			.link a:hover{
			color:var(--text-dark);
			}
			.name{
			padding:.75rem 2rem;
			font-size:1.7rem;
			font-weight:500;
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
<body>
<script>
    window.history.forward();
    function noBack() {
        window.history.forward();
    }
</script>


<%
 if(session.getAttribute("username")==null)
 {
	 response.sendRedirect("login.jsp");
	 return;
 }
%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setHeader("Expires", "0"); // Proxies
%>
<nav>
<div class="nav_logo"><img src="logo.png " alt="icon" width="35px" height="30px"> IndiAir</div>
	<ul class="nav_links">
	<li class="link"><a href="addflight.jsp">Add Flight</a></li>
	<li class="link"><a href="updateflight.jsp">Update Flight</a></li>
	<li class="link"><a href="removeflight.jsp">Remove Flight</a></li>
	<li class="link"><a href="addAirport.jsp">Add Airport</a></li>	
	<li class="link"><a href="manageuser.jsp">Manage Users</a></li>	
	
	 <div class="logout">
             <a style="text-decoration:none" href="adminlogout.jsp"><h3>Logout</h3></a>
              <div>
        <h2><strong><span style="color:black">Welcome, </span> <span style="color:white"> <%=session.getAttribute("username")%></strong></span></h2> 
             </div> 
             </div>
	   </div>
	</ul>
</nav>
<div class="div1">
            <span><h1><i> Admin Dashboard </i></h1></span> 
            </div> 

       <div style="text-align: center; margin-top: 20px;">
    <img src="AdminReport.png" alt="Dashboard Image" width="80%" height="auto" style="border-radius: 10px; box-shadow: 0px 0px 10px rgba(0,0,0,0.2);">
</div>
</body>
     <footer>Copyright © 2025 IndiAir All Rights Reserved</footer>
</html>
