package com.controllers;

import com.dao.UserDAO;
import com.models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String fullName = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String role = "BUYER";
        if ("ishimwarlene1@gmail.com".equals(email)) {
            role = "SELLER";
        }

        User user = new User(fullName, email, password, role);
        userDAO.register(user);

        response.sendRedirect("login.jsp");
    }
}
