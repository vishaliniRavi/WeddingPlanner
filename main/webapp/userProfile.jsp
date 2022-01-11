<%@page import="com.weddingplanner.module.User"%>
<%@page import="java.sql.Array"%>
<%@page import="com.weddingplanner.daoimpl.UserDaoimpl"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>profile</title>
<style>
#allusers table,th,tr,td{
        border: 1px solid black;
        border-collapse: collapse;
        padding: 10px;
        }
</style>
</head>
<body>
<% int userId=(int)session.getAttribute("id");
	UserDaoimpl userdao = new UserDaoimpl();
   List<User> userList = new ArrayList<User>();
   userList = userdao.currentuserprofile(userId);
%>
<table border="2" id="allusers">
	<h1><b>Profile</b></h1>
	<thead>
	<tr>
  		<th >S.no</th>
		<th>User name</th>
		<th>Phone number</th>
		<th>Address</th>
		<th>Email address</th>
		<th>Wallet</th>
	</tr>
	</thead>
	<br><br>
<tbody>
<%
int i = 0;
for (User currentuserprofile: userList ) {
i++;

%>
<tr>


<td><%=i%></td>
<td><%=currentuserprofile.getUserName()%></td>
<td><%=currentuserprofile.getMobileNumber()%></td>
<td> <%=currentuserprofile.getCity()%></td>
<td> <%=currentuserprofile.getEmailId()%></td>
<td> <%=currentuserprofile.getWallet()%></td>


</tr>

<%
}
%>
</tbody>
          </table>


</body>
</html>