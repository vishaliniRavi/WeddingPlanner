<%@page import="com.weddingplanner.daoimpl.BookingVenuesDaoimpl"%>
<%@page import="com.weddingplanner.module.BookingVenues"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Bookings</title>
</head>
<body>
    <style>
#allusers table,th,tr,td{
        border: 1px solid black;
        border-collapse: collapse;
        padding: 10px;
        }
</style>
</head>
<body>
<% BookingVenuesDaoimpl bookingdao = new BookingVenuesDaoimpl();
   List<BookingVenues> venueList = new ArrayList<BookingVenues>();
   venueList = bookingdao.allBookings();
%>
<table border="2" id="allusers">
	<h1><b>All User List</b></h1>
	<thead>
	<tr>
  		<th >S.no</th>
  		<th>User Id</th>
		<th>Venue name</th>
		<th>No Of Guest</th>
		<th>Venue Package</th>
		<th>Event Date</th>
		<th>Booking Date</th>
		<th>Status</th>
	</tr>
	</thead>
	<br><br>
<tbody>
<%
int i = 0;
for (BookingVenues bookvenues: venueList ) {
i++;

%>
<tr>


<td><%=i%></td>
<td><%=bookvenues.getUser_id() %>
<td><%=bookvenues.getVenueName()%></td>
<td><%=bookvenues.getNoOfGuest()%></td>
<td> <%=bookvenues.getVenuePackage()%></td>
<td> <%=bookvenues.getEventDate()%></td>
<td><%=bookvenues.getBookingDate() %></td>
<td><%=bookvenues.getStatus() %></td>

</tr>

<%
}
%>
</tbody>
          </table>

    


</body>
</html>