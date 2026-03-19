package com.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        // In a real app, we would save the order to the database here.
        // String name = request.getParameter("name");
        // String address = request.getParameter("address1");
        // String paymentMethod = request.getParameter("paymentMethod");
        
        // For this simulation, we'll just clear the cart and redirect.
        session.removeAttribute("cart");
        
        // Redirect to success page
        response.sendRedirect("order-success.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // GET on /checkout should probably just show the checkout page
        response.sendRedirect("checkout.jsp");
    }
}
