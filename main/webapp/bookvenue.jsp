<%@page import="com.weddingplanner.module.Venues"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
.login-box{
   width:390px;
    height:400px;
    margin:auto;
    background-color: BDB9B8;
    border-radius:15px;
    
}

h1{
    text-align:center;
    padding-top:15px;
}
form{
    padding:50px;
    width:300px;
    margin-left:20px;
}
form label{
    display:flex;
    margin-top:30px;
    font-size:18px;
}
form input{
    width:300px;
    padding:7px;
    border:none;
    border:1px solid gray;
    border-radius: 6px;
    outline:none;
}
input[type="submit"]{
    width: 250px;
    height:35px;
    margin-top: 20px;
    margin_right:40px;
    border:none;
    background-color: BDB9B8;
    color:black;
    font-size:18px;
}
</style>
</head>
<body>
<%!Venues venue=new Venues(); %>
<nav>
     <a href="login.jsp">Logout</a>
        <a href="viewVenues.jsp">Venues</a>
        <a href="viewService.jsp">Services</a>
        <a href="">About us</a>
        <a href="">Contact us</a>
       
        <a href="myBooking.jsp">My booking</a>
        <a href="rating.jsp">Rating</a>
    </nav>
<form action="book" method="post" class="login-box"  >
         <h1>Book Venue</h1>
          <label>venue Name:</label>
            <input type="text" id="name"  name="venuename" value="<%=session.getAttribute("venueName")%>"  placeholder="" required>
            <label>No.of.guest:</label>
            <input type="number" id="number" name="noOfGuest" placeholder=""  required>
            <label>Event date</label>
            <input type="date"  name="eventDate" id="datefield" required>
            <input type="submit" value="Book">
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
document.getElementById("datefield").setAttribute("min", today);
</script>

</html>