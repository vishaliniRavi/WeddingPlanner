<%@page import="com.weddingplanner.module.BookingServices"%>
<%@page import="java.util.*"%>
<%@page import="com.weddingplanner.daoimpl.BookingServicesDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Service Booking List</title>
</head>
<body>
  <body>
<% BookingServicesDaoimpl bookingdao = new BookingServicesDaoimpl();
   List<BookingServices> serviceList = new ArrayList<BookingServices>();
   serviceList = bookingdao.allServiceBooking();
%>
<table border="2" id="allusers">
	<h1><b>service Booking List</b></h1>
	<thead>
	<tr>
  		<th >S.no</th>
  		<th>User Id</th>
		<th>service name</th>
		<th>service package</th>
		<th>Event Date</th>
		<th>Booking Date</th>
		<th>Status</th>
	</tr>
	</thead>
	<br><br>
<tbody>
<%
int i = 0;
for (BookingServices bookservices: serviceList ) {
i++;

%>
<tr>


<td><%=i%></td>
<td><%=bookservices.getUserId() %>
<td><%=bookservices.getServiceName()%></td>
<td><%=bookservices.getServicePackage()%></td>
<td> <%=bookservices.getEventDate()%></td>
<td><%=bookservices.getBookingDate()%></td>
<td><%=bookservices.getServiceStatus() %></td>

</tr>

<%
}
%>
</tbody>
          </table>

    

  
</body>
</html>