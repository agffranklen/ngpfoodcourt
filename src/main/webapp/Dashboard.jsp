<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <title>NGP Food Court - Menu Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #1e3c72, #2a5298);
            color: white;
            text-align: center;
            padding: 20px;
        }
        .container {
            max-width: 900px;
            margin: auto;
            background: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 10px;
        }
        h2 {
            margin-bottom: 10px;
        }
        .menu-category {
            margin-top: 20px;
        }
        .menu-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }
        .menu-item {
            background: rgba(255, 255, 255, 0.2);
            padding: 15px;
            border-radius: 10px;
            width: 200px;
            text-align: center;
            transition: transform 0.3s;
        }
        .menu-item img {
            width: 100px;
            height: 100px;
            border-radius: 10px;
        }
        .menu-item:hover {
            transform: scale(1.05);
            background: rgba(255, 255, 255, 0.3);
        }
        .menu-item button {
            background: #ffcc00;
            border: none;
            padding: 8px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            margin: 5px;
        }
        .menu-item button:hover {
            background: #e6b800;
        }
        .cart {
            margin-top: 20px;
        }
        .cart button {
            background: green;
            padding: 10px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
        }
        .logout {
            margin-top: 20px;
        }
        .logout button {
            background: red;
            padding: 10px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
        }
    </style>
</head>
<body>

    <div class="container">
        Hello Nanba : <%= request.getParameter("username") %>
        <h2>Welcome to NGP Food Court</h2>
        <p>Explore our menu and place your order.</p>

        <div class="menu-category">
            <h3>Available Menu</h3>
            <div class="menu-list">
                <c:forEach var="item" items="${foodItems}">
                    <div class="menu-item">
                        <img src="images/${item.itemname.toLowerCase()}.jpg" alt="${item.itemname}">
                        <h4>${item.itemname} - ₹${item.rate}</h4>
                        <p>Quantity Available: <span id="${item.itemname}Qty">${item.quantity}</span></p>
                        <button onclick="addToCart('${item.itemname}', ${item.rate}, '${item.itemname}Qty')">Add to Cart</button>
                    </div>
                </c:forEach>
            </div>
        </div>

        <div class="cart">
            <button onclick="proceedToBuy()">Proceed to Buy</button>
        </div>

        <div class="logout">
            <button onclick="logout()">Logout</button>
        </div>
    </div>

    <script>
        let cart = [];

        function addToCart(item, price, quantityId) {
            let quantityElement = document.getElementById(quantityId);
            let availableQuantity = parseInt(quantityElement.innerText);

            if (availableQuantity > 0) {
                cart.push({ item, price });
                quantityElement.innerText = availableQuantity - 1;
                alert(item + " added to cart!");
            } else {
                alert("Sorry, " + item + " is out of stock!");
            }
        }

        function proceedToBuy() {
            if (cart.length === 0) {
                alert("Your cart is empty!");
                return;
            }
            let items = cart.map(c => c.item).join(",");
            window.location.href = "order.jsp?items=" + encodeURIComponent(items);
        }

        function logout() {
            window.location.href = "logout.jsp";
        }
    </script>

</body>
</html>
