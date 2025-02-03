<!DOCTYPE html>
<html>
<head>
    <title>Register Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(to right, #2a0e61, #4b0082, #6a5acd, #8a2be2);
            margin: 0;
            overflow: hidden;
            position: relative;
        }
        .container {
            background: rgba(255, 255, 255, 0.15);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            width: 90%;
            max-width: 400px;
            text-align: center;
            backdrop-filter: blur(10px);
            color: white;
            animation: fadeIn 1.5s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            font-size: 16px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
            transition: transform 0.3s, background 0.3s;
            background: rgba(255, 255, 255, 0.3);
            color: white;
        }
        button:hover {
            transform: scale(1.05);
            background: #8a2be2;
        }
        input {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            background: rgba(255, 255, 255, 0.3);
            color: white;
            font-size: 16px;
        }
        input::placeholder {
            color: white;
        }
        .sign-in {
            background: transparent;
            border: 1px solid white;
            margin-top: 5px;
        }
        .sign-in:hover {
            background: white;
            color: #4b0082;
        }
    </style>
    <script>
        window.onload = function() {
            let isRegistered = false; // Replace this with actual backend check
            if (isRegistered) {
                window.location.href = 'Login.jsp';
            }
        };
    </script>
</head>
<body>
    <div class="container">
        <h2>Register</h2>
        <form action="/CanteenManagement/RegisterServlet" method="post">
            <input type="text" name="full_name" placeholder="Full Name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="password" name="confirm_password" placeholder="Confirm Password" required>
            <input type="text" name="department" placeholder="Department" required>
            <input type="tel" name="phone" placeholder="Phone Number" required pattern="[0-9]{10}">
            <button type="submit">Register</button>
        </form>
        <button class="sign-in" onclick="window.location.href='Login.jsp'">Already a user? Sign In</button>
    </div>
</body>
</html>
