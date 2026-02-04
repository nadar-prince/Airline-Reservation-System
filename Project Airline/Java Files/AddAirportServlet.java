package com.prince.registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.sql.*;

@WebServlet("/AddAirportServlet")
public class AddAirportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String locationName = request.getParameter("locationName");

        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/princedata?useSSL=false", "root", "Prince@1212");
            PreparedStatement stmt = con.prepareStatement("Insert into Locations (location_name) VALUES (?)");
            stmt.setString(1, locationName);
          int rowsInserted=stmt.executeUpdate();

            if (rowsInserted > 0) {
                response.sendRedirect("addAirport.jsp?message=Airport%20Added%20Successfully&status=success");
            } else {
                response.sendRedirect("addAirport.jsp?message=Failed%20to%20Add%20Airport&status=error");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("addAirport.jsp?message=Database%20Error:%20" + e.getMessage() + "&status=error");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("addAirport.jsp?message=Driver%20Not%20Found&status=error");
        }
    }
}

