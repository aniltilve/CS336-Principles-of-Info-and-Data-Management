<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ride Dashboard</title>
</head>
<body>
	<h1>Ride Info</h1>
	<br><br>
    <form action="Logout.jsp">
		<input type="submit" value="Log out" />
	</form>
	
	<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection connection = DriverManager.getConnection(
			"jdbc:mysql://grace-cs-336.c8syinthpsan.us-east-1.rds.amazonaws.com:3306/CS336project", "dcg87", "treeapple#");
	
	PreparedStatement selection = connection.prepareStatement("SELECT * FROM Rides WHERE Status = ?");
	%>
	
	


</body>
</html>