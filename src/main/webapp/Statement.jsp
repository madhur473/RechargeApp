<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account Statement</title>
<style>
    body {
        background-color: ;
    }

    table {
        margin: 40px auto;
        width: 80%;
        border-collapse: collapse;
    }

    table, th, td {
        border: 1px solid black;
    }

    th, td {
        padding: 10px;
        text-align: left;
    }

    th {
        background-color: #D8EFD3;
    }

    h1 {
        text-align: center;
    }
</style>
</head>

<body>
    <h1>Account Statement</h1>
    <table>
        <thead>
            <tr>
                <th>Date</th>
                <th>Transaction Type</th>
                <th>Amount</th>
                <th>Recipient/Sender</th>
                <th>Balance</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="transaction" items="${transactionHistory}">
                <tr>
                    <td>${transaction.date}</td>
                    <td>${transaction.type}</td>
                    <td>${transaction.amount}</td>
                    <td>${transaction.recipientOrSender}</td>
                    <td>${transaction.balance}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <c:if test="${not empty error}">
        <p style="color: red; text-align: center;">${error}</p>
    </c:if>
</body>
</html>
