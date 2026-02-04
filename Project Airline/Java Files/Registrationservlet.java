package com.prince.registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
/**
 * Servlet implementation class Registrationservlet
 */
@WebServlet("/Registrationservlet")
 public class Registrationservlet extends HttpServlet {
	private static final long serialVersionUID = 1L; 

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String fname = request.getParameter("fname");
	    String lname=request.getParameter("lname");
	    String uemail = request.getParameter("email");
	    String umobile = request.getParameter("mobile");
	    String uname2 = request.getParameter("username");
	    String upwd = request.getParameter("password");
	    String upwd2 = request.getParameter("confpassword");

	    RequestDispatcher dispatcher = null;
	    Connection con = null;

	    // Validation patterns
	    String namePattern = "^[A-Za-z]+$";
	    String mobilePattern = "^[9876]\\d{9}$";
	    String usernamePattern = "^[a-z][a-zA-Z0-9@_]{0,15}$";
	    String passwordPattern = "^[A-Z][a-z]*(?=.*[0-9])(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]{3,15}$";
	    String emailPattern = "^[a-z][a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,6}$";

	    // Validations
	    if (fname == null || !fname.matches(namePattern)) {
	        response.sendRedirect("register.jsp?error=name");
	        return;
	    }
	    
	    if (lname == null || !lname.matches(namePattern)) {
	        response.sendRedirect("register.jsp?error=name");
	        return;
	    }
	    
	    if (umobile == null || !umobile.matches(mobilePattern)) {
	        response.sendRedirect("register.jsp?error=mobile");
	        return;
	    }
	    
	    if (uemail == null || !uemail.matches(emailPattern)) {
	        response.sendRedirect("register.jsp?error=email");
	        return;
	    }

	    if (uname2 == null || !uname2.matches(usernamePattern) || uname2.length() > 16) {
	        response.sendRedirect("register.jsp?error=username");
	        return;
	    }

	    if (upwd == null || !upwd.matches(passwordPattern) || upwd.length() > 16) {
	        response.sendRedirect("register.jsp?error=password");
	        return;
	    }

	    if (!upwd.equals(upwd2)) {
	        response.sendRedirect("register.jsp?error=confpassword");
	        return;
	    }

	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/princedata?useSSL=false", "root", "Prince@1212");
	        
	        PreparedStatement checkEmailStmt = con.prepareStatement("SELECT * FROM users WHERE uemail = ?");
            checkEmailStmt.setString(1, uemail);
            ResultSet rs = checkEmailStmt.executeQuery();

            if (rs.next()) {
                response.sendRedirect("register.jsp?error=email_exists");
                return;
            }
	        
	        PreparedStatement pst = con.prepareStatement("INSERT INTO users(fname, lname, uname2, upwd, uemail, umobile, upwd2) VALUES (?, ?, ?, ?, ?, ?, ?)");
	        pst.setString(1, fname);
	        pst.setString(2, lname);
	        pst.setString(3, uname2);
	        pst.setString(4, upwd);
	        pst.setString(5, uemail);
	        pst.setString(6, umobile);
	        pst.setString(7, upwd2);

	        int rowCount = pst.executeUpdate();
	        if (rowCount > 0) {
	        	 sendWelcomeEmail(uemail, fname);
	            response.sendRedirect("login.jsp?registration=success");
	        } else {
	            response.sendRedirect("register.jsp?error=datastorage");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.sendRedirect("register.jsp?error=exception");
	    } finally {
	        if (con != null) {
	            try {
	                con.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	    }
	}
 }
private void sendWelcomeEmail(String to, String fname) {
    final String senderEmail = "demo@gmail.com"; //replace with your email
    final String senderPassword = "*****"; //relpace with your your app key

    Properties props = new Properties();
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.smtp.socketFactory.port", "465");
    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.port", "465");

    Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(senderEmail, senderPassword);
        }
    });

    try {
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(senderEmail));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
        message.setSubject("Welcome to IndiAir, " + fname + "!");
        message.setText("Dear " + fname + ",\n\n"
                + "Thank you for registering with IndiAir!\n"
                + "We are excited to have you onboard.\n\n"
                + "🔹 Book your flights at IndiAir.\n"
                + "🔹 Check the latest offers and discounts.\n\n"
                + "Best Regards,\n"
                + "IndiAir Team");

        Transport.send(message);
        System.out.println("Welcome Email Sent Successfully to: " + to);
    } catch (MessagingException e) {
        e.printStackTrace();
    }
}
}

