<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="web.login.model.FundTransfer" %>
<%@ page import="web.login.model.Recharge" %>  

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Statement</title>
    <link rel="stylesheet" type="text/css" href="history.css">
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

<div class="container">
    <% 
    List<FundTransfer> fundTransfers = (List<FundTransfer>) request.getAttribute("fundTransfers");
    List<Recharge> recharges = (List<Recharge>) request.getAttribute("recharges");
    %>
    <div class="history-container">
    <!-- Display Recharge History -->
    <div class="history-section">
    <h2>Recharge History</h2>
    <table>
        <thead>
            <tr>
                <th>Phone Number</th>
                <th>Provider</th>
                <th>Plan</th>
                <th>Amount</th>
            </tr>
        </thead>
        <tbody>
            <% if (recharges != null && !recharges.isEmpty()) { 
                for (Recharge recharge : recharges) { %>
                    <tr>
                        <td><%= recharge.getPhoneNumber() %></td>
                        <td><%= recharge.getProvider() %></td>
                        <td><%= recharge.getSelectedPlan() %></td>
                        <td><%= recharge.getPlanAmount() %></td>
                    </tr>
            <%  }
               } else { %>
                <tr>
                    <td colspan="4">No recharge data available.</td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>
        <div class="history-section">

    <!-- Display Fund Transfer History -->
    <h2>Fund Transfer History</h2>
    <table>
        <thead>
            <tr>
                <th>From Account</th>
                <th>To Account</th>
                <th>Amount</th>
            </tr>
        </thead>
        <tbody>
            <% if (fundTransfers != null && !fundTransfers.isEmpty()) { 
                for (FundTransfer transfer : fundTransfers) { %>
                    <tr>
                        <td><%= transfer.getFromAccount() %></td>
                        <td><%= transfer.getToAccount() %></td>
                        <td><%= transfer.getAmount() %></td>
                    </tr>
            <%  }
               } else { %>
                <tr>
                    <td colspan="3">No fund transfer data available.</td>
                </tr>
            <% } %>
        </tbody>
    </table>
    </div>
    </div>

</div>
</body>
</html>
