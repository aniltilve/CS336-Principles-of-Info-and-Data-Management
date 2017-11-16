<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
</head>

<body>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection connection = DriverManager.getConnection(
			"jdbc:mysql://grace-cs-336.c8syinthpsan.us-east-1.rds.amazonaws.com:3306/CS336project", "dcg87", "treeapple#");
	
	String username = request.getParameter("username");

	PreparedStatement update = connection.prepareStatement("UPDATE Users SET Status = 0 WHERE UserName = ?");
	
	update.setString(1, username);
	
	int rowsAffected = update.executeUpdate();
	
	if (rowsAffected == 0)
		out.print("That username does not exist.");
	else
		out.print("The user <b>" + username + "</b> was successfully banned.");
	
	out.print("<br><br><form action=\"SysSupportDash.jsp\"><input type=\"submit\" value=\"Back to Dashboard\"/></form>");
	
	connection.close();
%>
</body>
</html>