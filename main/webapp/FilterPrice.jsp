<%@page import="com.weddingplanner.module.Services"%>
<%@page import="java.util.List"%>
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
   
<nav >
     
      <input type="text" name="byPrice" class="search">  
      <a  href="FilterCity.jsp"><button>search</button></a>
	</nav>
    <%!ServicesDaoimpl serviceDaoImpl = new ServicesDaoimpl();
    List<Services> serviceList;%>
	<%
	Double servicePackage = (Double)session.getAttribute("serviceBookPackage");
	System.out.println(servicePackage);
	session.setAttribute("serviceType", servicePackage);%>
	
	<% serviceList=serviceDaoImpl.filterByPrice(servicePackage);%>
	 
<table>
<tbody>
	<tr>
	<% int count=0;
	for(Services service: serviceList){
	   				System.out.println(service.getServiceTypeImage());
	   	%>
	   	<td>
	   	<table id="service">
	   	<tbody>
	   		<tr>
	   	 <td><a href="service1.jsp?serviceName=<%=service.getServiceName()%>"><img src="images/<%=service.getServiceImages()%>" alt="hall"></a></td>
	   	 <td>    
	   	  <div class="service1">
	   	   service name:<%=service.getServiceName() %>
	   	   service package:<%=service.getServicePackage() %>
	   	   
	   	   
	   	  </div>
	   	  </td>

	   		
	   		</tr>
	   	</tbody>
	   	</table>
	   	</td>
	   	<%count++;
	   	   if(count==3){%>
	   	</tr>
	   	<tr>
	   	<%count=0;
	   	}}%>
	   </tr>
</tbody>
</table>   

</body>
</html>