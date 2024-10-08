<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recharge</title>
    <link rel="stylesheet" type="text/css" href="stylesr.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>

<nav class="navbar">
    <img src="blackrock-logo-nav.svg" alt="Logo" class="logo">
    <div class="account-info">
        <div>Account Number: <%= session.getAttribute("AccountNumber") %></div>
        <div>Username: <%= session.getAttribute("Username") %></div>
        <div id="balance">Total Account Balance: ₹ <%= request.getSession().getAttribute("accountBalance") %> </div>
    </div>
    <form action="LogoutController" method="post" class="logout">
        <button type="submit" class="logout-button"><i class="fas fa-sign-out-alt"></i> Logout</button>
    </form>
</nav>

<div class="container">
    <h2>Recharge</h2>
    <div class="form-container">
        <form action="RechargeController" method="post">
            <label for="phone">Phone Number:</label>
            <input type="text" id="phone" name="phone" required><br><br>
            <label for="provider">Service Provider:</label>
            <select id="provider" name="provider">
                <option value="Airtel">Airtel</option>
                <option value="Idea">Idea</option>
                <option value="Jio">Jio</option>
            </select><br><br>
            <input type="submit" value="Recharge" class="submit-button">
        </form>
    </div>
</div>


</body>
</html>
