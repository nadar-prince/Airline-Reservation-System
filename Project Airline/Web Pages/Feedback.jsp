<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Feedback Page</title>
    <link rel="icon" href="logo.png" type="image/x-icon">
    <style>
        body {
            background-image: url("Bg.jpg");
            background-attachment: fixed;
            background-size: 100% 100%;
            animation: changeBackground 12s infinite;
            color: #000000;
            display: flex;
            align-items: center;
            justify-content: center;
            line-height: 1.6;
            min-height: 100vh;
            flex-direction: column;
            margin: 0;
        }
        @keyframes changeBackground {
            0% { background-image: url('Bg.jpg'); }
            33% { background-image: url('bg2.jpg'); }
            66% { background-image: url('bg3.jpg'); }
            100% { background-image: url('bg4.jpg'); }
        }
        .rating {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            margin: 10px 0;
        }
        .rating label {
            font-weight: bold;
        }
        .rating-options {
            display: flex;
            gap: 10px;
            margin-top: 5px;
        }
        .submit-btn {
            margin-top: 10px;
            padding: 10px 20px;
            background-color: #FFD700;
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }
        .goback {
            margin-top: 10px;
            padding: 10px 20px;
            background-color: red;
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }
        .login {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
            transition: transform 0.2s;
            width: 500px;
            text-align: center;
        }
        .message {
            font-size: 16px;
            font-weight: bold;
            padding: 10px;
            margin: 10px auto;
            width: 80%;
            text-align: center;
            border-radius: 5px;
        }
        .success {
            color: green;
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
        }
        .error {
            color: red;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
        }
        .close-btn {
		    position: absolute;
		    top: 10px;
		    right: 15px;
		    font-size: 24px;
		    font-weight: bold;
		    cursor: pointer;
		    color: black;
		    background: none;
		    border: none;
		}
		.close-btn:hover {
		    color: red;
		}
		.login {
		    position: relative; /* Ensures the close button is positioned inside the login box */
		    background-color: #fff;
		    border-radius: 15px;
		    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
		    padding: 20px;
		    transition: transform 0.2s;
		    width: 500px;
		    text-align: center;
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
        // Redirect to Feedback.jsp after 5 seconds (5000 milliseconds)
        setTimeout(function() {
            window.location.href = "index.jsp";
        }, 30000);
    </script>
</head>
<body>
    <div class="feedback-container">
        <div class="login">
            <h2>💬 Feedback</h2>
            <span class="close-btn" onclick="closePage()">×</span>
            <script> function closePage() {
                window.location.href = "index.jsp"; // Redirects to index.jsp when clicked
            }
			 </script>
            <% 
                String message = request.getParameter("message");
                String status = request.getParameter("status");
                if (message != null && status != null) { 
            %>
            <div class="message <%= status %>"><%= message %></div>
            <% } %>

            <p>Please share your flight booking experience</p>
            <form action="FeedbackServlet" method="post">
                <div class="rating">
                    <label>1. Interface is intuitive and easy to use.</label>
                    <div class="rating-options">
                        <input type="radio" name="rating1" value="1" required> 1
                        <input type="radio" name="rating1" value="2"> 2
                        <input type="radio" name="rating1" value="3"> 3
                        <input type="radio" name="rating1" value="4"> 4
                        <input type="radio" name="rating1" value="5"> 5
                    </div>
                </div>

                <div class="rating">
                    <label>2. Search Response is instant.</label>
                    <div class="rating-options">
                        <input type="radio" name="rating2" value="1" required> 1
                        <input type="radio" name="rating2" value="2"> 2
                        <input type="radio" name="rating2" value="3"> 3
                        <input type="radio" name="rating2" value="4"> 4
                        <input type="radio" name="rating2" value="5"> 5
                    </div>
                </div>

                <div class="rating">
                    <label>3. Range of Flights availability.</label>
                    <div class="rating-options">
                        <input type="radio" name="rating3" value="1" required> 1
                        <input type="radio" name="rating3" value="2"> 2
                        <input type="radio" name="rating3" value="3"> 3
                        <input type="radio" name="rating3" value="4"> 4
                        <input type="radio" name="rating3" value="5"> 5
                    </div>
                </div>

                <div class="rating">
                    <label>4. Payment process is smooth.</label>
                    <div class="rating-options">
                        <input type="radio" name="rating4" value="1" required> 1
                        <input type="radio" name="rating4" value="2"> 2
                        <input type="radio" name="rating4" value="3"> 3
                        <input type="radio" name="rating4" value="4"> 4
                        <input type="radio" name="rating4" value="5"> 5
                    </div>
                </div>

                <div class="rating">
                    <label>5. After Booking Assistance.</label>
                    <div class="rating-options">
                        <input type="radio" name="rating5" value="1" required> 1
                        <input type="radio" name="rating5" value="2"> 2
                        <input type="radio" name="rating5" value="3"> 3
                        <input type="radio" name="rating5" value="4"> 4
                        <input type="radio" name="rating5" value="5"> 5
                    </div>
                </div>

                <div class="rating">
                    <label>6. Overall Booking Experience.</label>
                    <div class="rating-options">
                        <input type="radio" name="rating6" value="1" required> 1
                        <input type="radio" name="rating6" value="2"> 2
                        <input type="radio" name="rating6" value="3"> 3
                        <input type="radio" name="rating6" value="4"> 4
                        <input type="radio" name="rating6" value="5"> 5
                    </div>
                </div>

                <label>Any other suggestions:</label><br>
                <textarea name="suggestions" rows="4" cols="30" placeholder="Write your suggestions here..."></textarea>
                <br>
                <a href="index.jsp" style="text-decoration: none" class="submit-btn">Submit Feedback</a>
            </form>
        </div>
    </div>
     <footer> Copyright © 2025 IndiAir All Rights Reserved</footer>
</body>
</html>
