package com.prince.registration;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/EmailOTPServlet")
public class EmailOTPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
        RequestDispatcher dispatcher = null;
        HttpSession session = request.getSession();
        session.setAttribute("fname", request.getParameter("fname"));
        session.setAttribute("lname", request.getParameter("lname"));
        session.setAttribute("uname2", request.getParameter("username"));
        session.setAttribute("upwd", request.getParameter("password"));
        session.setAttribute("umobile", request.getParameter("mobile"));
        session.setAttribute("uemail", email);
        
        
        if (email != null && !email.isEmpty()) {
            Random rand = new Random();
            int otpValue = rand.nextInt(900000) + 100000;

            String senderEmail = "indiair039@gmail.com"; 
            String senderPassword = "fzve pgmw iddz eyem"; 
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");

            Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(senderEmail,senderPassword);
                }
            });

            try {
                // Compose message
                MimeMessage message = new MimeMessage(mailSession);
                message.setFrom(new InternetAddress(senderEmail)); 
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
                message.setSubject("Your IndiAir OTP Verification Code");
                message.setText("Dear User,\n\n"
                        + "Your OTP for email verification is: " + otpValue + ".\n\n"
                        + "Please enter this OTP on the verification page to proceed.\n\n"
                        + "Best regards,\nIndiAir");

                Transport.send(message);
                System.out.println("OTP Sent Successfully to " + email);

                session.setAttribute("otp", otpValue);
                session.setAttribute("email", email);

                response.sendRedirect("verifyEmailOtp.jsp");

            } catch (MessagingException e) {
                e.printStackTrace();
                request.setAttribute("Message", "Error sending OTP. Try again.");
                dispatcher = request.getRequestDispatcher("register.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            request.setAttribute("Message", "Invalid email. Please enter a valid email.");
            dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
        }
    }
}