<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Sending Message</title>
</head>

<body>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection connection = DriverManager.getConnection(
			"jdbc:mysql://grace-cs-336.c8syinthpsan.us-east-1.rds.amazonaws.com:3306/CS336project", 
			"dcg87", "treeapple#");
	
	PreparedStatement insertion = connection.prepareStatement(
			"INSERT INTO Messages (EmailSubject,Sender,Recepient,Body) VALUES (?,?,?,?)");

	insertion.setString(1, request.getParameter("subject"));
	insertion.setString(2, session.getAttribute("username").toString());
	insertion.setString(3, request.getParameter("recepient"));
	insertion.setString(4, request.getParameter("body"));
	
	int rowsAffected = insertion.executeUpdate();
	
	if (rowsAffected == 0)
		out.print("That username does not exist.");
	else
		out.print("Email sent successfully");
	
	out.print("<form action=\"UserDashboard.jsp\"><input type=\"submit\" value=\"Back to User Dashboard\"/></form>");
	
	connection.close();
%>
</body>
</html>