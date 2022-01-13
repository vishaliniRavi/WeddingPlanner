<%@page import="java.sql.ResultSet"%>
<%@page import="com.weddingplanner.daoimpl.ServicesDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Services</title>
<style>                                           
form{
            text-align: center;
            margin-top:25px;
        }
</style>
</head>
<body>
<form action="insertServices" method="post">
service name:<input type="text" name="serviceName"><br><br>
service package:<input type="number" name="servicePackage"><br><br>
service image:<input type="file" name="image"><br><br>
service type:<input type="text" name="type"><br><br>
service description:<input type="text" name="description">
service Type image:<input type="file" name="serviceTypeImage">
<input type="submit" value="submit">
</form>
</body>
</html>


