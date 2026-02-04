<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="jakarta.servlet.*" %>
<%
    // Get the booking ID from the request
    String bookingId = request.getParameter("bookingId");

    if (bookingId == null || bookingId.trim().isEmpty()) {
        session.setAttribute("cancelMessage", "<span style='color:red;'>Invalid booking ID</span>");
        response.sendRedirect("index.jsp");
        return;
    }

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/princedata?useSSL=false", "root", "Prince@1212");
        String sql = "DELETE FROM bookings WHERE booking_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, bookingId);

        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            session.setAttribute("cancelMessage", "<span style='color:green;'>Booking canceled successfully. Refund amount refunds will be credited to the original payment method used by you within 5-7 working days. </span>");
        } else {
            session.setAttribute("cancelMessage", "<span style='color:red;'>Failed to cancel booking. Please try again.</span>");
        }

    } catch (Exception e) {
        e.printStackTrace();
        session.setAttribute("cancelMessage", "<span style='color:red;'>An error occurred while canceling the booking.</span>");
    } finally {
        // Close resources
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignored) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
    }

    // Redirect back to index.jsp with message
    response.sendRedirect("index.jsp");
%>
