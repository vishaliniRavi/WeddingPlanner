<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
     <h1>Total Package:<%=session.getAttribute("totalPackage")%></h1>
 <% String booked=(String) session.getAttribute("servicebooked");%>
          <h2><%=booked%></h2>
          <% session.removeAttribute("servicebooked"); %>
          <form action="cancelService">
          <input type="submit" value="cancel">
          </form>
</body>
</html>