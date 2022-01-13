<%@page import="com.weddingplanner.module.Venues"%>
<%@page import="java.util.List"%>
<%@page import="com.weddingplanner.daoimpl.VenuesDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>venues</title>
<link rel="stylesheet" href="style1.css">
<script src="https://kit.fontawesome.com/ae23c8822d.js" crossorigin="anonymous"></script>

<style>

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
<form action="filterCity" method="post">

<nav >
      <input type="text" name="search" class="search">  
      <a  href="FilterCity.jsp"><button>search</button></a>
      <a  href="viewVenues.jsp">Venues</a>
       <a href="viewService.jsp">Services</a>
       <a  href="">About us</a>
       <a  href="">Contact us</a>
       <a  href="login.jsp">Logout</a>
        <a href="MyBooking.jsp">My booking</a>
      
   </nav>
   
 
 
<%!
VenuesDaoimpl venueDaoImpl = new VenuesDaoimpl();
List<Venues> showVenue;%>
<%showVenue=venueDaoImpl.showVenue();        
%>
<%int count=0;
for(Venues venue: showVenue){
   //System.out.println(venue.getVenueImages());
 %>  
  
  

<div class="venue">
      <div class="for-inline">
        <div class="image-container">
             <a href="venue1.jsp?venueName=<%=venue.getVenueName()%>">
              <img src="images/<%=venue.getVenueImages()%>" alt="hall" name="image"></a>
            <div class="title">
                <h2> venue name: <%=venue.getVenueName() %></h2>
                
           </div>
              <pre><i class="fas fa-map-marker-alt"></i> <%=venue.getVenueCity() %>   <i class="fas fa-hotel"></i> <%=venue.getVenueType() %></pre>
        
           </div>
       </div>
      </div>


       <%} %>

 </form>
</body>
</html>