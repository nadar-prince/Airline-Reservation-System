<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Flight Booking</title>
<link rel="icon" href="logo.png" type="image/x-icon"> 
<link href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css" rel="stylesheet"/>
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
                color:cornflowerblue;
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
            .submain{
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
            .submain:hover{
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
                
                
           .logout{
             display: flex;
 			 align-items: right;
 			 justify-content: right;
 			 flex-direction: row;
 			 gap:4rem;
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
			
			.input-container {
		     display: flex;
		     align-items: center;
		     margin-bottom: 10px;
		    }

   			 .btn-left, .btn-right {
        	 background-color:none;
        	 color: gray;
             border: none; 
             padding: 5px 10px;
             cursor: pointer;
             font-size: 16px;
             border-radius: 5px;
            }
		
		    .btn-left {
		     margin-right: 5px;
		    }
		
		    .btn-right {
		     margin-left: 5px;
		    }
		    
		    input[type="number"] {
		     width: 50px;
		     text-align: center;
		     margin: 0 10px;
		     padding: 5px;
		     font-size: 16px;
		    }
			
			footer {
		    text-align: center;
		    padding: 10px 0;
		    font-size: 14px;
	        position: relative;
		    bottom: 0;
		    width: 100%;
				}	
		  select {
		    width: 150px;
		    padding: 8px;
		    font-size: 12px;
		    border-radius: 5px;
		    cursor: pointer;  
		    appearance: none;
		    -webkit-appearance: none; 
		    -moz-appearance: none;
		    background-color: white;
		    border: 1px solid #ccc;
		    position: relative;
		}
		
		select:hover {
		    background-color: #e9ecef;
		}
		
		select:focus {
		    outline: none;
		    border-color: #0056b3;
		    box-shadow: 0 0 5px rgba(0, 91, 187, 0.5);
		}
			
		.submain:hover {
         text-transform: uppercase;
         font-weight: bold;
         text-decoration: none;
        }
            </style>
            
             <!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='api key';//tawk to api key
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->
<body>
<%
if (session.getAttribute("name") == null) {
    response.sendRedirect("login.jsp");
}
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
%>

<nav><div class="nav_logo"><img src="logo.png " alt="icon" width="35px" height="30px"> IndiAir</div>
	<ul class="nav_links">
	<li class="link"><a href="index.jsp">Home</a></li>
	<li class="link"><a href="about.jsp">About</a></li>
	<li class="link"><a href="ViewTicket.jsp">View Ticket</a></li>
	<li class="link"><a href="UserProfile.jsp">Profile</a></li>	
         <h3><strong><span style="color:black">Welcome, </span> <%=session.getAttribute("name")%></strong></h3>
              <div class="logout">
            <a style="text-decoration:none" href="logout.jsp"><h3>Logout</h3></a>
             </div>
	</ul>
</nav>

<div class="div1">
            <span><h1><i> Where Do You Wanna Fly Today!!! </i></h1></span> 
            </div> 

        <div class="div2" style="text-align: center;">
             <strong><marquee class="auto">✈️ Fly Smart, Travel Easy! Book Your Next Journey with IndiAir Today! 🚀</marquee></strong>
             </div>
      
        <div class="div3">
       <% 
		    if (session.getAttribute("cancelMessage") != null) { 
		%>
		    <div id="cancelMessage" style="margin: 10px 0; font-size: 16px;">
		        <%= session.getAttribute("cancelMessage") %>
		    </div>
		    <script>
		        setTimeout(function() {
		            var messageDiv = document.getElementById("cancelMessage");
		            if (messageDiv) {
		                messageDiv.style.display = "none";
		            }
		        }, 5000);
		    </script>
		<%
		        session.removeAttribute("cancelMessage");
		    } 
		%>
    <form action="FlightBookingServlet" method="post">
        <label for="origin" style="position: relative; top: 26px; font-size:18px; display: inline-block;">Origin:</label>
        <select name="origin" id="origin" required>
        <option value="">📍 From</option>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/princedata?useSSL=false", "root", "Prince@1212");
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT location_name FROM Locations");
                    while (rs.next()) {
                        out.println("<option value='" + rs.getString("location_name") + "'>" + rs.getString("location_name") + "</option>");
                    }
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </select><br>

        <label for="destination" style="position: relative; top: 26px; font-size:18px; display: inline-block;">Destination:</label>
        <select name="destination" id="destination" required>
        <option value="">✈️ To</option>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/princedata?useSSL=false", "root", "Prince@1212");
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT location_name FROM Locations");
                    while (rs.next()) {
                        out.println("<option value='" + rs.getString("location_name") + "'>" + rs.getString("location_name") + "</option>");
                    }
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </select><br><br>

		<script>
        document.addEventListener("DOMContentLoaded", function () {
            let departureDate = document.getElementById("departureDate");
            let returnDate = document.getElementById("returnDate");

            let today = new Date().toISOString().split("T")[0];
            departureDate.setAttribute("min", today);
            
            departureDate.addEventListener("change", function () {
                if (departureDate.value) {
                    let nextDay = new Date(departureDate.value);
                    nextDay.setDate(nextDay.getDate() + 1); 
                    returnDate.setAttribute("min", nextDay.toISOString().split("T")[0]);
                }
            });
            returnDate.addEventListener("input", function () {
                if (returnDate.value && returnDate.value <= departureDate.value) {
                    alert("Return date must be at least one day after the departure date.");
                    returnDate.value = "";
                }
            });
        });
    </script>

		 <div style="display: flex; align-items: center; gap:-50px;">
	    <label for="departureDate" style="font-size: 18px;">Departure Date:</label>
	    <input type="date" id="departureDate" name="departureDate" required>
		</div>
		 <div style="display: flex; align-items: center; gap:-50px;">
        <label for="returnDate" style="font-size: 18px;">Return Date:</label>
        <input type="date" id="returnDate" name="returnDate"><br><br>
		</div>
		<script>
        document.addEventListener("DOMContentLoaded", function () {
            const maxPassengers = 9;
            
            function updateValidation() {
                let adults = parseInt(document.getElementById("adults").value) || 0;
                let children = parseInt(document.getElementById("children").value) || 0;
                let infants = parseInt(document.getElementById("infants").value) || 0;
                let totalPassengers = adults + children;

                let passengerError = document.getElementById("passengerError");
                passengerError.style.display = (totalPassengers > maxPassengers) ? "block" : "none";

                let infantError = document.getElementById("infantError");
                infantError.style.display = (infants > adults) ? "block" : "none";

                document.querySelector(".btn-right[onclick=\"changeNumber('adults', 1)\"]").disabled = totalPassengers >= maxPassengers;
                document.querySelector(".btn-right[onclick=\"changeNumber('children', 1)\"]").disabled = totalPassengers >= maxPassengers;
                document.querySelector(".btn-right[onclick=\"changeNumber('infants', 1)\"]").disabled = infants >= adults;

                document.querySelector(".btn-left[onclick=\"changeNumber('adults', -1)\"]").disabled = adults <= 1;
                document.querySelector(".btn-left[onclick=\"changeNumber('children', -1)\"]").disabled = children <= 0;
                document.querySelector(".btn-left[onclick=\"changeNumber('infants', -1)\"]").disabled = infants <= 0;
            }

            function changeNumber(id, change) {
                let input = document.getElementById(id);
                let currentValue = parseInt(input.value) || 0;
                let newValue = currentValue + change;

                if (id === "infants") {
                    let adults = parseInt(document.getElementById("adults").value) || 0;
                    if (newValue >= 0 && newValue <= adults) {
                        input.value = newValue;
                    }
                } else {
                    let adults = parseInt(document.getElementById("adults").value) || 0;
                    let children = parseInt(document.getElementById("children").value) || 0;
                    let totalPassengers = (id === "adults") ? newValue + children : newValue + adults;

                    if (newValue >= 0 && totalPassengers <= maxPassengers) {
                        input.value = newValue;
                    }
                }

                updateValidation();
            }

            updateValidation();

            window.changeNumber = changeNumber;
        });
    </script>
    <br>
	    <div class="input-container">
        <label for="adults" style="font-size: 18px;">Adults (12+ years):</label>
        <button type="button" class="btn-left" onclick="changeNumber('adults', -1)">-</button>
        <input type="number" name="adults" id="adults" value="1" min="1">
        <button type="button" class="btn-right" onclick="changeNumber('adults', 1)">+</button>
    </div>

    <div class="input-container">
        <label for="children" style="font-size: 18px;">Children (2-12 years):</label>
        <button type="button" class="btn-left" onclick="changeNumber('children', -1)">-</button>
        <input type="number" name="children" id="children" value="0" min="0">
        <button type="button" class="btn-right" onclick="changeNumber('children', 1)">+</button>
    </div>

    <p id="passengerError" class="error">*Maximum 9 passengers allowed (Adults + Children).</p>

    <div class="input-container">
        <label for="infants"style="font-size: 18px;">Infants (Under 2 years):</label>
        <button type="button" class="btn-left" onclick="changeNumber('infants', -1)">-</button>
        <input type="number" name="infants" id="infants" value="0" min="0">
        <button type="button" class="btn-right" onclick="changeNumber('infants', 1)">+</button>
    </div>

    <p id="infantError"  style="color: red; class="error">*Infants cannot exceed adults.</p>

    <br>
    
	 <label for="travelClass" style="position: relative; top: 26px; font-size:18px; display: inline-block;">Travel Class:</label>
        <select id="travelClass" name="travelClass" required>
        <option value="">💺 Select Class</option>
            <option value="Economy">Economy</option>
            <option value="Business">Business</option>
        </select><br><br>
		
		<script>
    function changeNumber(field, change) {
        var inputField = document.getElementById(field);
        var currentValue = parseInt(inputField.value);

        if (!isNaN(currentValue)) {
            var newValue = currentValue + change;
            if (newValue >= inputField.min) {
                inputField.value = newValue;
            }
        }
    }
</script>
		
        <button class="submain"   style="font-weight:bold"; type="submit"> Search for Flights</button>
    </form>     
    </div>     
             <br>
          <footer> Copyright © 2025 IndiAir All Rights Reserved</footer>    
</body>

</html>
