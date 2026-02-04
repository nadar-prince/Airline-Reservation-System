<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Ticket</title>
    <link rel="icon" href="logo.png" type="image/x-icon">
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
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .header img {
            width: 80px;
        }
        .ticket {
            border: 1px solid #ccc;
            padding: 15px;
            border-radius: 10px;
            background-color: #fff;
        }
        .ticket h3 {
            margin: 0;
            padding-bottom: 10px;
            border-bottom: 1px solid #ccc;
            text-align: center;
        }
        .details-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
        }
        .label {
            font-weight: bold;
            color: #555;
        }
        .btn-container {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }
        .btn {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .btn-print {
            background-color: #4CAF50;
            color: white;
        }
        .btn-print:hover {
            background-color: #45a049;
        }
        .btn-cancel {
            background-color: #f44336;
            color: white;
        }
        @media print {
            .btn-container, .btn {
                display: none !important;
            }
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
        <h2>View Your Ticket</h2>
        <form class="search-form" method="GET" action="ViewTicketServlet">
            <label for="bookingId"><strong>Enter PNR:</strong></label>
            <input type="text" name="bookingId" id="bookingId" required>
            <button type="submit" class="btn btn-print">Search</button>
        </form>
        <% if (request.getAttribute("ticketFound") != null && (boolean) request.getAttribute("ticketFound")) { %>
            <div class="ticket">
                <h3>Ticket Details</h3>
                <p><span class="label">Flight Name:</span> <%= request.getAttribute("flightName") %></p>
                <p><span class="label">Departure:</span> <%= request.getAttribute("departure") %></p>
                <p><span class="label">Destination:</span> <%= request.getAttribute("destination") %></p>
                <p><span class="label">Departure Time:</span> <%= request.getAttribute("departureTime") %></p>
                <p><span class="label">Arrival Time:</span> <%= request.getAttribute("arrivalTime") %></p>
                <p><span class="label">Passenger Name:</span> <%= request.getAttribute("passengerName") %></p>
                <p><span class="label">Travel Class:</span> <%= request.getAttribute("travelClass") %></p>
                <p><span class="label">Total Price:</span> ₹<%= request.getAttribute("totalPrice") %></p>
                <button class="btn btn-print" onclick="window.print()">Print Ticket</button>
                <form action="cancelBooking.jsp" method="post" style="display:inline;">
            <input type="hidden" name="bookingId" value="<%= session.getAttribute("bookingId") %>">
            <button class="btn btn-cancel" type="submit">Cancel Ticket</button>
        </form>
            </div>
        <% } else if (request.getAttribute("error") != null) { %>
            <h3 style="color:red;"><%= request.getAttribute("error") %></h3>
        <% } %>
    </div>
     <footer> Copyright © 2025 IndiAir All Rights Reserved</footer>
</body>
</html>