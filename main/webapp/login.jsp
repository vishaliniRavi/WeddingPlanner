<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="style1.css">
<style>
h3{
text-align:center;
}
body{
    background-image: url("images/login.jpeg");
    background-size:1370px 653px;
   
}
</style>
</head>
<body class="bd">
    <div class="login-box">
        <h1>Login</h1>
        <form action="login" method="post">
           <label>Email</label>
           <input type="email" name="email" placeholder="" required>
           <label>Password</label>
           <input type="password" name="password" placeholder="" required>
           <input type="submit" value="Sumbit"><br>
            <% String log=(String) session.getAttribute("login");
        if(log!=null) 
        {%>
        <h3><%=log %></h3>
        <% } %>
       <% session.removeAttribute("login"); %>
        </form>
    </div>
        <p class="para">Not have an account?<a href="register.jsp">Sign up here</a></p>
       
</html>