package com.prince.registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.io.*;

@WebServlet("/DeleteFlightServlet")
public class DeleteFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String flightId = request.getParameter("flightId");
        if (flightId == null || flightId.isEmpty()) {
            out.println("<h1>Error: Flight ID is required.</h1>");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/princedata?useSSL=false", "root", "Prince@1212");
            PreparedStatement pstmt = conn.prepareStatement("Delete From Flights Where flight_id = ?");
            pstmt.setString(1, flightId);

            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("removeflight.jsp?message=Flight%20Removed%20Successfully&status=success");
            } else {
                response.sendRedirect("removeflight.jsp?message=Failed%20to%20Remove%20Flightt&status=error");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("removeflight.jsp?message=Database%20Error:%20" + e.getMessage() + "&status=error");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("removeflight.jsp?message=Driver%20Not%20Found&status=error");
        }
	}
}
