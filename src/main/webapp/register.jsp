<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Join EliteMart</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: #0f172a;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .register-card {
            background: #1e293b;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }
        .register-card h2 {
            margin-bottom: 24px;
            color: #38bdf8;
        }
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #cbd5f5;
            font-size: 14px;
        }
        .form-group input {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #334155;
            background: #0f172a;
            color: white;
            box-sizing: border-box;
            outline: none;
        }
        .form-group input:focus {
            border-color: #38bdf8;
        }
        .btn-join {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: none;
            background: linear-gradient(90deg, #6366f1, #8b5cf6);
            color: white;
            font-weight: 600;
            cursor: pointer;
            margin-top: 10px;
        }
        .btn-join:hover {
            opacity: 0.9;
        }
        .back-link {
            display: block;
            margin-top: 20px;
            color: #38bdf8;
            text-decoration: none;
            font-size: 14px;
        }
        .password-wrapper {
            position: relative;
        }
        .toggle-password {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #cbd5f5;
            user-select: none;
        }
    </style>
</head>
<body>
    <div class="register-card">
        <h2>Join EliteMart</h2>
        <form action="RegisterServlet" method="POST" autocomplete="off">
            <!-- Hidden dummy inputs to fool browser autofill -->
            <input type="text" style="display:none;" name="fake_username"/>
            <input type="password" style="display:none;" name="fake_password"/>
            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" placeholder="Enter your full name" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <div class="password-wrapper">
                    <input type="password" id="password" name="password" placeholder="Create a password" autocomplete="new-password" required>
                    <span class="toggle-password" onclick="togglePassword()">👁️</span>
                </div>
            </div>
            <button type="submit" class="btn-join">Register Now</button>
        </form>
        <p style="margin-top: 20px; font-size: 14px; color: #cbd5f5;">
            Already have an account? <a href="login.jsp" style="color: #38bdf8; text-decoration: none;">Login</a>
        </p>
        <a href="index.jsp" class="back-link">← Back to Store</a>
    </div>
    <script>
        function togglePassword() {
            const passwordField = document.getElementById('password');
            const toggleIcon = document.querySelector('.toggle-password');
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                toggleIcon.textContent = '🔒';
            } else {
                passwordField.type = 'password';
                toggleIcon.textContent = '👁️';
            }
        }

        // Force form reset on page load to clear any browser pre-fill
        window.addEventListener('load', () => {
            document.querySelector('form').reset();
        });
    </script>
</body>
</html>
