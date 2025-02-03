<!DOCTYPE html>
<html>
<head>
    <title>NGP Food Court</title>
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
            position: relative;
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
        .logo {
            width: 100px;
            height: auto;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="https://www.jobsforyoutamizha.com/wp-content/uploads/2021/04/20210310_133949.jpg" alt="NGP Food Court Logo" class="logo">
        <h2>Welcome to NGP Food Court</h2>
        <form action="Login.jsp" method="post">
            <button type="submit">Login</button>
        </form>
        <form action="Register.jsp" method="post">
            <button type="submit">Register</button>
        </form>
    </div>	
</body>
</html>
