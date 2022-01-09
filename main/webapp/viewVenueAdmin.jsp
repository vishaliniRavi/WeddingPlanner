
<%@page import="com.weddingplanner.module.Venues"%>
<%@page import="java.util.*"%>
<%@page import="com.weddingplanner.daoimpl.VenuesDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
#allusers table,th,tr,td{
        border: 1px solid black;
        border-collapse: collapse;
        padding: 10px;
        }
 button{
 text decoration:none;
 }
</style>
</head>
<body>
  <% VenuesDaoimpl venueDao = new VenuesDaoimpl();
   List<Venues> venueList = new ArrayList<Venues>();
   venueList = venueDao.showVenue();
%>  
<table border="2" id="allusers">
	<h1><b>All Venue List</b></h1>
	<thead>
	<tr>
  		<th >S.no</th>
		<th>Venue name</th>
		<th>Venue Area</th>
		<th>Venue City</th>
		<th>Venue Vendor name</th>
		<th>Contact number</th>
		<th>Venue Type</th>
		<th>Availabilty</th>
		<th>Venue Package</th>
	</tr>
	</thead>
	<br><br>
	<tbody>
<%
int i = 0;
for (Venues viewVenues: venueList ) {
i++;

%>
<tr>


<td><%=i%></td>
<td><%=viewVenues.getVenueName()%></td>
<td><%=viewVenues.getVenueArea()%></td>
<td> <%=viewVenues.getVenueCity()%></td>
<td> <%=viewVenues.getVenueVendorName()%></td>
<td> <%=viewVenues.getContactNumber()%></td>
<td><%=viewVenues.getVenueType()%></td>
<td><%=viewVenues.getAvailability()%></td>
<td><%=viewVenues.getVenuePackage()%></td>
</tr>

<%
}
%>
</tbody>
          </table><br>
<button type="button"><a href="venues.jsp" style="text-decoration:none">Add Venue</a></button>
<button type="button"><a href="updateVenue.jsp" style="text-decoration:none">Update Venue</a></button>
<button type="button"><a href="delete.jsp" style="text-decoration:none">Delete Venue</a></button>


	
   

</body>
</html>