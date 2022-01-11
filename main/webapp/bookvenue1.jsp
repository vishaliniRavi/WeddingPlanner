<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>unavailable</title>
<style>
body
{
text-align:center;
}
</style>
</head>
<body>
    <% String una=(String) session.getAttribute("unavaliable");%>
          <h2><%=una%></h2>
          <% session.removeAttribute("unavaliable"); %>
</body>
</html>