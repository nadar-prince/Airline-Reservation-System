package com.prince.registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/FlightBookingServlet")
public class FlightBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String origin = request.getParameter("origin");
        String destination = request.getParameter("destination");
        String departureDate = request.getParameter("departureDate");
        String returnDate = request.getParameter("returnDate");
        String travelClass = request.getParameter("travelClass");

        int adults = parsePassengerCount(request.getParameter("adults"));
        int children = parsePassengerCount(request.getParameter("children"));
        int infants = parsePassengerCount(request.getParameter("infants"));

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/princedata?useSSL=false", "root", "Prince@1212")) 
        {
            Class.forName("com.mysql.cj.jdbc.Driver");

            int originId = getLocationId(conn, origin);
            int destinationId = getLocationId(conn, destination);

            List<Map<String, Object>> departureFlights = getFlights(conn, originId, destinationId, departureDate, travelClass);
            List<Map<String, Object>> returnFlights = (returnDate != null && !returnDate.isEmpty())
                    ? getFlights(conn, destinationId, originId, returnDate, travelClass) : new ArrayList<>();

           
            String bookingId = generateBookingId();

            
            HttpSession session = request.getSession();
            session.setAttribute("bookingId", bookingId);

            
            request.setAttribute("departureFlights", departureFlights);
            request.setAttribute("returnFlights", returnFlights);
            request.setAttribute("adults", adults);
            request.setAttribute("children", children);
            request.setAttribute("infants", infants);
            request.setAttribute("travelClass", travelClass);
            request.setAttribute("isRoundTrip", !returnFlights.isEmpty());
            request.setAttribute("bookingId", bookingId); 

            request.getRequestDispatcher("FlightDetails.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    private int parsePassengerCount(String value) {
        return (value != null && !value.isEmpty()) ? Integer.parseInt(value) : 0;
    }

    private int getLocationId(Connection conn, String locationName) throws SQLException {
        String query = "SELECT location_id FROM Locations WHERE location_name = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, locationName);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() ? rs.getInt("location_id") : 0;
            }
        }
    }

    private List<Map<String, Object>> getFlights(Connection conn, int originId, int destinationId, String date, String travelClass) throws SQLException {
        String query = "SELECT f.flight_id, f.flight_name, l1.location_name AS departure_location, "
                + "l2.location_name AS destination_location, f.departure_time, f.arrival_time, f.price "
                + "FROM flights f "
                + "JOIN locations l1 ON f.departure_location_id = l1.location_id "
                + "JOIN locations l2 ON f.destination_location_id = l2.location_id "
                + "WHERE f.departure_location_id = ? AND f.destination_location_id = ? "
                + "AND DATE(f.departure_time) = ?";

        List<Map<String, Object>> flights = new ArrayList<>();
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, originId);
            ps.setInt(2, destinationId);
            ps.setString(3, date);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> flight = new HashMap<>();
                    double flightPrice = rs.getDouble("price");
                    double finalPrice = "Business".equalsIgnoreCase(travelClass) ? flightPrice * 1.5 : flightPrice;

                    flight.put("flight_id", rs.getInt("flight_id"));
                    flight.put("flight_name", rs.getString("flight_name"));
                    flight.put("departure_location", rs.getString("departure_location"));
                    flight.put("destination_location", rs.getString("destination_location"));
                    flight.put("departure_time", rs.getTimestamp("departure_time"));
                    flight.put("arrival_time", rs.getTimestamp("arrival_time"));
                    flight.put("price", finalPrice);
                    flight.put("travelClass", travelClass);

                    flights.add(flight);
                }
            }
        }
        return flights;
    }

    
    private String generateBookingId() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String timestamp = sdf.format(new Date(0));
        return "INDI" + timestamp;
    }
}