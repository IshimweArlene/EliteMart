<%@ page contentType="text/html;charset=UTF-8" %>
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

        <button class="btn login" onclick="location.href='login.jsp'">Login</button>
        <button class="btn join" onclick="location.href='register.jsp'">Join Now</button>
    </div>
</div>

</body>
</html>