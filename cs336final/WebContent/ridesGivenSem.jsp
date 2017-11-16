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
			String sem = request.getParameter("ridesGivenSem");
			if (sem.equals("Fall")){
				PreparedStatement stmt = connection.prepareStatement("SELECT COUNT(*) FROM Offers WHERE EXTRACT(month from BeginDateTime) = 'September' + EXTRACT(month from BeginDateTime) = 'October' + EXTRACT(month from BeginDateTime) = 'November' + EXTRACT(month from BeginDateTime) = 'December'");
				
			}else if (sem.equals("Spring")){

				PreparedStatement stmt = "SELECT COUNT(*) FROM Offers WHERE EXTRACT(month from BeginDateTime) = 'January' + EXTRACT(month from BeginDateTime) = 'February' + EXTRACT(month from BeginDateTime) = 'March' + EXTRACT(month from BeginDateTime) = 'April' +  EXTRACT(month from BeginDateTime) = 'May' ");

			}
		
		
			//get count
			ResultSet results = stmt.executeQuery();
			results.first();
			
			out.print(results.getInt("COUNT(*)"));
		%> 
</body>
</html>