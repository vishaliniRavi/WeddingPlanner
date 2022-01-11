<%@page import="com.weddingplanner.module.Venues"%>
<%@page import="java.util.List"%>
<%@page import="com.weddingplanner.daoimpl.VenuesDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<script src="https://kit.fontawesome.com/ae23c8822d.js" crossorigin="anonymous"></script>

<style>
 body
    {
        background-image: url("images/back1.jpg");
        background-size: cover;
    }
img
	{
		padding :40px 10px;	
		height:250px;
		width:280px;
		overflow:hidden;
		padding-left :35px; 
	}




	
	table td{
		padding: 20px 10px;
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
    .content{
    margin-left: 50px;
    margin-top: -20px;
    }
  </style>
</head>
<body>
    <nav >
     <div class="container">
      <input type="text" name="search" class="search">  
      <a  href="FilterCity.jsp"><button>search</button></a>
      <a  href="viewVenues.jsp">Venues</a>
       <a href="viewService.jsp">Services</a>
       <a  href="">About us</a>
       <a  href="">Contact us</a>
       <a  href="login.jsp">Logout</a>
        <a href="myBooking.jsp">My booking</a>
    </div>     
   </nav>
   
 
 <form action="filterCity" method="post">
<%!int count=0;
VenuesDaoimpl venueDaoImpl = new VenuesDaoimpl();
List<Venues> showVenue;%>
<%showVenue=venueDaoImpl.showVenue();        
%>

  
<table>
<tbody>
          <tr>
          <%int count=0;
          for(Venues venue: showVenue){
   		  //System.out.println(venue.getVenueImages());
 		   %>     
 		  <td>
          <table>
          <tbody>
          <tr>
         
            <td><a href="venue1.jsp?venueName=<%=venue.getVenueName()%>">
            	<img src="images/<%=venue.getVenueImages()%>" alt="hall" name="image"></a>
           
            <div class="content">
            	<h2> venue name: <%=venue.getVenueName() %></h2>
            	<pre><i class="fas fa-map-marker-alt"></i> <%=venue.getVenueCity() %>   <i class="fas fa-hotel"></i> <%=venue.getVenueType() %></pre></td>
        </div>	
        
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
 </form>
</body>
</html>