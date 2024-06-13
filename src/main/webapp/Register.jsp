<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Here!!!</title>
<link rel="stylesheet" type="text/css" href="common-styles.css">
<style>
    form {
        margin-top: 1%;
    }
</style>
</head>
<body>
    <form action="RegisterController">
        <h2>Register Here!!!</h2>
        
        <div>
            <label for="accNumber">Registration Number:</label>
            <input type="text" id="accNumber" name="accNumber" required>
        </div>
        
        <div>
            <label for="accFname">First Name:</label>
            <input type="text" id="accFname" name="accFname" required>
        </div>
        
        <div>
            <label for="accUname">User Name:</label>
            <input type="text" id="accUname" name="accUname" required>
        </div>
        
        <div>
            <label for="accPassword">Password:</label>
            <input type="password" id="accPassword" name="accPassword" required>
        </div>
        
        <div class="radio-group">
            <label for="gender">Gender:</label>
            <label><input type="radio" name="gender" value="Male"> Male</label>
            <label><input type="radio" name="gender" value="Female"> Female</label>
        </div>
        
        <div>
            <label for="email">Email:</label>
            <input type="text" id="email" name="email" required>
        </div>
        
        <div>
            <label for="phone">Phone Number:</label>
            <input type="text" id="phone" name="phone" required>
        </div>
        
        <div>
            <label for="accBal">Account Balance:</label>
            <input type="text" id="accBal" name="accBal" required>
        </div>
        
<div style="text-align: center;">
    <input type="submit" value="Register Here" />
</div>    </form>
    
    <div class="already-account">
        Already have an Account? <a href="Login.jsp">Sign in</a>
    </div>
</body>
</html>
