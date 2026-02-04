package com.prince.registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/UserProfileServlet")
public class UserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
HttpSession session = request.getSession(false);
        
        if (session == null || session.getAttribute("name") == null) {
            System.out.println("Session is null or 'name' attribute is not set.");
            response.sendRedirect("login.jsp");
            return;
        }

        // Retrieve username from the session
        String uname2 = (String) session.getAttribute("name");
        System.out.println("Session username (uname2): " + uname2);

        try {
            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/princedata?useSSL=false", "root", "Prince@1212");

            // Query to fetch user details from database
            String query = "SELECT fname, lname, uname2, uemail, umobile FROM users WHERE uname2 = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, uname2);

            // Execute the query and retrieve user details
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                // Debugging: Log user data retrieved
                System.out.println("User data retrieved from DB: ");
                System.out.println("First Name: " + rs.getString("fname"));
                System.out.println("Last Name: " + rs.getString("lname"));
                System.out.println("Username: " + rs.getString("uname2"));
                System.out.println("Email: " + rs.getString("uemail"));
                System.out.println("Mobile: " + rs.getString("umobile"));

                // Set the attributes to pass to JSP
                request.setAttribute("fname", rs.getString("fname"));
                request.setAttribute("lname", rs.getString("lname"));
                request.setAttribute("uname2", rs.getString("uname2"));
                request.setAttribute("uemail", rs.getString("uemail"));
                request.setAttribute("umobile", rs.getString("umobile"));

                // Forward to the profile page
                request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
            } else {
                // User not found in database
                System.out.println("User not found in database.");
                response.sendRedirect("login.jsp");
            }

            // Close database connection
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

}
