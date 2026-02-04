package com.prince.registration;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.sql.*;
@WebServlet("/updateFlightServlet")
public class updateFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int flightId = Integer.parseInt(request.getParameter("flightId"));
        String flightName = request.getParameter("flightName");
        String departure = request.getParameter("departure");
        String destination = request.getParameter("destination");
        String departureTime = request.getParameter("departureTime");
        String arrivalTime = request.getParameter("arrivalTime");
        String priceStr = request.getParameter("price");

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/princedata?useSSL=false", "root", "Prince@1212")) 
        {
             PreparedStatement stmt = conn.prepareStatement("UPDATE Flights SET " +
										                     "flight_name = IFNULL(?, flight_name), " +
										                     "departure_location_id = IFNULL(?, departure_location_id), " +
										                     "destination_location_id = IFNULL(?, destination_location_id), " +
										                     "departure_time = IFNULL(?, departure_time), " +
										                     "arrival_time = IFNULL(?, arrival_time), " +
										                     "price = IFNULL(?, price) " +
										                     "WHERE flight_id = ?");

            stmt.setString(1, flightName.isEmpty() ? null : flightName);
            stmt.setString(2, departure.isEmpty() ? null : departure);
            stmt.setString(3, destination.isEmpty() ? null : destination);
            stmt.setString(4, departureTime.isEmpty() ? null : departureTime);
            stmt.setString(5, arrivalTime.isEmpty() ? null : arrivalTime);
            stmt.setDouble(6, priceStr.isEmpty() ? 0 : Double.parseDouble(priceStr));
            stmt.setInt(7, flightId);
            int rowsInserted=stmt.executeUpdate();
 		   if (rowsInserted > 0) {
                response.sendRedirect("updateflight.jsp?message=Flight%20Updated%20Successfully&status=success");
            } else {
                response.sendRedirect("updateflight.jsp?message=Failed%20to%20Update%20Flight&status=error");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("updateflight.jsp?message=Database%20Error:%20" + e.getMessage() + "&status=error");
        }
	}

}
