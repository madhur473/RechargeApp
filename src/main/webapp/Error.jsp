<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error Occurred</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h1 {
            color: #e74c3c;
        }
        p {
            line-height: 1.6;
        }
        .error-details {
            margin-top: 20px;
            padding: 10px;
            background-color: #f9ebea;
            border: 1px solid #e74c3c;
            border-radius: 5px;
            word-wrap: break-word;
        }
        .footer {
            margin-top: 50px;
            text-align: center;
            color: #aaa;
        }
        .retry-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #3498db;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
        }
        .retry-link:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>An Error Occurred</h1>
       <p>We're sorry, but something went wrong. Please try again later.</p>
        <a href="Login.jsp" class="retry-link">Try Again</a>
    </div>
    
</body>
</html>
