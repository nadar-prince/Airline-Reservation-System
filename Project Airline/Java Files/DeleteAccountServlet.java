package com.prince.registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
@WebServlet("/DeleteAccountServlet")
public class DeleteAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        if (session.getAttribute("name") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = (String) session.getAttribute("name");
        String enteredPassword = request.getParameter("password");
        String[] selectedReasons = request.getParameterValues("reason");
        String optionalReason = request.getParameter("optionalReason");

        StringBuilder reasonBuilder = new StringBuilder();
        if (selectedReasons != null) {
            for (String reason : selectedReasons) {
                reasonBuilder.append(reason).append(", ");
            }
        }
        if (optionalReason != null && !optionalReason.trim().isEmpty()) {
            reasonBuilder.append("Other: ").append(optionalReason);
        }
        String finalReason = reasonBuilder.toString().trim();
        
        Connection conn = null;
        String userEmail = null;
        
        try {
            // Database Connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/princedata?useSSL=false", "root", "Prince@1212");

            // Check Password & Retrieve Email
            String checkUserQuery = "SELECT upwd, uemail FROM users WHERE uname2=?";
            PreparedStatement checkPs = conn.prepareStatement(checkUserQuery);
            checkPs.setString(1, username);
            ResultSet rs = checkPs.executeQuery();

            if (rs.next()) {
                String actualPassword = rs.getString("upwd");
                userEmail = rs.getString("uemail");

                if (!actualPassword.equals(enteredPassword)) {
                    session.setAttribute("message", "Incorrect password. Account deletion failed.");
                    response.sendRedirect("UserProfile.jsp");
                    return;
                }
            } else {
                session.setAttribute("message", "User not found.");
                response.sendRedirect("UserProfile.jsp");
                return;
            }

            String insertQuery = "INSERT INTO deleted_accounts (username, reason) VALUES (?, ?)";
            PreparedStatement insertPs = conn.prepareStatement(insertQuery);
            insertPs.setString(1, username);
            insertPs.setString(2, finalReason);
            insertPs.executeUpdate();

            String deleteQuery = "DELETE FROM users WHERE uname2=?";
            PreparedStatement deletePs = conn.prepareStatement(deleteQuery);
            deletePs.setString(1, username);
            int rowsAffected = deletePs.executeUpdate();

            conn.close();

            if (rowsAffected > 0) {
            	
            	sendFarewellEmail(userEmail);
            	
            	session.setAttribute("message", "Account deleted successfully.");
                response.sendRedirect("login.jsp");
            } else {
                session.setAttribute("message", "Account deletion failed.");
                response.sendRedirect("UserProfile.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("message", "An error occurred. Try again.");
            response.sendRedirect("UserProfile.jsp");
        }
	}
	
	private void sendFarewellEmail(String to) {
        final String senderEmail = "indiair039@gmail.com"; // Replace with your email
        final String senderPassword = "fzve pgmw iddz eyem"; // Use App Password for Gmail

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
            message.setSubject("Account Deleted Successfully - IndiAir");
            message.setText("Dear User,\n\n"
                    + "We are sorry to see you go! Your account has been successfully deleted from IndiAir.\n"
                    + "If you ever decide to return, we’d be happy to welcome you back!\n\n"
                    + "Best Regards,\n"
                    + "IndiAir Team");

            Transport.send(message);
            System.out.println("✅ Farewell Email Sent Successfully to: " + to);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

}
