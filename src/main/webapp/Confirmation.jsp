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
            background-color: #D8EFD3; /* Set background color */
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
            position: relative; /* Make the container relative for absolute positioning */
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
        .dashboard-button {
            position: absolute; /* Position the button absolutely */
            top: 20px; /* Position the button 20px from the top */
            right: 20px; /* Position the button 20px from the right */
            background-color: #4CAF50; /* Green background */
            color: white; /* White text */
            border: none; /* Remove border */
            padding: 10px 20px; /* Add padding */
            text-align: center; /* Center text */
            text-decoration: none; /* Remove underline */
            display: inline-block; /* Display as inline block */
            font-size: 16px; /* Increase font size */
            border-radius: 5px; /* Add rounded corners */
            cursor: pointer; /* Add pointer cursor */
        }
        .dashboard-button:hover {
            background-color: #45a049; /* Darker green on hover */
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
    <a href="Dashboard.jsp" class="dashboard-button">Dashboard</a>
</div>
</body>
</html>
