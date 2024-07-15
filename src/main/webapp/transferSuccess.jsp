<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0; /* Light background */
            text-align: center;
            margin-top: 50px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .success-message {
            font-size: 24px;
            color: #4CAF50; /* Green text */
            margin-bottom: 20px;
        }
        .success-icon {
            font-size: 48px;
            color: #4CAF50; /* Green icon color */
            margin-bottom: 20px;
        }
        .return-link {
            display: block;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff; /* Link color */
        }
        .return-link:hover {
            text-decoration: underline; /* Underline on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="success-icon">
            <i class="fas fa-check-circle"></i>
        </div>
        <div class="success-message">Amount successfully transferred</div>
        <a href="Dashboard.jsp" class="return-link">Return to Dashboard</a>
    </div>
</body>
</html>
