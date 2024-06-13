<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BlackRock</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">


<style>
.navbar {
    display: flex;
    flex-direction: column; /* Change to column direction */
    align-items: center;
    padding: 10px 20px;
    background-color: #333;
    color: #fff;
}

.logout {
    margin: 10px 0; /* Add margin */
}

.links-container {
    text-align: center;
    margin-top: 50px;
}
.links-container a {
    display: block; /* Changed from inline-block to block */
    padding: 15px 30px;
    margin-bottom: 20px;
    background-color: #333;
    color: #fff;
    text-decoration: none;
    font-size: 18px;
    border-radius: 10px;
    transition: background-color 0.3s;
}
.links-container a:hover {
    background-color: #555;
}
 
.logout {
    margin-left: auto;
}
    
.logout-button,
.login-button { /* Apply same styles to both logout and login buttons */
    padding: 10px 20px;
    font-size: 16px;
    border: none;
    background-color: #555;
    color: #fff;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
    text-decoration: none; /* Remove underline */
    display: inline-block; /* Change display to inline-block */
}
.logout-button:hover,
.login-button:hover { /* Apply same hover effect to both logout and login buttons */
    background-color: #777;
}
.account-info {
    position: absolute;
    top: 10px; /* Adjust top position */
    right: 20px; /* Adjust right position */
    text-align: right;
    margin-right: 11%; /* Adjust margin-right for spacing */
    color: black; /* Text color */
    background-color: #f0f0f0; /* Background color */
    padding: 5px; /* Add padding for better readability */
    border-radius: 5px; /* Add border radius for rounded corners */
}

    
</style>

</head>
<body>

<nav>
    <img src="blackrock-logo-nav.svg" alt="Logo">
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
        <!-- Display links for logged-in users -->
        <a href="RechargeView.jsp">Recharge</a>
        <a href="#">Fund Transfer</a>
        <a href="#">Statement</a>
    <% } else { %>
        <!-- Display links for non-logged-in users -->
        <a href="Login.jsp">Recharge</a>
        <a href="Login.jsp">Fund Transfer</a>
        <a href="Login.jsp">Statement</a>
    <% } %>
</div>


</body>
</html>
