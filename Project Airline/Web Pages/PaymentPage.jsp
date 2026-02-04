<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Page</title>
    <link rel="icon" href="logo.png" type="image/x-icon">
    <style>
        body {
            background-image: url("Bg.jpg");
            background-attachment: fixed;
            background-size: cover;
            animation: changeBackground 12s infinite;
            color: #000;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            flex-direction: column;
            margin: 0;
            font-family: Arial, sans-serif;
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
            width: 600px;
            text-align: center;
        }
        .container {
            width: 40%;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin: auto;
        }
        h1 {
            color: #007BFF;
        }
        form {
            max-width: 100%;
            margin: auto;
            padding: 20px;
        }
        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }
        input, select, button {
            width: 50%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            padding: 12px;
            border-radius: 5px;
             width: 20%;
        }
        button:hover {
            background-color: #218838;
			text-transform: uppercase;
                font-weight: bold;
                text-decoration: none;  
        }
        .hidden {
            display: none;
        }
        .error {
            color: red;
            font-weight: bold;
            margin-top: 10px;
        }
        ::-webkit-scrollbar{
            width:0;
            }
            footer {
				  text-align: center;
				  padding: 10px 0;
				  font-size: 14px;
				  position: relative;
				  bottom: 0;
				  width: 100%;
				}
				
				.input-container {
    position: relative;
    display: flex;
    align-items: center;
}

.input-container .icon {
    position: absolute;
    left: 10px;
    width: 30px;
    height: 20px;
}

.input-container input {
    padding-left: 50px;
    height: 40px;
    width: 100%;
    border-radius: 5px;
    border: 1px solid #ccc;
}
    </style>
</head>
<body>

    <div class="login">
        <h1>Payment</h1>

        <%  

            HttpSession userSession = request.getSession(false);
            if (userSession == null || userSession.getAttribute("bookingId") == null) {
                response.sendRedirect("login.jsp"); 
                return;
            }


            String bookingId = (String) userSession.getAttribute("bookingId");
            Object totalPriceObj = userSession.getAttribute("totalPrice");
            Object departureFlightObj = userSession.getAttribute("departureFlightId");
            Object returnFlightObj = userSession.getAttribute("returnFlightId");


            double totalPrice = (totalPriceObj != null) ? Double.parseDouble(totalPriceObj.toString()) : 0.00;
            String departureFlightId = (departureFlightObj != null) ? departureFlightObj.toString() : "";
            String returnFlightId = (returnFlightObj != null && !"null".equals(returnFlightObj.toString())) ? returnFlightObj.toString() : "";

            boolean isRoundTrip = !returnFlightId.isEmpty();

            DecimalFormat df = new DecimalFormat("#,##0.00");

            String error = request.getParameter("error");
        %>

        <% if (error != null) { %>
            <p class="error">Error: <%= error %></p>
        <% } %>

        <h2>Total Price: ₹<%= df.format(totalPrice) %></h2>

        <form action="PaymentServlet" method="POST">
            
            <input type="hidden" name="bookingId" value="<%= bookingId %>">
            <input type="hidden" name="departureFlightId" value="<%= departureFlightId %>">
            <input type="hidden" name="returnFlightId" value="<%= returnFlightId %>">
            <input type="hidden" name="totalPrice" value="<%= totalPrice %>">
            <input type="hidden" name="isRoundTrip" value="<%= isRoundTrip %>">

            <label for="paymentMethod">Select Payment Method:</label>
            <select name="paymentMethod" id="paymentMethod" required>
                <option value="Debit Card">💳 Debit Card</option>
                <option value="Credit Card">💳 Credit Card</option>
                <option value="UPI"> ₹ UPI</option>
            </select>

            <div id="upiDetails" class="hidden">
                <label for="upiId">Enter UPI ID:</label>
                <div class="input-container">
    			<span class="icon">📲</span>
                <input type="text" name="upiId" id="upiId" placeholder="Enter UPI id">
                </div>
            </div>
<br>
            <button type="submit">Pay Now</button>
        </form>
    </div>

    <script>
        document.getElementById('paymentMethod').addEventListener('change', function() {
            document.getElementById('upiDetails').style.display = (this.value === 'UPI') ? 'block' : 'none';
        });
    </script>
 <footer> Copyright © 2025 IndiAir All Rights Reserved</footer>
</body>
</html>
