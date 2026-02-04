package com.prince.registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/ViewTicketServlet")
public class ViewTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String bookingId = request.getParameter("bookingId");

	        if (bookingId == null || bookingId.trim().isEmpty()) {
	            request.setAttribute("error", "Booking ID is required!");
	            RequestDispatcher rd = request.getRequestDispatcher("ViewTicket.jsp");
	            rd.forward(request, response);
	            return;
	        }

	        Connection con = null;
	        PreparedStatement pst = null;
	        ResultSet rs = null;

	        try {
	            // Database connection
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/princedata", "root", "Prince@1212");

	            // SQL query to fetch ticket details
	            String sql = "SELECT p.name, p.travel_class, p.total_price, p.payment_status, "
	                    + "f.flight_name, dep.location_name AS departure, dest.location_name AS destination, "
	                    + "f.departure_time, f.arrival_time "
	                    + "FROM passengers p "
	                    + "JOIN flights f ON p.flight_id = f.flight_id "
	                    + "JOIN locations dep ON f.departure_location_id = dep.location_id "
	                    + "JOIN locations dest ON f.destination_location_id = dest.location_id "
	                    + "WHERE p.booking_id = ?";


	            pst = con.prepareStatement(sql);
	            pst.setString(1, bookingId);
	            rs = pst.executeQuery();

	            if (rs.next()) {
	                request.setAttribute("ticketFound", true);
	                request.setAttribute("passengerName", rs.getString("name"));
	                request.setAttribute("flightName", rs.getString("flight_name"));
	                request.setAttribute("departure", rs.getString("departure"));
	                request.setAttribute("destination", rs.getString("destination"));
	                request.setAttribute("departureTime", rs.getString("departure_time"));
	                request.setAttribute("arrivalTime", rs.getString("arrival_time"));
	                request.setAttribute("travelClass", rs.getString("travel_class"));
	                request.setAttribute("totalPrice", rs.getString("total_price"));
	                request.setAttribute("paymentStatus", rs.getString("payment_status"));
	            } else {
	                request.setAttribute("ticketFound", false);
	                request.setAttribute("error", "No ticket found for Booking ID: " + bookingId);
	            }

	        } catch (Exception e) {
	            e.printStackTrace();  // This prints the full error to the server logs
	            request.setAttribute("error", "Database error: " + e.getMessage()); // Display the actual error
	        }finally {
	            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
	            try { if (pst != null) pst.close(); } catch (SQLException e) { e.printStackTrace(); }
	            try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
	        }

	        RequestDispatcher rd = request.getRequestDispatcher("ViewTicket.jsp");
	        rd.forward(request, response);	
	}

}
