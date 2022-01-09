<%@page import="org.apache.catalina.connector.Request"%>
<%@page import="com.weddingplanner.module.Services"%>
<%@page import="com.weddingplanner.daoimpl.ServicesDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body{
margin-left:300px;
}
img{
margin-top:100px;
 width:400px;
 height:400px;

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
</head>
<body>
<nav>
     <a href="login.jsp">Logout</a>
        <a href="viewVenues.jsp">Venues</a>
        <a href="viewService.jsp">Services</a>
        <a href="">About us</a>
        <a href="">Contact us</a>
       
        <a href="myBooking.jsp">My booking</a>
        <a href="rating.jsp">Rating</a>
    </nav>
	<%!ServicesDaoimpl serviceDaoImpl = new ServicesDaoimpl();%>
	<%
	String serviceName = request.getParameter("servicename");
	session.setAttribute("serviceName", serviceName);

	Services service = serviceDaoImpl.allService(serviceName);
	int serviceId = serviceDaoImpl.findServiceId(serviceName);
	double servicePackage = serviceDaoImpl.findPackage(serviceId);

	session.setAttribute("serviceId", serviceId);
	session.setAttribute("servicePackage", servicePackage);
	%>
	<img src="<%=service.getServiceImages()%>" alt="hall">
	<br>
	<span>service name: <%=service.getServiceName()%>
	</span>
	<br>
	<span> service package:<%=service.getServicePackage()%>
	</span>
	<br>
	<form action="addToService">
	   enter the event date and add your service
		<span><input type="date" name="date" id="date"></span>
		<%
		session.setAttribute("serviceName", service.getServiceName());
		%>

		<button type="submit">
			Add
		</button>
	</form>
	

	
</body>
<script type="text/javascript">
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; 
var yyyy = today.getFullYear();
if(dd<10){
  dd='0'+dd
} 
if(mm<10){
  mm='0'+mm
} 
today = yyyy+'-'+mm+'-'+dd;
document.getElementById("date").setAttribute("min", today);
</script>

</html>