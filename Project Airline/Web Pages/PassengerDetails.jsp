<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, jakarta.servlet.*, jakarta.servlet.http.*" %>

<html>
<head>
    <title>Passenger Details</title>
    <link rel="icon" href="logo.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
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

        h1 {
            color: cornflowerblue;
        }

        label {
            display: block;
            text-align: left;
            font-weight: bold;
            margin: 10px 0 5px;
            color: #555;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
            box-sizing: border-box;
        }

        .submitbtn {
            padding: 12px;
            border-radius: 10px;
            border: none;
            color: white;
            cursor: pointer;
            background-color: cornflowerblue;
            width: 100%;
            font-size: 16px;
            font-weight: bold;
            transition: background 0.3s;
        }

        .submitbtn:hover {
            background-color:darkblue;
			text-transform: uppercase;
                font-weight: bold;
                text-decoration: none;  
        }
        .error-message {
    color: red;
    font-size: 14px;
    margin-top: 5px;
    display: none; /* Initially hidden */
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
				
				.input-container i {
				    position: absolute;
				    left: 10px;
				    top: 22%; 
				    font-size: 16px;
				    color: #888;
				}
				
				.input-container input {
				    padding-left: 35px; 
				    width: 100%;
				    height: 40px;
				    border: 1px solid #ccc;
				    border-radius: 5px;
				}
						.input-box {
		    position: relative;
		    display: flex;
		    align-items: center;
		}
		
		.input-box i {
		    position: absolute;
		    left: 10px;
		    font-size: 16px;
		    color: gray;
		}
		
		.input-box .age-badge {
		    position: absolute;
		    left: 7px;
		    background: #888;
		    color: white;
		    padding: 5px 8px;
		    border-radius: 10px;
		    top: 18%;     
		    font-size: 9px;
		    font-weight: bold;
		}
		
		.input-box input {
		    padding-left: 45px; 
		    height: 40px;
		    width: 100%;
		    border-radius: 5px;
		    border: 1px solid #ccc;
		}
    </style>
   <script>
    function validateName(input) {
        let value = input.value;
        value = value.replace(/[^a-zA-Z\s]/g, '');
        value = value.replace(/\s{2,}/g, ' '); 
        value = value.replace(/\b\w/g, c => c.toUpperCase());

        input.value = value;
    }

    function validateAge(input, type) {
        let age = parseInt(input.value);
        let errorDiv = input.nextElementSibling; 
        let minAge, maxAge, errorMessage;

        if (type === "adult") {
            minAge = 12;
            maxAge = 100;
            errorMessage = "Adults must be 12 years or older.";
        } else if (type === "child") {
            minAge = 2;
            maxAge = 11;
            errorMessage = "Children must be between 2 and 11 years old.";
        } else if (type === "infant") {
            minAge = 0;
            maxAge = 1;
            errorMessage = "Infants must be under 2 years old.";
        } else {
            return; 
        }

        if (isNaN(age) || age < minAge || age > maxAge) {
            input.style.border = "1px solid red"; 
            errorDiv.innerHTML = errorMessage; 
            errorDiv.style.display = "block"; 

            setTimeout(() => {
                errorDiv.style.display = "none"; 
                input.style.border = "1px solid #ddd"; 
            }, 3000);

            input.value = ''; 
        } else {
            errorDiv.style.display = "none"; 
            input.style.border = "1px solid #ddd"; 
        }
    }
</script>


</head>
<body>
    <div class="login">
        <h1>Passenger Details</h1>

        <form action="BookingConfirmationServlet" method="POST">
            <% 
                HttpSession userSession = request.getSession();
                String bookingId = "INDI" + System.currentTimeMillis(); 
                userSession.setAttribute("bookingId", bookingId);

                String departureFlightId = request.getParameter("selectedDepartureFlight");
                String returnFlightId = request.getParameter("selectedReturnFlight");
                String priceParam = request.getParameter("price");
                String returnPriceParam = request.getParameter("returnPrice");
                String travelClass = request.getParameter("travelClass");
                boolean isRoundTrip = "true".equals(request.getParameter("isRoundTrip"));

                int adults = Integer.parseInt(request.getParameter("adults"));
                int children = Integer.parseInt(request.getParameter("children"));
                int infants = Integer.parseInt(request.getParameter("infants"));

                double finalPricePerTicket = Double.parseDouble(priceParam);
                double returnPricePerTicket = (isRoundTrip && returnPriceParam != null && !returnPriceParam.isEmpty()) ? Double.parseDouble(returnPriceParam) : 0;

                double totalPrice = (adults * finalPricePerTicket) + (children * finalPricePerTicket) + (infants * (finalPricePerTicket * 0.5));
                if (isRoundTrip) {
                    totalPrice += (adults * returnPricePerTicket) + (children * returnPricePerTicket) + (infants * (returnPricePerTicket * 0.5));
                }

                userSession.setAttribute("totalPrice", String.format("%.2f", totalPrice));
                userSession.setAttribute("departureFlightId", departureFlightId);
                if (isRoundTrip) {
                    userSession.setAttribute("returnFlightId", returnFlightId);
                }
            %>

            <h2>PNR: <%= bookingId %></h2>
            <h3>Selected Travel Class: <%= travelClass %></h3>
            <h3>Passengers: Adults: <%= adults %>, Children: <%= children %>, Infants: <%= infants %></h3>

            <input type="hidden" name="bookingId" value="<%= bookingId %>">
            <input type="hidden" name="departureFlightId" value="<%= departureFlightId %>">
            <% if (isRoundTrip) { %>
                <input type="hidden" name="returnFlightId" value="<%= returnFlightId %>">
            <% } %>
            <input type="hidden" name="totalPrice" value="<%= totalPrice %>">
            <input type="hidden" name="travelClass" value="<%= travelClass %>">
            <input type="hidden" name="isRoundTrip" value="<%= isRoundTrip %>">

            <% for (int i = 1; i <= adults; i++) { %>
                <h3>Adult <%= i %></h3>
                <label>Full Name:</label>
                <div class="input-container">
   				 <i class="fa fa-user"></i>
                <input type="text" name="adultName<%= i %>" placeholder="Enter your name" required oninput="validateName(this)">
                </div>
               
                <label>Age:</label>
                <div class="input-box">
    			<span class="age-badge">12+</span>
                <input type="number" name="adultAge<%= i %>" placeholder="Enter your age" onblur="validateAge(this, 'adult')" required>
               	 <div class="error-message" style="color: red; display: none;"></div>
                </div>
               
                <label>Gender:</label>
                <select name="adultGender<%= i %>" required>
                    <option value="">⚤ Select Gender</option>
                    <option value="Male">♂ Male</option>
                    <option value="Female">♀ Female</option>
                    <option value="Other">⚧ Other</option>
                </select>
            <% } %>

            <% for (int i = 1; i <= children; i++) { %>
                <h3>Child <%= i %></h3>
                <label>Full Name:</label>
                <div class="input-container">
   				 <i class="fa fa-user"></i>
                <input type="text" name="childName<%= i %>" placeholder="Enter your name" required oninput="validateName(this)">
                </div>
                
                <label>Age:</label>
                <div class="input-box">
    			<span class="age-badge">2+</span>
                <input type="number" name="childAge<%= i %>" placeholder="Enter your age"  onblur="validateAge(this, 'child')" required>
                <div class="error-message" style="color: red; display: none;"></div>
                </div>
                
                <label>Gender:</label>
                <select name="childGender<%= i %>" required>
                    <option value="">⚤ Select Gender</option>
                    <option value="Male">♂ Male</option>
                    <option value="Female">♀ Female</option>
                    <option value="Other">⚧ Other</option>
                </select>
            <% } %>

            <% for (int i = 1; i <= infants; i++) { %>
                <h3>Infant <%= i %></h3>
                <label>Full Name:</label>
                <div class="input-container">
   				 <i class="fa fa-user"></i>
                <input type="text" name="infantName<%= i %>" placeholder="Enter your name" required oninput="validateName(this)">
                </div>
                
                <label>Age:</label>
                <div class="input-box">
    			<span class="age-badge">1+</span>
                <input type="number" name="infantAge<%= i %>" placeholder="Enter your age" onblur="validateAge(this, 'infant')" required>
               <div class="error-message" style="color: red; display: none;"></div>
                </div>
                
                <label>Gender:</label>
                <select name="infantGender<%= i %>" required>
                    <option value="">⚤ Select Gender</option>
                    <option value="Male">♂ Male</option>
                    <option value="Female">♀ Female</option>
                    <option value="Other">⚧ Other</option>
                </select>
            <% } %>

            <h2>Total Price: ₹<%= String.format("%.2f", totalPrice) %></h2>

            <button type="submit" class="submitbtn">Proceed to Payment</button>
        </form>
    </div>
     <footer> Copyright © 2025 IndiAir All Rights Reserved</footer>
</body>
</html>
