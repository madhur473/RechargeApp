<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BlackRock Login</title>
    <link rel="stylesheet" type="text/css" href="common-styles.css">
</head>
<body>
    <div class="container">
        <div class="logo">
            <img src="blackrock-logo-nav.svg" alt="BlackRock Logo" width="150">
        </div>
      
        <h3>Sign in</h3>
        <form action="LoginController">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Continue</button>
        </form>
        <p>By continuing, you agree to BlackRock's Conditions of Use and Privacy Notice.</p>
        <a href="Register.jsp" class="small-button">Create your BlackRock account</a>
        <p>Need help?</p>
        <p>New to BlackRock?</p>
    </div>
</body>
</html>
