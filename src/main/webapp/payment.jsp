<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Page</title>
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
        .payment-options {
            margin-top: 30px;
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }
        .payment-option {
            border: 2px solid #ddd;
            padding: 20px;
            border-radius: 8px;
            cursor: pointer;
            width: 200px;
            text-align: center;
            transition: background-color 0.3s;
        }
        .payment-option:hover {
            background-color: #f0f0f0;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 15px 32px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            border: none;
            margin-top: 20px;
            text-decoration: none;
            display: inline-block;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Complete Your Payment</h1>
        <p>Choose your preferred payment method below:</p>

        <div class="payment-options">
            <div class="payment-option" onclick="selectPayment('QR')">
                <img src="https://example.com/qr-code.png" alt="QR Code" width="150">
                <p>Pay via QR Code</p>
            </div>
            <div class="payment-option" onclick="selectPayment('Card')">
                <img src="https://upload.wikimedia.org/wikipedia/commons/3/34/Mastercard-logo.svg" alt="Credit Card" width="150">
                <p>Pay via Debit/Credit Card</p>
            </div>
            <div class="payment-option" onclick="selectPayment('UPI')">
                <img src="https://upload.wikimedia.org/wikipedia/commons/6/63/UPI_Logo_2018.svg" alt="UPI" width="150">
                <p>Pay via UPI</p>
            </div>
            <div class="payment-option" onclick="selectPayment('Test')">
                <img src="https://upload.wikimedia.org/wikipedia/commons/b/b2/Test-Logo.svg" alt="Test" width="150">
                <p>Test Payment</p>
            </div>
        </div>

        <!-- Proceed to Payment Button -->
        <button class="btn" onclick="proceedToPayment()">Proceed to Payment</button>
    </div>

    <script>
        let selectedPayment = '';

        function selectPayment(method) {
            selectedPayment = method;
            alert("Selected Payment Method: " + method);
        }

        function proceedToPayment() {
            if (!selectedPayment) {
                alert("Please select a payment method before proceeding.");
                return;
            }

            let cart = JSON.parse(localStorage.getItem('cart')) || [];
            localStorage.setItem('lastCart', JSON.stringify(cart)); // Save cart for success page
            localStorage.removeItem('cart'); // Clear cart after payment

            if (selectedPayment === 'QR') {
                window.location.href = 'YOUR_PAYMENT_GATEWAY_URL_FOR_QR';
            } else if (selectedPayment === 'Card') {
                window.location.href = 'YOUR_PAYMENT_GATEWAY_URL_FOR_CARD';
            } else if (selectedPayment === 'UPI') {
                window.location.href = 'YOUR_PAYMENT_GATEWAY_URL_FOR_UPI';
            } else if (selectedPayment === 'Test') {
                window.location.href = 'success.jsp'; // Redirect to success page
            }
        }
    </script>
</body>
</html>
