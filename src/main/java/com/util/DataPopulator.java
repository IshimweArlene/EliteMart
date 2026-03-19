package com.util;

import com.dao.UserDAO;
import com.models.User;

public class DataPopulator {
    public static void main(String[] args) {
        try {
            UserDAO dao = new UserDAO();
            String adminEmail = "ishimwarlene1@gmail.com";
            
            System.out.println("Checking if seller '" + adminEmail + "' exists...");
            User existingUser = dao.findByUsername(adminEmail);
            
            if (existingUser == null) {
                User seller = new User("Arlene Ishimwe", adminEmail, "admin123", "SELLER");
                dao.register(seller);
                System.out.println("Seller '" + adminEmail + "' added successfully!");
            } else {
                System.out.println("Seller '" + adminEmail + "' already exists in the database.");
            }
        } catch (Exception e) {
            System.err.println("Error populating data: " + e.getMessage());
            e.printStackTrace();
        } finally {
            System.exit(0);
        }
    }
}
