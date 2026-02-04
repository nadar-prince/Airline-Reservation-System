package com.prince.registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

@WebServlet("/GenerateOtpServlet")
public class GenerateOtpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mobile = request.getParameter("mobile");

        if (mobile == null || !mobile.matches("^[6789]\\d{9}$")) {
            response.getWriter().write("INVALID_MOBILE");
            return;
        }

        // Generate a 6-digit OTP
        Random rand = new Random();
        int otp = 100000 + rand.nextInt(900000);

        // Store OTP in session
        HttpSession session = request.getSession();
        session.setAttribute("otp", otp);
        session.setAttribute("mobile", mobile);

        System.out.println("Generated OTP: " + otp);  // Log OTP (in real use, send via SMS)

        response.getWriter().write("OTP_SENT");
    }
}

