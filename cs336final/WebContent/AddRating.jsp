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
<%
	Class.forName("com.mysql.jdbc.Driver");
			
	Connection connection = DriverManager.getConnection(
			"jdbc:mysql://grace-cs-336.c8syinthpsan.us-east-1.rds.amazonaws.com:3306/CS336project", 
			"dcg87", "treeapple#");
	
	PreparedStatement insertion = connection.prepareStatement(
			"INSERT INTO Ratings VALUES");
%>
</body>
</html>