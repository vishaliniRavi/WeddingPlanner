<%@page import="com.weddingplanner.module.Services"%>
<%@page import="com.weddingplanner.module.BookingServices"%>
<%@page import="java.util.List"%>
<%@page import="com.weddingplanner.daoimpl.BookingServicesDaoimpl"%>
<%@page import="com.weddingplanner.daoimpl.BookingVenuesDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
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
    #allusers table,th,tr,td{
        border: 1px solid black;
        border-collapse: collapse;
        padding: 10px;
        }
</style>
</head>
<body>
<%!

BookingServicesDaoimpl service = new BookingServicesDaoimpl();
List<BookingServices> myService;%>
<% int userId=(int)session.getAttribute("id");
myService=service.MyBooking(userId);
session.setAttribute("booking", myService);
%>
 <nav>
     <a href="viewVenues.jsp">Venues</a>
        <a href="viewService.jsp">Services</a>
        <a href="">About us</a>
        <a href="">Contact us</a>
        <a href="login.jsp">Logout</a>
        <a href="myBooking.jsp">My booking</a>
        <a href="rating.jsp">Rating</a>
       
        
    
  		</nav>
		
	
<% for(BookingServices service:myService){
   %> 
    <form action="RemoveService" method="post">  
    
	<%=service.getServiceName()%><br>
	
	
    service package:<%=service.getServicePackage()%><br>
    event date:<%=service.getEventDate() %><br>

	<%
		session.setAttribute("serviceName", service.getServiceName());
	    session.setAttribute("servicePackage",service.getServicePackage());
	    session.setAttribute("eventDate", service.getEventDate());
		%>
		
		<button type="submit">
			remove</button>
			
		
	</form>
	<form action="serviceBooking" method="post">
		<button type="submit">
			book</button>
	    </form>
			
		
		<%} %>
		
		
</body>
</html>