<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, java.text.DecimalFormat" %>

<!DOCTYPE html>
<html>
<head>
    <title>Order Summary - NGP Food Court</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #1e3c72, #2a5298);
            color: white;
            text-align: center;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 10px;
        }
        h2 {
            margin-bottom: 10px;
        }
        table {
            width: 100%;
            margin-top: 20px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            padding: 10px;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid white;
        }
        .total {
            font-weight: bold;
            font-size: 18px;
            margin-top: 10px;
        }
        .pay-button {
            background: #ffcc00;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            margin-top: 20px;
        }
        .pay-button:hover {
            background: #e6b800;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Your Order Summary</h2>

        <%
            // Define prices for items
            Map<String, Double> itemPrices = new HashMap<>();
            itemPrices.put("Meals", 100.0);
            itemPrices.put("Biryani", 120.0);
            itemPrices.put("Fried Rice", 110.0);
            itemPrices.put("Samosa", 15.0);
            itemPrices.put("Juice", 50.0);
            itemPrices.put("Tea", 15.0);
            itemPrices.put("Coffee", 20.0);
            itemPrices.put("Medu Vadai", 10.0);
            itemPrices.put("Masala Vadai", 30.0);

            // Get selected items from URL parameters
            String itemsParam = request.getParameter("items");
            if (itemsParam == null || itemsParam.isEmpty()) {
                out.println("<p>Your cart is empty.</p>");
            } else {
                String[] items = itemsParam.split(",");
                double total = 0;
        %>
        
        <table>
            <tr>
                <th>Item</th>
                <th>Price (₹)</th>
            </tr>
        
        <%
                for (String item : items) {
                    double price = itemPrices.getOrDefault(item.trim(), 0.0);
                    total += price;
        %>
            <tr>
                <td><%= item.trim() %></td>
                <td>₹<%= price %></td>
            </tr>
        <%
                }
        %>
            <tr>
                <td class="total">Total Amount:</td>
                <td class="total">₹<%= new DecimalFormat("0.00").format(total) %></td>
            </tr>
        </table>

        <button class="pay-button" onclick="processPayment()">Proceed to Payment</button>

        <script>
            function processPayment() {
                alert("Redirecting to payment page...");
                window.location.href = "payment.jsp?total=<%= total %>";
            }
        </script>

        <%
            }
        %>

    </div>

</body>
</html>
