package com.util;

import com.dao.ProductDAO;
import com.models.Product;
import java.util.List;

public class DBCheck {
    public static void main(String[] args) {
        try {
            ProductDAO dao = new ProductDAO();
            List<Product> products = dao.getAllProducts();
            System.out.println("Total products in DB: " + products.size());
            for (Product p : products) {
                System.out.println("- " + p.getName() + " (" + p.getCategory() + ")");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            System.exit(0);
        }
    }
}
