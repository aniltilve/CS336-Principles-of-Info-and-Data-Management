<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Getting stats</title>
</head>
<body>

<%
			// connect to DB
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(
					"jdbc:mysql://grace-cs-336.c8syinthpsan.us-east-1.rds.amazonaws.com:3306/CS336project", "dcg87",
					"treeapple#");

			// make SQL query
			PreparedStatement stmt = connection.prepareStatement("SELECT COUNT(*) FROM Rides WHERE Driver = ? AND RideStatus = 2 AND EXTRACT(month from BeginDateTime) = ?");
			String month = request.getParameter("ridesGivenMonth");
			String driver = session.getAttribute("username").toString();
			
			stmt.setString(1, driver);
			stmt.setString(2, month);
		
			//get month 
			ResultSet results = stmt.executeQuery();
			results.first();
			
			out.print(results.getInt("COUNT(*)"));
		%> 
</body>
</html>