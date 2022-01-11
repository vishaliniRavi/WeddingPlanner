<%@page import="com.weddingplanner.module.BookingVenues"%>
<%@page import="com.weddingplanner.daoimpl.BookingVenuesDaoimpl"%>
<%@page import="com.weddingplanner.module.BookingServices"%>
<%@page import="java.util.List"%>
<%@page import="com.weddingplanner.daoimpl.BookingServicesDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Booking</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
table{
border:none;
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
<form action="cancelService" method="post">
   <table class="table table-hover table-striped">
	<h1><b>Service</b></h1>
	<thead>
	<tr>
  		<th >S.no</th>
		<th>service name</th>
		<th>service package</th>
		<th>Event Date</th>
		<th>Booking date</th>
		<th>status</th>
		<th>cancel order</th>
		
		
	</tr>
	</thead>
	<br><br>
<tbody>
<%
int i = 0;
for (BookingServices bookService: myService ) {
i++;

%>
<tr>


<td><%=i%></td>
<td><%=bookService.getServiceName()%></td>
<%session.setAttribute("serviceBookingName", bookService.getServiceName()); %>
<td><%=bookService.getServicePackage()%></td>
<%session.setAttribute("servicePackageName", bookService.getServicePackage()); %>
 <td> <%=bookService.getEventDate()%></td>
 <%session.setAttribute("serviceEventDate", bookService.getEventDate()); %>
 <td> <%=service.findBookingDate(userId)%></td>
 <%int serviceBooking=service.findBookingServiceId(userId, bookService.getEventDate()); 
session.setAttribute("serviceBooking", serviceBooking);%>
 <%String status=service.findStatus(bookService.getServiceName(),bookService.getEventDate()); %>
<td><%=status%></td>
<td><input type="submit" value=cancel></td>
 

          
          



</tr>

<%
}
%>
</tbody>
          </table>
         
    </form>      
 
          
<%!
BookingVenuesDaoimpl venues = new BookingVenuesDaoimpl();
List<BookingVenues> myVenue;%>
<% 
myVenue=venues.MyBooking(userId);
session.setAttribute("booking", myService);
%>  
<form action="cancelVenue" method="post">
 <table class="table table-hover table-striped" id="allusers">
	<h1><b>Venue</b></h1>
	<thead>
	<tr>
  		<th >S.no</th>
		<th>venue name</th>
		<th>venue package</th>
		<th>Event Date</th>
		<th>Booking date</th>
		<th>status</th>
		<th>cancel your order</th>
		
		
	</tr>
	</thead>
	
<tbody>
<%
 i = 0;
for (BookingVenues bookVenue: myVenue ) {
i++;

%>
<tr>


<td><%=i%></td>
<td><%=bookVenue.getVenueName()%></td>
<%session.setAttribute("venueBookingName", bookVenue.getVenueName()); %>
<td><%=bookVenue.getVenuePackage()%></td>
<%session.setAttribute("venueBookingPackage", bookVenue.getVenuePackage()); %>
<td> <%=bookVenue.getEventDate()%></td>
<%session.setAttribute("venueBookingEventDate", bookVenue.getEventDate()); %>
<td> <%=venues.findVenueBookingDate(userId)%></td>
<%int venueBooking=venues.findBookingVenueId(userId,bookVenue.getEventDate()); 
session.setAttribute("venueBooking", venueBooking);%>
<%String status=venues.findStatus(bookVenue.getVenueName(),bookVenue.getEventDate()); %>
<td><%=status%></td>
<td><input type="submit" value=cancel></td>



</tr>

<%
}
%>
</tbody>
          </table>
           </form>
        

</body>
</html>