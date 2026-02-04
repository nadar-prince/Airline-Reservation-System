<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Flight Ticket</title>
    <link rel="icon" href="logo.png" type="image/x-icon">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            padding: 20px;
            margin: 0;
        }
        ::-webkit-scrollbar{
            width:0;
            }
        .container {
            width: 60%;
            margin: 20px auto;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
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
        .flight-info {
            border: 1px solid #ccc;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        .flight-info h3 {
            margin: 0;
            padding-bottom: 10px;
            border-bottom: 1px solid #ccc;
        }
        .details-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
        }
        .passenger-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .passenger-table th, .passenger-table td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }
        .passenger-table th {
            background-color: #f4f4f4;
        }
        .footer {
            margin-top: 20px;
            font-size: 14px;
            color: #777;
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
        .btn-print:hover{
        		text-transform: uppercase;
                font-weight: bold;
                text-decoration: none;
                background-color:darkgreen;
        }
        .btn-book {
            background-color: #008CBA;
            color: white;
        }
         .btn-book:hover {
         text-transform: uppercase;
                font-weight: bold;
                text-decoration: none;
                background-color:darkblue;
         }
        .btn-cancel {
            background-color: #f44336;
            color: white;
        }
        .btn-cancel:hover{
        text-transform: uppercase;
                font-weight: bold;
                text-decoration: none;
                background-color:darkred;
        }
        @media print {
            body {
                background-color: white;
                margin: 0;
                padding: 0;
            }
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
    <script>
        function printTicket() {
            window.print();
        }
        setTimeout(function() {
            window.location.href = "Feedback.jsp";
        }, 30000);
    </script>
</head>
<body>
<%
    if (session.getAttribute("bookingId") == null) { 
        response.sendRedirect("index.jsp");
        return;
    }
%>
<div class="container">
    <div class="header">
        <h3>PNR: <%= session.getAttribute("bookingId") %></h3>
        <h3>Travel Class: <%=session.getAttribute("travelClass") %></h3>
        <img src="logo.png" alt="IndiAir Logo">
    </div>

    <div class="flight-info">
        <h3>Flight Details</h3>
        <div class="details-grid">
            <div>
                <p><strong>Flight Name:</strong> <%= session.getAttribute("departureFlightName") %></p>
                <p><strong>Departure:</strong> <%= session.getAttribute("departureDeparture") %></p>
                <p><strong>Destination:</strong> <%= session.getAttribute("departureDestination") %></p>
                <p><strong>Departure Time:</strong> <%= session.getAttribute("departureDepartureTime") %></p>
                <p><strong>Arrival Time:</strong> <%= session.getAttribute("departureArrivalTime") %></p>
            </div>

            <%
                String returnFlightId = (String) session.getAttribute("returnFlightId");
                if (returnFlightId != null && !returnFlightId.trim().isEmpty() && !"null".equalsIgnoreCase(returnFlightId)) {
            %>
            <div>
                <p><strong>Return Flight:</strong> <%= session.getAttribute("returnFlightName") %></p>
                <p><strong>Departure:</strong> <%= session.getAttribute("returnDeparture") %></p>
                <p><strong>Destination:</strong> <%= session.getAttribute("returnDestination") %></p>
                <p><strong>Departure Time:</strong> <%= session.getAttribute("returnDepartureTime") %></p>
                <p><strong>Arrival Time:</strong> <%= session.getAttribute("returnArrivalTime") %></p>
            </div>
            <% } %>
        </div>
    </div>

    <h3>Passenger Details</h3>
    <table class="passenger-table">
        <tr>
            <th>Name</th>
            <th>Type</th>
            <th>Age</th>
            <th>Gender</th>
        </tr>
       <% 
            Object passengerData = session.getAttribute("passengerList");
            if (passengerData != null) { 
                List<Map<String, String>> passengerList = (List<Map<String, String>>) passengerData;
                for (Map<String, String> passenger : passengerList) { 
        %>
        <tr>
            <td><%= passenger.get("name") %></td>
            <td><%= passenger.get("type") %></td>
            <td><%= passenger.get("age") %></td>
            <td><%= passenger.get("gender") %></td>
        </tr>
        <% 
                }
            }
        %>
    </table>

    <h3>Payment Details</h3>
    <p><strong>Total Price:</strong> ₹<%= session.getAttribute("totalPrice") %></p>
    <p><strong>Payment Method:</strong> <%= session.getAttribute("paymentMethod") %></p>
    <p><strong>Status: Confirmed</strong></p>

    <div class="btn-container">
        <button class="btn btn-print" onclick="printTicket()">Print Ticket</button>
        <button class="btn btn-book" onclick="window.location.href='index.jsp'">Book Another Ticket</button>
        <form action="cancelBooking.jsp" method="post" style="display:inline;">
            <input type="hidden" name="bookingId" value="<%= session.getAttribute("bookingId") %>">
        <button class="btn btn-cancel" type="submit">Cancel Ticket</button>
        </form>
    </div>

    <div class="footer">
        <p><strong>Important Information:</strong></p>
        <p>To view your ticket, please ensure you have your PNR. Keep it noted for future reference. </p>
        <p>Please carry a valid photo ID proof for verification at the airport.</p>
        <p>Check-in counters close 60 minutes before departure.</p>
    </div>
</div>
 <footer> Copyright © 2025 IndiAir All Rights Reserved</footer>
</body>
</html>
