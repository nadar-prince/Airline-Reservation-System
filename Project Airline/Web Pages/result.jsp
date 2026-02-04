<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Best Fare and Cheap Flights Only in IndiAir</title>
<link rel="icon" href="logo.png" type="image/x-icon">
</head>
<style>
         body{
            background-image:url("Bg.jpg");
            background-attachment:fixed;
            background-size: 100% 100%;
            animation: changeBackground 12s infinite;
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
            <img src="logo.png " alt="icon" width="60px" height="60px">
            <span><h1><i> Welcome To IndiAir </i></h1></span> 
            </div> 
            <div class="div2">
                <h2>Booking Results</h2>
                <form> 
                     <h2 class="heading">Booking Confirmation</h2>

        <div class="confirmation-details">
            <p><span class="label">Departure:</span><span class="value"><%= request.getAttribute("departure") %></span></p>
            <p><span class="label">Destination:</span><span class="value"><%= request.getAttribute("destination") %></span></p>
            <p><span class="label">Travel Date:</span><span class="value"><%= request.getAttribute("travelDate") %></span></p>
            <p><span class="label">Return Date:</span><span class="value"><%= request.getAttribute("returnDate") != null ? request.getAttribute("returnDate") : "N/A" %></span></p>
            <p><span class="label">Adults:</span><span class="value"><%= request.getAttribute("adults") %></span></p>
            <p><span class="label">Children:</span><span class="value"><%= request.getAttribute("children") %></span></p>
            <p><span class="label">Infants:</span><span class="value"><%= request.getAttribute("infants") %></span></p>
            <p><span class="label">Travel Class:</span><span class="value"><%= request.getAttribute("travelClass") %></span></p>
        </div>

        <div>
            <p>Your booking has been successfully processed. Thank you for choosing our service!</p>
            <a href="index.jsp">Go back to the homepage</a>
        </div>
                    
                </form>
            </div>
             <footer> © IndiAir All Rights Reserved</footer>
</body>
</html>