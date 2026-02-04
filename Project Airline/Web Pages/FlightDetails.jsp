<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Flight Details</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="icon" href="logo.png" type="image/x-icon">
</head>
<style>
    body {
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
    .login {
        background-color: #fff;
        border-radius: 15px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        padding: 20px;
        text-align: center;
        width: 1000px;
    }
    h1 { color: cornflowerblue; }
    table { width: 100%; border-collapse: collapse; margin: 10px auto; }
    td, th { padding: 10px; text-align: center; border: 1px solid #ddd; }
    th { background-color: #f4f4f4; }
    .submitbtn {
        padding: 15px;
        border-radius: 10px;
        margin-top: 15px;
        border: none;
        color: white;
        cursor: pointer;
        background-color: cornflowerblue;
        width: 35%;
        font-size: 16px;
        font-weight: bold;
    }
    .submitbtn:hover { background-color:darkblue;
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

<div class="login">
    <h2>Available Flights</h2>
    <% 
        List<Map<String, Object>> departureFlights = (List<Map<String, Object>>) request.getAttribute("departureFlights");
        List<Map<String, Object>> returnFlights = (List<Map<String, Object>>) request.getAttribute("returnFlights");
        int adults = (Integer) request.getAttribute("adults");
        int children = (Integer) request.getAttribute("children");
        int infants = (Integer) request.getAttribute("infants");
        String travelClass = (String) request.getAttribute("travelClass");
        boolean isRoundTrip = (Boolean) request.getAttribute("isRoundTrip");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    %>

    <form action="PassengerDetails.jsp" method="POST">
        <h3>Departure Flights</h3>
        <table>
            <tr>
                <th>Select</th>
                <th>Flight Name</th>
                <th>Departure</th>
                <th>Destination</th>
                <th>Departure Time</th>
                <th>Arrival Time</th>
                <th>Price</th>
            </tr>
            <% for (Map<String, Object> flight : departureFlights) { %>
                <tr>
                    <td><input type="radio" name="selectedDepartureFlight" value="<%= flight.get("flight_id") %>" required 
                               data-price="<%= flight.get("price") %>"></td>
                    <td><%= flight.get("flight_name") %></td>
                    <td><%= flight.get("departure_location") %></td>
                    <td><%= flight.get("destination_location") %></td>
                    <td><%= sdf.format(flight.get("departure_time")) %></td>
                    <td><%= sdf.format(flight.get("arrival_time")) %></td>
                    <td>₹<%= String.format("%.2f", flight.get("price")) %></td>
                </tr>
            <% } %>
        </table>

        <% if (isRoundTrip && returnFlights != null && !returnFlights.isEmpty()) { %>
            <h3>Return Flights</h3>
            <table>
                <tr>
                    <th>Select</th>
                    <th>Flight Name</th>
                    <th>Departure</th>
                    <th>Destination</th>
                    <th>Departure Time</th>
                    <th>Arrival Time</th>
                    <th>Price</th>
                </tr>
                <% for (Map<String, Object> flight : returnFlights) { %>
                    <tr>
                        <td><input type="radio" name="selectedReturnFlight" value="<%= flight.get("flight_id") %>" 
                                   data-return-price="<%= flight.get("price") %>"></td>
                        <td><%= flight.get("flight_name") %></td>
                        <td><%= flight.get("departure_location") %></td>
                        <td><%= flight.get("destination_location") %></td>
                        <td><%= sdf.format(flight.get("departure_time")) %></td>
                        <td><%= sdf.format(flight.get("arrival_time")) %></td>
                        <td>₹<%= String.format("%.2f", flight.get("price")) %></td>
                    </tr>
                <% } %>
            </table>
        <% } %>

        <input type="hidden" name="price" id="price" value="0">
        <input type="hidden" name="returnPrice" id="returnPrice" value="0">
        <input type="hidden" name="adults" value="<%= adults %>">
        <input type="hidden" name="children" value="<%= children %>">
        <input type="hidden" name="infants" value="<%= infants %>">
        <input type="hidden" name="travelClass" value="<%= travelClass %>">
        <input type="hidden" name="isRoundTrip" value="<%= isRoundTrip %>">

        <div>
            <h3>Selected Travel Class: <%= travelClass %></h3>
            <p><strong>Passengers:</strong> 
                Adults: <%= adults %>, 
                Children: <%= children %>, 
                Infants: <%= infants %>
            </p>
        </div>

        <button type="submit" class="submitbtn">Proceed to Passenger Details</button>
    </form>

    <script>
        document.querySelectorAll('input[name="selectedDepartureFlight"]').forEach(radio => {
            radio.addEventListener('change', function () {
                document.getElementById('price').value = this.getAttribute('data-price');
            });
        });

        document.querySelectorAll('input[name="selectedReturnFlight"]').forEach(radio => {
            radio.addEventListener('change', function () {
                document.getElementById('returnPrice').value = this.getAttribute('data-return-price');
            });
        });
    </script>
</div>
 <footer> Copyright © 2025 IndiAir All Rights Reserved</footer>
</body>
</html>
