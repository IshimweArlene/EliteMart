package com.controllers;

import com.dao.ProductDAO;
import com.models.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {
    private final ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String category = request.getParameter("category");
        String minPriceStr = request.getParameter("minPrice");
        String maxPriceStr = request.getParameter("maxPrice");
        String sortBy = request.getParameter("sortBy");

        Double minPrice = null;
        Double maxPrice = null;

        try {
            if (minPriceStr != null && !minPriceStr.isEmpty()) {
                minPrice = Double.parseDouble(minPriceStr);
            }
            if (maxPriceStr != null && !maxPriceStr.isEmpty()) {
                maxPrice = Double.parseDouble(maxPriceStr);
            }
        } catch (NumberFormatException e) {
            // Ignore invalid price format
        }

        List<Product> products = productDAO.getFilteredProducts(category, minPrice, maxPrice, sortBy);
        
        request.setAttribute("products", products);
        request.setAttribute("selectedCategory", category);
        request.setAttribute("minPrice", minPriceStr);
        request.setAttribute("maxPrice", maxPriceStr);
        request.setAttribute("sortBy", sortBy);

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
