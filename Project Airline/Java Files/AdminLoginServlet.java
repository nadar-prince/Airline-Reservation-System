package com.prince.registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;
import java.io.IOException;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		String username=request.getParameter("username");
 		String password=request.getParameter("password");
 		HttpSession session =request.getSession(); 
 		RequestDispatcher dispatcher =null;
 		
 		if(username==null || username.equals("")) {
 			request.setAttribute("status", "invalidusername");
 			dispatcher=request.getRequestDispatcher("admin.jsp");
 			dispatcher.forward(request, response);
 			}
 		
 		if(password==null || password.equals("")) {
 			request.setAttribute("status", "invalidpassword");
 			dispatcher=request.getRequestDispatcher("admin.jsp");
 			dispatcher.forward(request, response);
 			}
 		
 		try {
 			Class.forName("com.mysql.cj.jdbc.Driver");
 			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/princedata?useSSL=false","root","Prince@1212");
 			PreparedStatement pst=con.prepareStatement("select * from admin where username=? and pwd=?");
 			pst.setString(1, username);
 			pst.setString(2, password);
 			
 			ResultSet rs = pst.executeQuery();
 		    if (rs.next()) {
 		        // User found, proceed to dashboard
 		        session.setAttribute("username", username); // Optional: Set session attribute
 		        response.sendRedirect("admindash.jsp?registration=success");
 		    } else {
 		        request.setAttribute("status", "failed");
 		        dispatcher = request.getRequestDispatcher("admin.jsp");
 		        dispatcher.forward(request, response);
 		    }
 		} catch (Exception e) {
 		    e.printStackTrace();
 		    response.sendRedirect("admin.jsp"); 
 		}
 	}

}
