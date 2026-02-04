package com.prince.registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

@WebServlet("/UpdateDetailsServlet")
public class UpdateDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
	        if (session.getAttribute("name") == null) {
	            response.sendRedirect("login.jsp");
	            return;
	        }

	        String username = request.getParameter("username");
	        String fname = request.getParameter("fname");
	        String lname = request.getParameter("lname");
	        String email = request.getParameter("email");
	        String mobile = request.getParameter("mobile");

	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/princedata?useSSL=false", "root", "Prince@1212");

	            String query = "UPDATE users SET fname=?, lname=?, uemail=?, umobile=? WHERE uname2=?";
	            PreparedStatement ps = conn.prepareStatement(query);
	            ps.setString(1, fname);
	            ps.setString(2, lname);
	            ps.setString(3, email);
	            ps.setString(4, mobile);
	            ps.setString(5, username);

	            int rowsUpdated = ps.executeUpdate();
	            conn.close();

	            if (rowsUpdated > 0) {
	                session.setAttribute("message", "Profile updated successfully!");
	                response.sendRedirect("UserProfile.jsp");
	            } else {
	                session.setAttribute("message", "Update failed. Try again.");
	                response.sendRedirect("updatedetails.jsp");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect("error.jsp");
	        }
	}

}
