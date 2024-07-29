<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Statement</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
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
    <h1>Transaction Statement</h1>
    
    <h2>Fund Transfers</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>From Account</th>
                <th>To Account</th>
                <th>Amount</th>
                <th>Date</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="transfer" items="${fundTransfers}">
                <tr>
                    <td>${transfer.id}</td>
                    <td>${transfer.fromAccount}</td>
                    <td>${transfer.toAccount}</td>
                    <td>${transfer.amount}</td>
                    <td>${transfer.transferDate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <h2>Recharges</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Phone Number</th>
                <th>Provider</th>
                <th>Amount</th>
                <th>Date</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="recharge" items="${recharges}">
                <tr>
                    <td>${recharge.id}</td>
                    <td>${recharge.phoneNumber}</td>
                    <td>${recharge.provider}</td>
                    <td>${recharge.planAmount}</td>
                    <td>${recharge.rechargeDate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
