<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="updateService" method="post">
     <label>Service name</label>
     <input type="text" name="serviceName">
     <label>Service Package</label>
     <input type="number" name="servicePackage">
     <label>service Image</label>
     <input type="file" name="serviceImage">
     <label>service type</label>  
     <input type="text" name="serviceType">
     <label></label>
     <input type="submit" value= "Update">
</form>
</body>
</html>