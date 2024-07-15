<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fund Transfer</title>
    <link rel="stylesheet" type="text/css" href="stylesfu.css">
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
    <h1>Fund Transfer</h1>
    <form action="FundController" method="post">
        <div class="to">
            Recipient Account: <input type="text" name="toAccount"><br>
        </div>
        <div class="to">
            Recipient Name: <input type="text" name="recipientName"><br>
        </div>
        <div class="amount">
            Amount: <input type="text" name="amount"><br>
        </div>
        <input type="submit" value="Transfer Funds" class="submit-button">
    </form>

    <c:if test="${not empty error}">
        <p style="color: red;">${error}</p>
    </c:if>
</div>

</body>
</html>
