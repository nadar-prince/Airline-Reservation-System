package com.prince.registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname2=request.getParameter("username");
		String upwd=request.getParameter("password");
		HttpSession session =request.getSession(); 
		RequestDispatcher dispatcher =null;
		
		if(uname2==null || uname2.equals("")) {
			request.setAttribute("status", "invaliduname2");
			dispatcher=request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
			}
		
		if(upwd==null || upwd.equals("")) {
			request.setAttribute("status", "invalidupwd");
			dispatcher=request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
			}
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/princedata","root","Prince@1212");
			PreparedStatement pst=con.prepareStatement("select * from users where uname2=? and upwd=?");
			pst.setString(1, uname2);
			pst.setString(2, upwd);
			
			ResultSet rs=pst.executeQuery();
			if (rs.next()) {
			    int userId = rs.getInt("id"); 
			    session.setAttribute("userId", userId); 
			    session.setAttribute("name", rs.getString("uname2"));

			    dispatcher = request.getRequestDispatcher("index.jsp");
			} else {
			    request.setAttribute("status", "failed");
			    dispatcher = request.getRequestDispatcher("login.jsp");
			}
			dispatcher.forward(request, response);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
