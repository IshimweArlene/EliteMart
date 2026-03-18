<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.models.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>Store</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(90deg,#0f172a , #1c1834) ;
            color: white;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 40px;
            background: #0f172a;
        }

        .logo {
            display: flex;
            align-items: center;
            font-weight: 600;
            font-size: 18px;
            color: #38bdf8;
        }

        .logo span {
            margin-left: 8px;
            color: #38bdf8;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 25px;
        }

        .nav-links a {
            text-decoration: none;
            color: #cbd5f5;
            font-size: 16px;
        }

        .search-box {
            background: #383f6e;
            border-radius: 20px;
            padding: 5px 12px;
            display: flex;
            align-items: center;
        }

        .search-box input {
            border: none;
            outline: none;
            background: transparent;
            color: white;
            padding: 5px;
        }

        .btn {
            padding: 8px 16px;
            border-radius: 20px;
            border: none;
            cursor: pointer;
        }

        .login {
            background: transparent;
            color: white;
        }

        .join {
            background: linear-gradient(90deg, #6366f1, #8b5cf6);
            color: white;
        }

        /* User Profile Styles */
        .user-profile {
            display: flex;
            align-items: center;
            gap: 12px;
            background: #1e293b;
            padding: 5px 15px;
            border-radius: 30px;
            border: 1px solid #334155;
        }

        .user-initial {
            width: 32px;
            height: 32px;
            background: #38bdf8;
            color: #0f172a;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-weight: 600;
            font-size: 14px;
            text-transform: uppercase;
        }

        .user-name {
            font-size: 14px;
            font-weight: 400;
            color: #cbd5f5;
        }

        .logout-link {
            font-size: 12px;
            color: #ef4444;
            text-decoration: none;
            margin-left: 10px;
        }
    </style>
</head>

<body>

<div class="navbar">
    <div class="logo">
        ⚡ <span>EliteMart</span>
    </div>

    <div class="nav-links">
        <a href="#">Store</a>

        <div class="search-box">
            🔍 <input type="text" placeholder="Search...">
        </div>

        <% 
            User user = (User) session.getAttribute("user");
            if (user != null) {
                String initial = user.getFullName() != null && !user.getFullName().isEmpty() 
                                ? user.getFullName().substring(0, 1) : "?";
        %>
            <div class="user-profile">
                <div class="user-initial"><%= initial %></div>
                <span class="user-name"><%= user.getFullName() %></span>
                <a href="LogoutServlet" class="logout-link">Logout</a>
            </div>
        <% } else { %>
            <button class="btn login" onclick="location.href='login.jsp'">Login</button>
            <button class="btn join" onclick="location.href='register.jsp'">Join Now</button>
        <% } %>
    </div>
</div>

</body>
</html>