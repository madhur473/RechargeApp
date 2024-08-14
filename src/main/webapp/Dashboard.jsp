<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BlackRock</title>
<link rel="stylesheet" type="text/css" href="stylesd.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>

<nav class="navbar">
    <div class="logo">
        <img src="blackrock-logo-nav.svg" alt="Logo">
    </div>
    <% if (session.getAttribute("Username") != null) { %>
        <div class="account-info">
            <div>Account Number: <%= session.getAttribute("AccountNumber") %></div>
            <div>Username: <%= session.getAttribute("Username") %></div>
            <div id="balance">Total Account Balance: ₹ <%= request.getSession().getAttribute("accountBalance") %> </div>
        </div>
        <form action="LogoutController" method="post">
            <button type="submit" class="logout-button"><i class="fas fa-sign-out-alt"></i> Logout</button>
        </form>
    <% } else { %>
        <form action="Login.jsp">
            <button type="submit" class="login-button"><i class="fas fa-sign-in-alt"></i> Login</button>
        </form>
    <% } %>
</nav>

<div class="marquee-container">
    <marquee>Welcome to BlackRock Funds Management</marquee>
</div>

<div class="links-container">
    <% if (session.getAttribute("Username") != null) { %>
        <a href="RechargeView.jsp">Recharge</a>
        <a href="FundTransfer.jsp">Fund Transfer</a>
		<a href="StatementController">Statement</a>
    <% } else { %>
        <a href="Login.jsp">Recharge</a>
        <a href="Login.jsp">Fund Transfer</a>
        <a href="Login.jsp">Statement</a>
    <% } %>
</div>

</body>
</html>
