package com.controllers;

import com.dao.ProductDAO;
import com.models.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private final ProductDAO productDAO = new ProductDAO();

    @Override
    @SuppressWarnings("unchecked")
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        
        if (cart == null) {
            cart = new HashMap<>();
        }

        List<Product> allProducts = productDAO.getAllProducts();
        List<Map<String, Object>> cartItems = new ArrayList<>();
        double total = 0;

        for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
            int productId = entry.getKey();
            int quantity = entry.getValue();
            
            for (Product p : allProducts) {
                if (p.getId() == productId) {
                    Map<String, Object> item = new HashMap<>();
                    item.put("product", p);
                    item.put("quantity", quantity);
                    item.put("subtotal", p.getPrice() * quantity);
                    cartItems.add(item);
                    total += p.getPrice() * quantity;
                    break;
                }
            }
        }

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("total", total);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    @Override
    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        
        if (cart == null) {
            cart = new HashMap<>();
            session.setAttribute("cart", cart);
        }

        if ("add".equals(action)) {
            try {
                int productId = Integer.parseInt(request.getParameter("productId"));
                cart.put(productId, cart.getOrDefault(productId, 0) + 1);
                
                // Return success for AJAX
                response.setContentType("text/plain");
                response.getWriter().write("success");
                return;
            } catch (Exception e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST);
                return;
            }
        } else if ("remove".equals(action)) {
            try {
                int productId = Integer.parseInt(request.getParameter("productId"));
                cart.remove(productId);
            } catch (Exception e) {}
            response.sendRedirect("cart");
        } else if ("clear".equals(action)) {
            cart.clear();
            response.sendRedirect("cart");
        }
    }
}
