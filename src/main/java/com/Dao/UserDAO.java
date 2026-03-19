package com.dao;

import com.models.User;
import com.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

public class UserDAO {

    public void register(User user) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        session.persist(user);

        session.getTransaction().commit();
        session.close();
    }

    public User login(String username, String password) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        String hql = "FROM User WHERE username = :username AND password = :password";
        Query<User> query = session.createQuery(hql, User.class);

        query.setParameter("username", username);
        query.setParameter("password", password);

        User user = query.uniqueResult();

        session.close();

        return user;
    }

    public User findByUsername(String username) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "FROM User WHERE username = :username";
        Query<User> query = session.createQuery(hql, User.class);
        query.setParameter("username", username);
        User user = query.uniqueResult();
        session.close();
        return user;
    }
}