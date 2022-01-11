<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% String validateDate=(String) session.getAttribute("notCancelled");%>
          <h2><%=validateDate%></h2>
          <% session.removeAttribute("notCancelled"); %>
            <a href=viewService.jsp>view services</a>

</body>
</html>