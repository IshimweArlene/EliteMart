package com.dao;

import com.models.Product;
import com.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;
import java.util.List;

public class ProductDAO {

    public void save(Product product) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.persist(product);
        session.getTransaction().commit();
        session.close();
    }

    public List<Product> getAllProducts() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Product> products = session.createQuery("from Product", Product.class).list();
        session.close();
        return products;
    }

    public List<Product> getFilteredProducts(String category, Double minPrice, Double maxPrice, String sortBy) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        StringBuilder hql = new StringBuilder("from Product where 1=1");
        
        if (category != null && !category.isEmpty() && !"All Categories".equalsIgnoreCase(category)) {
            hql.append(" and category = :category");
        }
        
        if (minPrice != null) {
            hql.append(" and price >= :minPrice");
        }
        
        if (maxPrice != null) {
            hql.append(" and price <= :maxPrice");
        }
        
        if (sortBy != null) {
            switch (sortBy) {
                case "Price: Low to High": hql.append(" order by price asc"); break;
                case "Price: High to Low": hql.append(" order by price desc"); break;
                case "Newest First": hql.append(" order by id desc"); break;
                default: break;
            }
        }

        Query<Product> query = session.createQuery(hql.toString(), Product.class);
        
        if (category != null && !category.isEmpty() && !"All Categories".equalsIgnoreCase(category)) {
            query.setParameter("category", category);
        }
        
        if (minPrice != null) {
            query.setParameter("minPrice", minPrice);
        }
        
        if (maxPrice != null) {
            query.setParameter("maxPrice", maxPrice);
        }

        List<Product> products = query.list();
        session.close();
        return products;
    }
}
