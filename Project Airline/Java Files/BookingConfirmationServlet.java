package com.prince.registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/BookingConfirmationServlet")
public class BookingConfirmationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	String bookingId = request.getParameter("bookingId");
        String departureFlightIdStr = request.getParameter("departureFlightId");
        String returnFlightIdStr = request.getParameter("returnFlightId");
        String totalPriceStr = request.getParameter("totalPrice");
        String travelClass = request.getParameter("travelClass");
        boolean isRoundTrip = Boolean.parseBoolean(request.getParameter("isRoundTrip"));

        if (bookingId == null || departureFlightIdStr == null || departureFlightIdStr.isEmpty() || totalPriceStr == null || totalPriceStr.isEmpty()) {
            response.getWriter().println("<h1>Error: Missing Booking ID, Flight ID, or Total Price!</h1>");
            return;
        }

        int departureFlightId = Integer.parseInt(departureFlightIdStr);
        int returnFlightId = isRoundTrip && returnFlightIdStr != null && !returnFlightIdStr.isEmpty() ? Integer.parseInt(returnFlightIdStr) : -1;
        double totalPrice = Double.parseDouble(totalPriceStr);

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp?error=session_expired");
            return;
        }

        List<Map<String, String>> passengers = new ArrayList<>();

        for (String type : new String[]{"adult", "child", "infant"}) {
            for (int i = 1; request.getParameter(type + "Name" + i) != null; i++) {
                Map<String, String> passenger = new HashMap<>();
                passenger.put("name", request.getParameter(type + "Name" + i));
                passenger.put("age", request.getParameter(type + "Age" + i));
                passenger.put("gender", request.getParameter(type + "Gender" + i));
                passenger.put("type", type.substring(0, 1).toUpperCase() + type.substring(1));
                passengers.add(passenger);
            }
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/princedata?useSSL=false", "root", "Prince@1212")) {
                
                String insertBookingSQL = "INSERT INTO bookings (booking_id, user_id, departure_flight_id, return_flight_id, total_passengers) VALUES (?, ?, ?, ?, ?)";
                
                try (PreparedStatement ps = conn.prepareStatement(insertBookingSQL)) {
                    ps.setString(1, bookingId);
                    ps.setInt(2, userId);
                    ps.setInt(3, departureFlightId);

                    if (isRoundTrip && returnFlightId != -1) {
                        ps.setInt(4, returnFlightId);
                    } else {
                        ps.setNull(4, Types.INTEGER);
                    }

                    ps.setInt(5, passengers.size()); 

                    int bookingResult = ps.executeUpdate();
                    if (bookingResult <= 0) {
                        response.getWriter().println("<h1>Error: Booking failed to insert!</h1>");
                        return;
                    }
                }

                insertPassengers(conn, passengers, bookingId, departureFlightId, travelClass, totalPrice);
                
                if (isRoundTrip && returnFlightId != -1) {
                    insertPassengers(conn, passengers, bookingId, returnFlightId, travelClass, totalPrice);
                }

                session.setAttribute("bookingId", bookingId);

                response.sendRedirect("PaymentPage.jsp?bookingId=" + bookingId + "&totalPrice=" + totalPrice);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h1>Error Saving Booking & Passenger Details</h1>");
            response.getWriter().println("<p>" + e.getMessage() + "</p>");
        }
    }

    private void insertPassengers(Connection conn, List<Map<String, String>> passengers, String bookingId, int flightId, String travelClass, double totalPrice) throws SQLException {
        String sql = "INSERT INTO passengers (booking_id, flight_id, name, age, gender, type, travel_class, total_price) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (Map<String, String> passenger : passengers) {
                ps.setString(1, bookingId);
                ps.setInt(2, flightId);
                ps.setString(3, passenger.get("name"));
                ps.setInt(4, Integer.parseInt(passenger.get("age")));
                ps.setString(5, passenger.get("gender"));
                ps.setString(6, passenger.get("type"));
                ps.setString(7, travelClass);
                ps.setDouble(8, totalPrice); 
                ps.executeUpdate();
            }
        }
    }
}
