<%@page import="com.weddingplanner.module.Services"%>
<%@page import="java.util.List"%>
<%@page import="com.weddingplanner.daoimpl.ServicesDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>service</title>
<link rel="stylesheet" href="style.css">


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
</head>
<body>
<%!
ServicesDaoimpl serviceDaoImpl = new ServicesDaoimpl();
List<Services> showservices ;%>
<%showservices=serviceDaoImpl.showServiceType(); 
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
<table>
<tbody>
	   <tr>
         <p>Service Details</p>
         
				<% int count=0;
					for(Services service: showservices){
	   				System.out.println(service.getServiceTypeImage());
                	%>
                    <td>
                        <table>
                            <tbody>
                                <tr>
                                    <td><a href="ShowService.jsp?serviceType=<%=service.getServiceType()%>"><img src="images/<%=service.getServiceTypeImage()%>" alt="hall"></a></td>    
                                    <span>Service Type : <%=service.getServiceType() %></span><br>  
                                                                      
                                    </td>
                                </tr>
                            </tbody>
                        </table>  
                            
                    </td>
                       <% count ++;
                       if(count==3){ %> 
                    	   </tr>
                    	   <tr>              
                     <%count=0; }}%>  
                       
                </tr>
</tbody>
</table>

</body>
</html>