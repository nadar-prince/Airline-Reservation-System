package com.prince.registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        if (session.getAttribute("name") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = (String) session.getAttribute("name");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!newPassword.equals(confirmPassword)) {
            session.setAttribute("message", "New passwords do not match!");
            response.sendRedirect("changepassword.jsp");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/princedata?useSSL=false", "root", "Prince@1212");

            // Verify current password
            String query = "SELECT upwd FROM users WHERE uname2=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String dbPassword = rs.getString("upwd");
                if (!dbPassword.equals(currentPassword)) {
                    session.setAttribute("message", "Current password is incorrect!");
                    response.sendRedirect("changepassword.jsp");
                    return;
                }
            } else {
                session.setAttribute("message", "User not found!");
                response.sendRedirect("changepassword.jsp");
                return;
            }

            // Update password
            query = "UPDATE users SET upwd=? WHERE uname2=?";
            ps = conn.prepareStatement(query);
            ps.setString(1, newPassword);
            ps.setString(2, username);
            int updated = ps.executeUpdate();

            conn.close();

            if (updated > 0) {
                session.setAttribute("message", "Password changed successfully!");
                response.sendRedirect("UserProfile.jsp");
            } else {
                session.setAttribute("message", "Failed to change password!");
                response.sendRedirect("changepassword.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("message", "Error occurred. Try again.");
            response.sendRedirect("changepassword.jsp");
        }
	}

}
