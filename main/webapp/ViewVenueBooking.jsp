<%@page import="com.weddingplanner.module.BookingVenues"%>
<%@page import="java.util.List"%>
<%@page import="com.weddingplanner.daoimpl.BookingVenuesDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Venue Bookings</title>
</head>
<body>
 <%!
BookingVenuesDaoimpl venues = new BookingVenuesDaoimpl();
List<BookingVenues> myVenue;%>
<% 
int userId=(int)session.getAttribute("id");
myVenue=venues.userVenueBooking(userId);
session.setAttribute("booking", myVenue);
%>  

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
		
		
		
	</tr>
	</thead>
	
<tbody>
<%
int  i = 0;
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
<%String status=venues.findStatus(bookVenue.getVenueName(), bookVenue.getEventDate()); %>
<td><%=status%></td>




</tr>

<%
}
%>
</tbody>
          </table>
          


</body>
</html>