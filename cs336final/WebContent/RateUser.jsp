<%@ page language="java" contentType="text/html;"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Rate User</title>
</head>

<body>
	<p>Your ride is now complete! Please rate you driver, <b><%=session.getAttribute("driver").toString()%></b></p>
	
	<%
	Class.forName("com.mysql.jdbc.Driver");
			
	Connection connection = DriverManager.getConnection(
			"jdbc:mysql://grace-cs-336.c8syinthpsan.us-east-1.rds.amazonaws.com:3306/CS336project", 
			"dcg87", "treeapple#");
	
	PreparedStatement update = connection.prepareStatement("UPDATE Rides SET RideStatus = 2 WHERE RideID = ?");
	
	update.setString(1, session.getAttribute("rideID").toString());
	
	update.executeUpdate();
	%>

	<form action="AddRating.jsp" method="GET">
	<b>Rating</b>
		<br>
	<input type="radio" name="frequency" value="1" checked>
  	<input type="radio" name="frequency" value="2">
  	<input type="radio" name="frequency" value="3">
  	<input type="radio" name="frequency" value="4">
  	<input type="radio" name="frequency" value="5">
  		<br><br>
	<b>Comment</b>
		<br>
	<textarea  rows="10" cols="60" maxlength="500" class ="input" name="body"></textarea>
		<br><br>
	<input type="submit" value="Rate"/>
	</form>
	
</body>
</html>