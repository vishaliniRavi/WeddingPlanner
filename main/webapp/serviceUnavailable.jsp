<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <% String booked=(String) session.getAttribute("unavailable");%>
          <h2><%=booked%></h2>
          <% session.removeAttribute("unavailable"); %>
            <a href=viewServices.jsp>view services</a>
          

</body>
</html>