<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Recharge</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffe67f;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 60%;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .form-container {
            text-align: center;
        }
        #balance {
            float: right;
            font-weight: bold;
        }
        label {
            display: inline-block;
            width: 150px;
            text-align: right;
        }
        input[type="text"], select {
            width: 200px;
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-bottom: 10px;
        }
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        table {
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
        .plan-button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .plan-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Recharge</h2>
        <div>Account Number: <%= session.getAttribute("AccountNumber") %></div>
    	<div>Username: <%= session.getAttribute("Username") %></div>
        <div id="balance">Total Account Balance: ₹ <%=request.getSession().getAttribute("accountBalance") %> </div> 
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
           <input type="submit" value="Submit">
            
            </form>
            
        </div>    
</div>

</body>
</html>
