package com.prince.registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.*;

@WebServlet("/TicketGeneration")
public class TicketGeneration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Get user and flight details from form submission
        String flightName = request.getParameter("flightName");
        String departure = request.getParameter("departure");
        String destination = request.getParameter("destination");
        String departureTime = request.getParameter("departureTime");
        String arrivalTime = request.getParameter("arrivalTime");
        String travelClass = request.getParameter("travelClass");
        String passengerName = request.getParameter("passengerName");
        String totalPrice = request.getParameter("totalPrice");
        
        // Forward the data to the JSP page
        request.setAttribute("flightName", flightName);
        request.setAttribute("departure", departure);
        request.setAttribute("destination", destination);
        request.setAttribute("departureTime", departureTime);
        request.setAttribute("arrivalTime", arrivalTime);
        request.setAttribute("travelClass", travelClass);
        request.setAttribute("passengerName", passengerName);
        request.setAttribute("totalPrice", totalPrice);
        
        request.getRequestDispatcher("Ticket.jsp").forward(request, response);
	}

}
