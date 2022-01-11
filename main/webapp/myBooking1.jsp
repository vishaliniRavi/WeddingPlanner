<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {

	background-color: brown;
	height:100%
	width: 100%;
}

nav a {
	float: right;
	text-decoration: none;
	color: white;
	padding-right: 17px;
	font-size: 17px;
	margin-top: 10px; boolean flag = book.checkDate(servicename, eventDate);
		if(flag==false) {
}
</style> 
        	 
</head>
<body>
	<div class="main">
		<nav>
			 <a href="login.jsp">Logout</a> <a href="viewVenues.jsp">Venues</a>
			<a href="viewService.jsp">Services</a> <a href="">About us</a> <a
				href="">Contact us</a> <a href="myBooking.jsp">My booking</a> <a
				href="rating.jsp">Rating</a>
		</nav> <% String checkservice=(String) session.getAttribute("booked");%>
          <h2><%=checkservice%></h2>
          <% session.removeAttribute("booked"); %>
	</div>
</body>
</html>