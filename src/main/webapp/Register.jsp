<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Here!!!</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #D8EFD3; /* Light greenish background */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            background-color: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 90%;
        }
        .logo {
            margin-bottom: 20px;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }
        .radio-group {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        label {
            margin-right: 10px;
        }
        button {
            width: 100%;
            padding: 12px;
            margin: 5px 0;
            background-color: #4CAF50; /* Green button */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #45a049; /* Darker green on hover */
        }
        p {
            font-size: 14px;
            color: #555;
            margin-top: 20px;
        }
        .already-account {
            margin-top: 10px;
            font-size: 14px;
        }
        .small-button {
            display: inline-block;
            text-decoration: none;
            background-color: #D8EFD3; /* Light green background */
            color: #333;
            padding: 10px 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            transition: background-color 0.3s;
        }
        .small-button:hover {
            background-color: #C0E6C9; /* Darker green on hover */
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Register Here!!!</h2>
    <form action="RegisterController" method="post">
        
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
            <button type="submit">Register Here</button>
        </div>
        
    </form>
    
    <div class="already-account">
        Already have an Account? <a href="Login.jsp" class="small-button">Sign in</a>
    </div>
</div>

</body>
</html>
