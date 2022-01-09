<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <% String una=(String) session.getAttribute("booked");%>
          <h2><%=una%></h2>
          <% session.removeAttribute("booked"); %>
          <form action="cancelVenue" method="post">
          <input type="submit" value=cancel>
          
          </form>


</body>
</html>