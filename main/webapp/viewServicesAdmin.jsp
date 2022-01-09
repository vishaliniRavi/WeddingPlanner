<%@page import="com.weddingplanner.module.Services"%>
<%@page import="java.util.*"%>
<%@page import="com.weddingplanner.daoimpl.ServicesDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <% ServicesDaoimpl serviceDao = new ServicesDaoimpl();
   List<Services> serviceList = new ArrayList<Services>();
   serviceList =serviceDao.showServices();
%>  
    
<table border="2" id="allusers">
	<h1><b>All Service List</b></h1>
	<thead>
	<tr>
  		<th >S.no</th>
		<th>service name</th>
		<th>service Package</th>
		<th>Availability</th>
	</tr>
	</thead>
	<br><br>
	<tbody>
<%
int i = 0;
for (Services viewService: serviceList ) {
i++;

%>
<tr>


<td><%=i%></td>
<td><%=viewService.getServiceName()%></td>
<td><%=viewService.getServicePackage()%></td>
<td><%=viewService.getAvailability() %></td>

</tr>

<%
}
%>
</tbody>
          </table><br>
<button type="button"><a href="Services.jsp" style="text-decoration:none">Add Service</a></button>
<button type="button"><a href="deleteService.jsp" style="text-decoration:none">Delete Service</a></button>

	
    

</body>
</html>