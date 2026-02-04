package com.prince.registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/VerifyOtpServlet")
public class VerifyOtpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   HttpSession session = request.getSession();
	        String enteredOtp = request.getParameter("otp");
	        Integer generatedOtp = (Integer) session.getAttribute("otp");

	        if (generatedOtp != null && enteredOtp != null && enteredOtp.equals(String.valueOf(generatedOtp))) {
	            session.removeAttribute("otp");  // Remove OTP after verification
	            response.getWriter().write("OTP_VALID");
	        } else {
	            response.getWriter().write("INVALID_OTP");
	        }
	}


}
