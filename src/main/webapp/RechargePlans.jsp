<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Recharge</title>
    <link rel="stylesheet" type="text/css" href="stylesro.css">
</head>
<body>
<div class="container">
    <h2>Recharge</h2>
          <div>Account Number: <%= session.getAttribute("AccountNumber") %></div>
    		<div>Username: <%= session.getAttribute("Username") %></div>
        <div id="balance">Total Account Balance: ₹ <%=request.getSession().getAttribute("accountBalance") %> </div> 
        <div class="form-container">
        <label>Phone Number: <%= session.getAttribute("phone") %> </label>
        <label>Service Provider: <%= session.getAttribute("provider") %></label>
</div>
    
        <table>
            <tr>
                <th>Plan</th>
                <th>Validity</th>
                <th>TalkTime</th>
                <th>Data</th>
                <th>Amount</th>
            </tr>
            <tr>
                <td>Plan 1</td>
                <td>30 days</td>
                <td>Unlimited</td>
                <td>Unlimited</td>
            <td><form action="RechargeFinalController" method="post"><input type="hidden" name="plan" value="plan1"><button type="submit" class="plan-button">₹100</button></form></td>

            </tr>
            <tr>
                <td>Plan 2</td>
                <td>30 days</td>
                <td>200 minutes</td>
                <td>4GB</td>
            <td><form action="RechargeFinalController" method="post"><input type="hidden" name="plan" value="plan2"><button type="submit" class="plan-button">₹50</button></form></td>
            </tr>
 			<tr>
                <td>Plan 3</td>
                <td>30 Days</td>
                <td>Unlimited</td>
                <td>10 GB</td>
                <td><form action="RechargeFinalController" method="post"><input type="hidden" name="plan" value="plan3"><button type="submit" class="plan-button">₹147</button></form></td>
            </tr>
            <tr>
                <td>Plan 4</td>
                <td>28 Days</td>
                <td>Unlimited</td>
                <td>1.5 GB / Day</td>
                <td><form action="RechargeFinalController" method="post"><input type="hidden" name="plan" value="plan4"><button type="submit" class="plan-button">₹187</button></form></td>
            </tr>
            <tr>
                <td>Plan 5</td>
                <td>70 Days</td>
                <td>Unlimited</td>
                <td>2 GB / Day</td>
                <td><form action="RechargeFinalController" method="post"><input type="hidden" name="plan" value="plan5"><button type="submit" class="plan-button">₹197</button></form></td>
            </tr>
            <tr>
                <td>Plan 6</td>
                <td>150 Days</td>
                <td>10 Hours</td>
                <td>-</td>
                <td><form action="RechargeFinalController" method="post"><input type="hidden" name="plan" value="plan6"><button type="submit" class="plan-button">₹397</button></form></td>
            </tr>
            <tr>
                <td>Plan 7</td>
                <td>65 Days</td>
                <td>Unlimited</td>
                <td>10 GB</td>
                <td><form action="RechargeFinalController" method="post"><input type="hidden" name="plan" value="plan7"><button type="submit" class="plan-button">₹319</button></form></td>
            </tr>
            <tr>
                <td>Plan 8</td>
                <td>26 Days</td>
                <td>Unlimited</td>
                <td>26 GB</td>
                <td><form action="RechargeFinalController" method="post"><input type="hidden" name="plan" value="plan8"><button type="submit" class="plan-button">₹153</button></form></td>
            </tr>
            <tr>
                <td>Plan 9</td>
                <td>75 Days</td>
                <td>Unlimited</td>
                <td>2 GB / Day</td>
                <td><form action="RechargeFinalController" method="post"><input type="hidden" name="plan" value="plan9"><button type="submit" class="plan-button">₹499</button></form></td>
            </tr>
            <tr>
                <td>Plan 10</td>
                <td>28 Days</td>
                <td>Unlimited</td>
                <td>1.5 GB / Day</td>
                <td><form action="RechargeFinalController" method="post"><input type="hidden" name="plan" value="plan10"><button type="submit" class="plan-button">₹139</button></form></td>
            </tr>
            <tr>
                <td>Plan 11</td>
                <td>52 Days</td>
                <td>Unlimited</td>
                <td>1 GB / Day</td>
                <td><form action="RechargeFinalController" method="post"><input type="hidden" name="plan" value="plan11"><button type="submit" class="plan-button">₹298</button></form></td>
            </tr>
            <tr>
                <td>Plan 12</td>
                <td>70 Days</td>
                <td>Unlimited</td>
                <td>1 GB / Day</td>
                <td><form action="RechargeFinalController" method="post"><input type="hidden" name="plan" value="plan12"><button type="submit" class="plan-button">₹399</button></form></td>
            </tr>
        </table>
</div>

</body>
</html>
