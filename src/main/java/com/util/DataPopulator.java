package com.util;

import com.dao.UserDAO;
import com.dao.ProductDAO;
import com.models.User;
import com.models.Product;
import java.util.ArrayList;
import java.util.List;

public class DataPopulator {
    public static void main(String[] args) {
        try {
            UserDAO userDAO = new UserDAO();
            ProductDAO productDAO = new ProductDAO();

            // 1. Populate Admin/Seller if not exists
            String adminEmail = "ishimwarlene1@gmail.com";
            if (userDAO.findByUsername(adminEmail) == null) {
                User seller = new User("Arlene Ishimwe", adminEmail, "admin123", "SELLER");
                userDAO.register(seller);
                System.out.println("Seller '" + adminEmail + "' added.");
            }

            // 2. Populate Products
            List<Product> products = new ArrayList<>();

            // Electronics
            products.add(new Product("Smartwatch Series 5", "Track your health and stay connected.", 199.99, "Electronics", "images/smartwatch.png"));
            products.add(new Product("Wireless Headphones", "Immersive sound with noise cancellation.", 89.99, "Electronics", "images/headphones.png"));
            products.add(new Product("Aluminum Laptop Stand", "Ergonomic design for better posture.", 49.99, "Electronics", "images/laptop_stand.png"));
            products.add(new Product("USB-C Hub Adapter", "7-in-1 connectivity for your laptop.", 34.99, "Electronics", "images/hub.png"));

            // Home Appliances
            products.add(new Product("Smoothie Blender", "Powerful blender for healthy smoothies.", 59.99, "Home Appliances", "images/blender.png"));
            products.add(new Product("Espresso Maker", "Brew professional quality coffee at home.", 149.99, "Home Appliances", "images/espresso.png"));
            products.add(new Product("Air Fryer Pro", "Healthy oil-free cooking made easy.", 129.99, "Home Appliances", "images/airfryer.png"));
            products.add(new Product("Robot Vacuum", "Automated cleaning for your floors.", 249.99, "Home Appliances", "images/vacuum.png"));

            // Fashion
            products.add(new Product("Urban Sneakers", "Stylish comfort for everyday wear.", 74.99, "Fashion", "images/sneakers.png"));
            products.add(new Product("Classic Leather Belt", "High-quality leather for a timeless look.", 29.99, "Fashion", "images/belt.png"));
            products.add(new Product("Cotton Crewneck Tee", "Soft and breathable daily essential.", 19.99, "Fashion", "images/tshirt.png"));
            products.add(new Product("Canvas Backpack", "Durable and spacious for your travels.", 45.00, "Fashion", "images/backpack.png"));

            // Books
            products.add(new Product("Science of Cooking", "Understand the chemistry of your food.", 35.00, "Books", "images/book_cooking.png"));
            products.add(new Product("Programming Patterns", "Elegant solutions for software design.", 45.99, "Books", "images/book_code.png"));
            products.add(new Product("The Art of War", "Ancient wisdom for modern leadership.", 15.00, "Books", "images/book_war.png"));
            products.add(new Product("Mindfulness Guide", "A practical path to daily peace.", 22.50, "Books", "images/book_mind.png"));

            // Hobbies
            products.add(new Product("Acoustic Guitar", "Perfect for beginners and enthusiasts.", 180.00, "Hobbies", "images/guitar.png"));
            products.add(new Product("Drone with 4K Camera", "Capture stunning aerial footage.", 350.00, "Hobbies", "images/drone.png"));
            products.add(new Product("Yoga Mat Pro", "Non-slip grip for your practice.", 40.00, "Hobbies", "images/yoga_mat.png"));
            products.add(new Product("Watercolor Set", "Professional grade paints for artists.", 55.00, "Hobbies", "images/art_set.png"));

            // Beauty
            products.add(new Product("Moisturizing Cream", "Deep hydration for all skin types.", 25.00, "Beauty", "images/cream.png"));
            products.add(new Product("Organic Face Serum", "Radiant skin with natural ingredients.", 35.50, "Beauty", "images/serum.png"));
            products.add(new Product("Matte Lipstick", "Long-lasting color for every occasion.", 18.00, "Beauty", "images/lipstick.png"));
            products.add(new Product("Eyeshadow Palette", "Highly pigmented shades for bold looks.", 28.00, "Beauty", "images/eyeshadow.png"));

            // Home Decor
            products.add(new Product("Ceramic Vase", "Elegant centerpiece for your home.", 22.00, "Home Decor", "images/vase.png"));
            products.add(new Product("Scented Candle", "Calming lavender scent for relaxation.", 15.00, "Home Decor", "images/candle.png"));
            products.add(new Product("Wall Mirror", "Modern minimal design for any room.", 65.00, "Home Decor", "images/mirror.png"));
            products.add(new Product("Abstract Canvas Art", "Add a pop of color to your walls.", 85.00, "Home Decor", "images/wall_art.png"));

            // Furniture
            products.add(new Product("Minimalist Desk", "Spacious and sturdy for your office.", 120.00, "Furniture", "images/desk.png"));
            products.add(new Product("Ergonomic Chair", "Supportive seating for long work hours.", 150.00, "Furniture", "images/chair.png"));
            products.add(new Product("Coffee Table", "Solid wood with a natural finish.", 95.00, "Furniture", "images/coffee_table.png"));
            products.add(new Product("Bookshelf", "Five tiers for your growing collection.", 110.00, "Furniture", "images/bookshelf.png"));

            System.out.println("Checking and adding products...");
            List<Product> existingProducts = productDAO.getAllProducts();
            for (Product p : products) {
                boolean exists = false;
                for (Product ep : existingProducts) {
                    if (ep.getName().equals(p.getName())) {
                        exists = true;
                        break;
                    }
                }
                if (!exists) {
                    productDAO.save(p);
                    System.out.println("Product '" + p.getName() + "' added.");
                }
            }
            System.out.println("Data population complete!");

        } catch (Exception e) {
            System.err.println("Error populating data: " + e.getMessage());
            e.printStackTrace();
        } finally {
            System.exit(0);
        }
    }
}
