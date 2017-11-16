<%@ page language="java" contentType="text/html;"%>
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
			"jdbc:mysql://grace-cs-336.c8syinthpsan.us-east-1.rds.amazonaws.com:3306/CS336project", "dcg87", "treeapple#");;

	PreparedStatement update = connection.prepareStatement("UPDATE Users SET UserPassword = ? WHERE username = ?");
	
	update.setString(1, request.getParameter("username"));
	update.setString(2, request.getParameter("password"));

	if (update.executeUpdate() == 0)
		out.print("That username does not exist.");
	else{
		String username = request.getParameter("username");
		out.print("User <b>" + username + "</b>'s password was successfully reset.");
	}
	
	out.print("<br><br><form action=\"UserDashboard.jsp\"><input type=\"submit\" value=\"Back to Admin Dashboard\"/></form>");
	
	connection.close();
%>
</body>
</html>