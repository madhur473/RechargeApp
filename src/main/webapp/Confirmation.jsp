<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirmation</title>
    <style>
        /* Basic CSS for layout */
        body {
            font-family: Arial, sans-serif;
            background-color: #ffe67f; /* Set background color */
            margin: 0; /* Remove default margin */
            padding: 0; /* Remove default padding */
        }
        .container {
            width: 60%;
            margin: 50px auto; /* Center the container */
            background-color: white; /* Set background color for container */
            padding: 20px; /* Add some padding */
            border-radius: 10px; /* Add rounded corners */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* Add a subtle shadow */
        }
        .confirmation-message {
            text-align: center;
            margin-bottom: 20px;
        }
        .details-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Confirmation</h2>
    <div class="confirmation-message">
        Your recharge has been successfully processed!
    </div>
    <h3>Recharge Details</h3>
   <table class="details-table">
    <tr>
        <th>Phone Number</th>
        <td><%= session.getAttribute("phone") %></td>
    </tr>
    <tr>
        <th>Selected Plan</th>
        <td><%= session.getAttribute("Plan") %></td>
    </tr>
    <tr>
        <th>Amount Deducted</th>
        <td>₹<%= session.getAttribute("Amount") %></td>
    </tr>
</table>

</div>
</body>
</html>
