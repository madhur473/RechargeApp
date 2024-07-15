<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center; /* Center-align content */
            margin-top: 50px; /* Increase top margin */
            background-color: #D8EFD3; /* Light green background */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            width: 60%;
            background-color: #fff; /* White background for the container */
            padding: 20px; /* Add padding inside container */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        }
        h2 {
            color: #333; /* Dark text color */
        }
        p {
            font-weight: bold; /* Make paragraphs bold */
            margin-bottom: 20px; /* Add bottom margin to paragraphs */
        }
        a {
            color: #007bff; /* Link color */
            text-decoration: none; /* Remove underline */
        }
        a:hover {
            text-decoration: underline; /* Underline on hover */
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Logout</h2>
    <p>You have been successfully logged out.</p>
    <p>Click <a href="Login.jsp">here</a> to login again.</p>
</div>

</body>
</html>
