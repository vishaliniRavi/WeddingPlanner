<%@page import="com.weddingplanner.module.Services"%>
<%@page import="java.util.List"%>
<%@page import="com.weddingplanner.daoimpl.ServicesDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>show service</title>
</head>
<style>
	img
	{
		height:250px;
		width:280px;
		overflow:hidden;
	}
	span{
		position : relative;
		top:330px;
		left: 50px;
	}
	table td{
		padding: 20px 10px;
	}	
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
</style>
<body>
<form action="filterPrice" method="post">
<nav >
     
      <input type="text" name="byPrice" class="search">  
      <a  href="FilterPrice.jsp"><button>search</button></a>
	</nav>
	</form>
    <%!ServicesDaoimpl serviceDaoImpl = new ServicesDaoimpl();
    List<Services> serviceList;%>
	<%
	String serviceType = request.getParameter("serviceType");
	System.out.println(serviceType);
	session.setAttribute("serviceType", serviceType);%>
	
	<% serviceList=serviceDaoImpl.showServiceList(serviceType);%>
	 
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