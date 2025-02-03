<!DOCTYPE html>
<html>
<head>
    <title>NGP Food Court - Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(to right, #20002c, #6f00ff);
            margin: 0;
            overflow: hidden;
            position: relative;
        }
        .container {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 400px;
            text-align: center;
            animation: fadeIn 1.5s ease-in-out;
            color: #ffffff;
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
            background: #f0a500;
            color: white;
        }
        button:hover {
            transform: scale(1.05);
            background: #e08900;
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
        .register-link {
            display: block;
            margin-top: 10px;
            color: #f0a500;
            text-decoration: none;
            font-size: 14px;
        }
        .register-link:hover {
            text-decoration: underline;
        }
    </style>
    
</head>
<body>
    <div class="container">
        <h2>Login to NGP Food Court</h2>
        <form action="LoginServlet" onsubmit="redirectToDashboard(event)">
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
        <a href="Register.jsp" class="register-link">Not Registered? Sign Up Here</a>
    </div>
</body>
</html>
