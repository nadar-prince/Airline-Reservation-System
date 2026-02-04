package com.prince.registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.sql.*;
import java.util.*;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;

        try {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("userId") == null || session.getAttribute("bookingId") == null) {
                response.sendRedirect("index.jsp");
                return;
            }

            Integer userId = (Integer) session.getAttribute("userId");
            String bookingId = (String) session.getAttribute("bookingId");
            String totalPriceStr = request.getParameter("totalPrice");
            String paymentMethod = request.getParameter("paymentMethod");
            String upiId = request.getParameter("upiId");

            if (totalPriceStr == null || totalPriceStr.isEmpty()) {
                response.sendRedirect("PaymentPage.jsp?error=missing_data");
                return;
            }

            double totalPrice;
            try {
                totalPrice = Double.parseDouble(totalPriceStr);
            } catch (NumberFormatException e) {
                response.sendRedirect("PaymentPage.jsp?error=invalid_price");
                return;
            }

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/princedata?useSSL=false", "root", "Prince@1212");

            String flightIdQuery = "SELECT departure_flight_id, return_flight_id FROM bookings WHERE booking_id = ?";
            int departureFlightId = -1, returnFlightId = 0;

            try (PreparedStatement ps = con.prepareStatement(flightIdQuery)) {
                ps.setString(1, bookingId);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        departureFlightId = rs.getInt("departure_flight_id");
                        returnFlightId = rs.getInt("return_flight_id");
                    }
                }
            }
            
            session.setAttribute("returnFlightId", returnFlightId > 0 ? String.valueOf(returnFlightId) : null);

            System.out.println("Booking ID: " + bookingId);
            System.out.println("Departure Flight ID: " + departureFlightId);
            System.out.println("Return Flight ID: " + returnFlightId);

            String flightDetailsQuery = "SELECT f.flight_name, dep.location_name AS departure, dest.location_name AS destination, " +
                    "f.departure_time, f.arrival_time " +
                    "FROM Flights f " +
                    "LEFT JOIN Locations dep ON f.departure_location_id = dep.location_id " +
                    "LEFT JOIN Locations dest ON f.destination_location_id = dest.location_id " +
                    "WHERE f.flight_id = ?";

            try (PreparedStatement ps = con.prepareStatement(flightDetailsQuery)) {
                ps.setInt(1, departureFlightId);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        session.setAttribute("departureFlightName", rs.getString("flight_name"));
                        session.setAttribute("departureDeparture", rs.getString("departure"));
                        session.setAttribute("departureDestination", rs.getString("destination"));
                        session.setAttribute("departureDepartureTime", rs.getString("departure_time"));
                        session.setAttribute("departureArrivalTime", rs.getString("arrival_time"));
                    }
                }
            }

            if (returnFlightId > 0) {
                try (PreparedStatement ps = con.prepareStatement(flightDetailsQuery)) {
                    ps.setInt(1, returnFlightId);
                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            session.setAttribute("returnFlightName", rs.getString("flight_name"));
                            session.setAttribute("returnDeparture", rs.getString("departure"));
                            session.setAttribute("returnDestination", rs.getString("destination"));
                            session.setAttribute("returnDepartureTime", rs.getString("departure_time"));
                            session.setAttribute("returnArrivalTime", rs.getString("arrival_time"));
                        }
                    }
                }
            }

            String insertPaymentSQL = "INSERT INTO payments (booking_id, user_id, departure_flight_id, return_flight_id, total_price, payment_method, payment_status, upi_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement ps = con.prepareStatement(insertPaymentSQL)) {
                ps.setString(1, bookingId);
                ps.setInt(2, userId);
                ps.setInt(3, departureFlightId);
                ps.setObject(4, returnFlightId > 0 ? returnFlightId : null, Types.INTEGER);
                ps.setDouble(5, totalPrice);
                ps.setString(6, paymentMethod);
                ps.setString(7, "Pending");
                ps.setObject(8, "UPI".equalsIgnoreCase(paymentMethod) && upiId != null && !upiId.isEmpty() ? upiId : null, Types.VARCHAR);

                if (ps.executeUpdate() <= 0) {
                    response.sendRedirect("PaymentPage.jsp?error=payment_failed");
                    return;
                }
            }

            List<Map<String, String>> passengerList = new ArrayList<>();
            String travelClass = "";
            String passengerQuery = "SELECT DISTINCT name, age, gender, type, travel_class FROM passengers WHERE booking_id = ?";

            try (PreparedStatement ps = con.prepareStatement(passengerQuery)) {
                ps.setString(1, bookingId);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        Map<String, String> passenger = new HashMap<>();
                        passenger.put("name", rs.getString("name"));
                        passenger.put("age", rs.getString("age"));
                        passenger.put("gender", rs.getString("gender"));
                        passenger.put("type", rs.getString("type"));
                        passengerList.add(passenger);
                        travelClass = rs.getString("travel_class");
                    }
                }
            }

            session.setAttribute("travelClass", travelClass);
            session.setAttribute("totalPrice", totalPrice);
            if (session.getAttribute("passengerList") == null) {
                session.setAttribute("passengerList", passengerList);
            }
            session.setAttribute("paymentMethod", paymentMethod);
            session.setAttribute("paymentStatus", "Pending");
            
            response.sendRedirect("Ticket.jsp");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("PaymentPage.jsp?error=database_error");
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
