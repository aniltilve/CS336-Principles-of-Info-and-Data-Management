<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Advertisement</title>
</head>
<body>


	<%
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(
				"jdbc:mysql://grace-cs-336.c8syinthpsan.us-east-1.rds.amazonaws.com:3306/CS336project", "dcg87",
				"treeapple#");
		
		
		// get number of advertisements 
		Statement stmt = connection.createStatement();
		ResultSet results = stmt.executeQuery("SELECT COUNT(*) FROM Advertisements");
		int nAdvert = results.getInt("COUNTER");
		
		int advertID = (int)Math.random()*nAdvert+1;
		
		// get advertisement 
		results = stmt.executeQuery("SELECT Copy FROM Advertisements WHERE AdID = " + advertID);
		String advertText = results.getString("Copy");
		
		// show advertisement
		out.print(advertText);
		
		//update frequency
		stmt.executeQuery("UDPATE Advertisements SET Frequency = Frequency + 1 WHERE AdID = " + advertID);
		
		
		connection.close();
		results.close();
		
		
	%>
</body>
</html>