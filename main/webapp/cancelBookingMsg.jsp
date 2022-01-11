<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>cancelVenue</title>
<style>
body{
    
     background-image: url("images/back1.jpg");
        background-size: cover;
    }
    .set{
    text-align:center;
    font-size:30px;
    margin-top:250px;
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
<nav>
  <a href="viewVenues.jsp">Venues</a>
        <a href="viewService.jsp">Services</a>
        <a href="">About us</a>
        <a href="">Contact us</a>
        <a href="login.jsp">Logout</a>
       
        <a href="myBooking.jsp">My booking</a>
        <a href="rating.jsp">Rating</a>
    </nav>
    Your Wallet Amount:<%=session.getAttribute("cancelVenue") %><br>
   20% of amount is deducted
    After refund Wallet balance:<%=session.getAttribute("cancelRefundVenue") %>
<% String una=(String) session.getAttribute("cancelled");%>
          <h2><%=una%></h2>
          <% session.removeAttribute("cancelled"); %>
         
          
</body>
</html>