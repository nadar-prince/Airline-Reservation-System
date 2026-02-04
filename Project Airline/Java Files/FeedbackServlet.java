package com.prince.registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
	            int rating1 = Integer.parseInt(request.getParameter("rating1"));
	            int rating2 = Integer.parseInt(request.getParameter("rating2"));
	            int rating3 = Integer.parseInt(request.getParameter("rating3"));
	            int rating4 = Integer.parseInt(request.getParameter("rating4"));
	            int rating5 = Integer.parseInt(request.getParameter("rating5"));
	            int rating6 = Integer.parseInt(request.getParameter("rating6"));
	            String suggestions = request.getParameter("suggestions");
	            String FEEDBACK = "INSERT INTO feedback (rating1, rating2, rating3, rating4, rating5, rating6, suggestions) VALUES (?, ?, ?, ?, ?, ?, ?)";
	            try { 
	            	Class.forName("com.mysql.cj.jdbc.Driver");
	        		  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/princedata","root","Prince@1212");
	                 PreparedStatement stmt = con.prepareStatement(FEEDBACK);
	                stmt.setInt(1, rating1);
	                stmt.setInt(2, rating2);
	                stmt.setInt(3, rating3);
	                stmt.setInt(4, rating4);
	                stmt.setInt(5, rating5);
	                stmt.setInt(6, rating6);
	                stmt.setString(7, suggestions);
	                int result = stmt.executeUpdate();
	                if (result > 0) {
	                	response.sendRedirect("Feedback.jsp?message=Feedback%20Submitted%20Successfully&status=success");
	                } else {
	                	response.sendRedirect("Feedback.jsp?message=Failed%20to%20Submit%20Feedback&status=error");
	                }
	         }catch(SQLException e)
	            {
	        	 e.printStackTrace();
	            }
	     }catch(Exception e)
		 {
	    	 e.printStackTrace();
		 }
	}
}
