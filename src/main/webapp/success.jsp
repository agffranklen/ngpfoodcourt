<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Successful</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            text-align: center;
            padding: 50px;
        }
        .container {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        h1 {
            color: #4CAF50;
        }
        .bill {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            margin-top: 20px;
            text-align: left;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Dr. N.G.P. Institute of Technology</h1>
        <h2>Payment Successful!</h2>
        <p>Thank you for your purchase.</p>

        <div class="bill">
            <h3>Bill Summary</h3>
            <div id="bill-details"></div>
        </div>
    </div>

    <script>
        let cart = JSON.parse(localStorage.getItem('lastCart')) || [];
        let billDetails = document.getElementById("bill-details");

        if (cart.length === 0) {
            billDetails.innerHTML = "<p>No items found.</p>";
        } else {
            cart.forEach(item => {
                billDetails.innerHTML += `<p>${item.item} - ₹${item.price}</p>`;
            });
        }
    </script>
</body>
</html>
