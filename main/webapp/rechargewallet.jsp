<%@page import="com.weddingplanner.module.User"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>recharge wallet</title>
<style type="text/css">
 body
    {
        background-image: url("images/back1.jpg");
        background-size: cover;
    }
 nav a{
        float:center;
        text-decoration: none;
        color:black;
        background-colour:white;
        padding-right: 17px;
        font-size: 17px;
        margin-top: 10px;
    }
</style>
</head>
<body>
<% int user = (int) session.getAttribute("id");%>
<nav>
     <a href="viewVenues.jsp">Venues</a>
        <a href="viewService.jsp">Services</a>
        <a href="">About us</a>
        <a href="">Contact us</a>
        <a href="login.jsp">Logout</a>
       
        <a href="myBooking.jsp">My booking</a>
        
    </nav>

<form action="rechargewallet" method="post">
       <h2>Recharge Your Wallet..</h2><br>


         <label for="emailid">Email address</label><br>
         <input type="email" class="input" name="email"  pattern="[a-z0-9]+[@][a-z]+[.][a-z]+{8,15}" required><br><br>
                 
         <label for="cardnumber">Card Number</label><br>
         <input type="text" class="input" name="cardnumber" pattern ="[1-9]{16}" required><br><br>
                 
         <label for="cvv">CVV</label><br>
         <input type="text" class="input" name="cvv" pattern="[1-9]{3}" required><br><br>
         
         <label for="Amount">Amount</label><br>
         <input type="text" class="input" name="amount" pattern="[1-9][0-9]+" maxlength="5" required><br><br>
          
         <button class="button">Recharge Wallet</button>
    </form>


</body>
</html>