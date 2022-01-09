<%@page import="com.weddingplanner.module.Venues"%>
<%@page import="java.util.List"%>
<%@page import="com.weddingplanner.daoimpl.VenuesDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%!
VenuesDaoimpl venueDaoImpl = new VenuesDaoimpl();
List<Venues> showVenue;%>
<%/*  String venueName=(String)session.getAttribute("venuename");
showVenue=venueDaoImpl.allVenue(venueName); */
 String venuename=request.getParameter("venueName");
System.out.println("jap page"+venuename);
Venues venue= venueDaoImpl.allVenue(venuename);
 System.out.println(venue);
 int venueId=venueDaoImpl.findVenueId(venue.getVenueName());
 System.out.println(venueId);
 double venuepackage=venueDaoImpl.findPackage(venueId);
 System.out.println(venuepackage);
 session.setAttribute("venuename",venuename );
 session.setAttribute("venueId", venueId);
 session.setAttribute("venuepackage", venuepackage);

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/ae23c8822d.js" crossorigin="anonymous"></script>

<style>
#{
margin:0;
padding:0;
}
body{
margin-left:25px;
}
img{

}
.venue{
margin:-3rem;
    background-color:white;
    position:relative;
    overflow: hidden;
    position:relative;
    border-radius:5px;
    box-shadow:0 .5px 1px rgba(0,0,0,.9);
    height:200px;
    width:550px;
    margin-left: 320px;
}
img {
margin-top:100px;
border-radius:5px;
position:relative;
width:600px;
height:300px;
margin-right:300px;
margin-left:300px;
padding-right:100px;
justify-content:center;
text-align:center;
}
    body
    {
        background-image: url("images/back1.jpg");
        background-size: cover;
       
    }
    nav{
                
            margin: 0;
            padding:15px 10px;
            background-color: rgb(180,180,180);
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
    .book{
    margin-top:300;
        width:360px;
    height:280px;
    margin:auto;
    background-color:aliceblue;
    border-radius:6px ;
    float:right;
    }
    button{
    text-decoration:none;
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
    


    <form action="" method="post">
   
    <img src="<%=venue.getVenueImages()%>" alt="hall"><br>
     <div class=venue>
             <h1> <%=venue.getVenueName() %></h1>
                     <pre><i class="fas fa-map-marker-alt"></i> <%=venue.getVenueArea()%>,<%=venue.getVenueCity() %>   <i class="fas fa-hotel"></i> <%=venue.getVenueType() %></pre>
             <pre><i class="fas fa-phone"></i> <%=venue.getContactNumber() %>        <i class="fas fa-rupee-sign"></i><%=venue.getVenuePackage() %>   <br>
            <span>venue vendor name:<%=venue.getVenueVendorName() %></span>
             <%
		session.setAttribute("venueName",venue.getVenueName() );
		%>
              For booking click here: <button type="button"><a href="bookvenue.jsp">book</a></button>
            </div>
     
               </form>
                              
</body>
</html>