package com.prince.registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.*;
import java.sql.*;
/**
 * Servlet implementation class UserManageServlet
 */
@WebServlet("/UserManageServlet")
public class UserManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		        String operation = request.getParameter("operation");
		        String fname = request.getParameter("fname");
		        String lname = request.getParameter("lname");
		        String uname2 = request.getParameter("uname2");
		        String upwd = request.getParameter("upwd");
		        String uemail = request.getParameter("uemail");
		        String umobile = request.getParameter("umobile");

		        try {
		            Class.forName("com.mysql.cj.jdbc.Driver");
		            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/princedata?useSSL=false", "root", "Prince@1212");

		            if ("add".equalsIgnoreCase(operation)) {
		                String sql = "INSERT INTO users (fname, lname, uname2, upwd, uemail, umobile) VALUES (?, ?, ?, ?, ?, ?)";
		                PreparedStatement pstmt = conn.prepareStatement(sql);
		                pstmt.setString(1, fname);
		                pstmt.setString(2, lname);
		                pstmt.setString(3, uname2);
		                pstmt.setString(4, upwd);
		                pstmt.setString(5, uemail);
		                pstmt.setString(6, umobile);
		                int rowsInserted = pstmt.executeUpdate();
		                if (rowsInserted > 0) {
		                    response.sendRedirect("adduser.jsp?message=User%20Added%20Successfully&status=success");
		                } else {
		                    response.sendRedirect("adduser.jsp?message=Failed%20to%20Add%20User&status=error");
		                }
		                pstmt.close();
		                
		            }  else if ("search".equalsIgnoreCase(operation)) {
		                PreparedStatement pstmt = conn.prepareStatement("Select * From users Where uname2 = ?");
		                pstmt.setString(1, uname2);
		                ResultSet rs = pstmt.executeQuery();

		                if (rs.next()) {
		                   
		                    request.setAttribute("fname", rs.getString("fname"));
		                    request.setAttribute("lname", rs.getString("lname"));
		                    request.setAttribute("uname2", rs.getString("uname2"));
		                    request.setAttribute("upwd", rs.getString("upwd"));
		                    request.setAttribute("uemail", rs.getString("uemail"));
		                    request.setAttribute("umobile", rs.getString("umobile"));
		                    request.getRequestDispatcher("updateuser.jsp").forward(request, response);
		                } else {
		                    out.println("<h1>User not found!</h1>");
		                }

		                rs.close();
		                pstmt.close();
		            } else if ("update".equalsIgnoreCase(operation)) {
		                PreparedStatement pstmt = conn.prepareStatement("Update users Set fname = ?, lname = ?, upwd = ?, uemail = ?, umobile = ? Where uname2 = ?");
		                pstmt.setString(1, fname);
		                pstmt.setString(2, lname);
		                pstmt.setString(3, upwd);
		                pstmt.setString(4, uemail);
		                pstmt.setString(5, umobile);
		                pstmt.setString(6, uname2);
		                int rowsUpdated = pstmt.executeUpdate();
		                if (rowsUpdated > 0) {
		                    response.sendRedirect("updateuser.jsp?message=User%20Updated%20Successfully&status=success");
		                } else {
		                    response.sendRedirect("updateuser.jsp?message=Failed%20to%20Update%20User&status=error");
		                }
		                
		            } else if ("delete".equalsIgnoreCase(operation)) {
		                String sql = "DELETE FROM users WHERE uname2 = ?";
		                PreparedStatement pstmt = conn.prepareStatement(sql);
		                pstmt.setString(1, uname2);
		                int rowsDeleted = pstmt.executeUpdate();
		                if (rowsDeleted > 0) {
		                    response.sendRedirect("deleteuser.jsp?message=User%20Deleted%20Successfully&status=success");
		                } else {
		                    response.sendRedirect("deleteuser.jsp?message=Failed%20to%20Delete%20User&status=error");
		                }
		                pstmt.close();
		                
		            } else if ("view".equalsIgnoreCase(operation)) {
		                String sql = "SELECT * FROM users";
		                PreparedStatement pstmt = conn.prepareStatement(sql);
		                ResultSet rs = pstmt.executeQuery();
		                out.println("<h1>User Details</h1>");
		                out.println("<table border='1' cellpadding='5' cellspacing='0'><tr><th>ID</th><th>First Name</th><th>Last Name</th><th>Username</th><th>Password</th><th>Email</th><th>Mobile</th></tr>");
		                
		                // Displaying all users in the database
		                while (rs.next()) {
		                    out.println("<tr>");
		                    out.println("<td>" + rs.getInt("id") + "</td>");
		                    out.println("<td>" + rs.getString("fname") + "</td>");
		                    out.println("<td>" + rs.getString("lname") + "</td>");
		                    out.println("<td>" + rs.getString("uname2") + "</td>");
		                    out.println("<td>" + rs.getString("upwd") + "</td>");
		                    out.println("<td>" + rs.getString("uemail") + "</td>");
		                    out.println("<td>" + rs.getString("umobile") + "</td>");
		                    out.println("</tr>");
		                }
		                
		                out.println("</table>");
		                rs.close();
		                pstmt.close();
		            } else {
		                out.println("<h1>Invalid operation.</h1>");
		            }

		            conn.close();
		        } catch (Exception e) {
		            e.printStackTrace();
		            out.println("<h1>Error: " + e.getMessage() + "</h1>");
		        } finally {
		            out.close();
		        }
	}
}
