package com.prince.registration;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/addFlightServlet")
public class addFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String flightName = request.getParameter("flightName");
		int departureId = Integer.parseInt(request.getParameter("departure"));
		int destinationId = Integer.parseInt(request.getParameter("destination"));
		String departureTime = request.getParameter("departureTime");
		String arrivalTime = request.getParameter("arrivalTime");
		double price = Double.parseDouble(request.getParameter("price"));

	        try{
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/princedata?useSSL=false", "root", "Prince@1212"); 
	        PreparedStatement stmt = con.prepareStatement("Insert Into Flights (flight_name, departure_location_id, destination_location_id, departure_time, arrival_time, price) VALUES (?, ?, ?, ?, ?, ?)");
	        			stmt.setString(1, flightName);
	        		    stmt.setInt(2, departureId);
	        		    stmt.setInt(3, destinationId);
	        		    stmt.setString(4, departureTime);
	        		    stmt.setString(5, arrivalTime);
	        		    stmt.setDouble(6, price);
	        		   int rowsInserted=stmt.executeUpdate();
	        		   if (rowsInserted > 0) {
	                       response.sendRedirect("addflight.jsp?message=Flight%20Added%20Successfully&status=success");
	                   } else {
	                       response.sendRedirect("addflight.jsp?message=Failed%20to%20Add%20Flight&status=error");
	                   }

	               } catch (SQLException e) {
	                   e.printStackTrace();
	                   response.sendRedirect("addflight.jsp?message=Database%20Error:%20" + e.getMessage() + "&status=error");
	               } catch (ClassNotFoundException e) {
	                   e.printStackTrace();
	                   response.sendRedirect("addflight.jsp?message=Driver%20Not%20Found&status=error");
	               }
       }
	}

