<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>


<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Verification</title>
</head>

<body>
<%
	Class.forName("com.mysql.jdbc.Driver");
			
	Connection connection = DriverManager.getConnection(
			"jdbc:mysql://grace-cs-336.c8syinthpsan.us-east-1.rds.amazonaws.com:3306/CS336project", 
			"dcg87", "treeapple#");
			
   	String username = request.getParameter("username");
   	
	PreparedStatement selection = connection.prepareStatement(
			"SELECT Username,Name,UserType,Status FROM Users WHERE Username = ? AND UserPassword = ?");
	
	selection.setString(1, username);
	selection.setString(2, request.getParameter("password"));
	
	ResultSet results = selection.executeQuery();

	if (!results.next()){
		out.print("You entered invalid credentials.<br><br>");
		out.print("<form action=\"Logout.jsp\"><input type=\"submit\" value=\"Back to Login\"/></form>");
	}
	else if (results.getInt("Status") == 0)
		out.print("You have been banned for misconduct. Please contact an system support member to resolve this issue.<br><br><form action=\"Logout.jsp\"><input type=\"submit\" value=\"Back to Login\"/></form>");
	else{		
		int userType = results.getInt("UserType");
		String firstName = results.getString("Name");
		firstName = firstName.substring(0,firstName.indexOf(" "));
		
		session.setAttribute("username", username);
		session.setAttribute("firstName", firstName);
		connection.close();
		
		if (userType == 2)
			response.sendRedirect("UserDashboard.jsp");
		else if (userType == 1)
			response.sendRedirect("SysSupportDash.jsp");
		else
			response.sendRedirect("AdminDashboard.jsp");
	}
	
	connection.close();
	results.close();
%>
</body>

</html>