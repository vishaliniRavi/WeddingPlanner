<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Inactive</title>
</head>
<body>
<form action="update" method="post">
    venue name:<input type="text" name="venueName"><br>
    Venue vendor name:<input type="text" name="venueVendorName" values=""><br>
    contact number:<input type="number" name="contactNumber"> <br>
    Venue Image:<input type="file" name="venueImage"><br>
    venue package:<input type="number" name="venuePackage"><br>
    <input type="submit" value="Update">
   </form>

</body>
</html>