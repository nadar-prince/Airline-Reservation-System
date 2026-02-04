package com.prince.registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/VerifyEmailOTPServlet")
public class VerifyEmailOTPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;
        
        int storedOtp = (session.getAttribute("otp") != null) ? (int) session.getAttribute("otp") : 0;
        String email = (String) session.getAttribute("email");

        String userOtpStr = request.getParameter("otp");
        int userOtp = (userOtpStr != null && !userOtpStr.isEmpty()) ? Integer.parseInt(userOtpStr) : 0;

        if (userOtp == storedOtp) {
            request.setAttribute("Message", "Email Verified Successfully!");
            session.removeAttribute("otp"); 
            dispatcher = request.getRequestDispatcher("register.jsp"); 
        } else {
            request.setAttribute("Message", "Invalid OTP. Please try again.");
            dispatcher = request.getRequestDispatcher("verifyEmailOtp.jsp");
        }
        
        dispatcher.forward(request, response);
    }
}