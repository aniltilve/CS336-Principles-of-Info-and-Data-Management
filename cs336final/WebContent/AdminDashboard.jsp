<%@ page language="java" contentType="text/html;"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<title>Administrator Dashboard</title>
</head>

<body>
    <h1>Welcome back, <%=session.getAttribute("firstName").toString()%>!</h1> 
    <form action="Logout.jsp">
		<input type="submit" value="Log out" />
	</form>

	<h2>Create System Support Account</h2>
	<form action="NewUser.jsp" method="POST">
	<b>First name</b>
		<br> 
	<input type="text" name="firstname" placeholder="Enter a first name" required maxlength="20">
		<br><br>
	<b>Last name</b>
		<br>
	<input type="text" name="lastname" placeholder="Enter a last name" required maxlength="20">
		<br><br>
	<b>Username</b>
		<br>
	<input type="text" name="username" placeholder="Enter a username" required maxlength="20">
		<br><br>
	<b>Email</b>
		<br>
	<input type="text" name="email" placeholder="Enter email" required maxlength="255">
    	<br><br>
	<b>Password</b>
		<br> 
	<input type="password" name="password" placeholder="Enter a password" required maxlength="20">
		<br><br>
	<input type="hidden" name="userType" value="1">
	<br>
	
	<h2>View Statistics</h2>
	
	Get ride statistics based on
	<form>
	<input type="checkbox">day<br>
	</form>
</body>
</html>