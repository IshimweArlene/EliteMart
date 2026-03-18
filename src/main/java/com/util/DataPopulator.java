package com.util;

import com.dao.UserDAO;
import com.models.User;

public class DataPopulator {
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        User seller = new User("admin", "ishimwarlene1@gmail.com", "admin123", "SELLER");
        dao.register(seller);
        System.out.println("Seller 'admin' added successfully!");
        System.exit(0);
    }
}
