<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Advertisement Report</title>
</head>
<body>

	<%
		/* make a table that shows each slogan and its number of views (frequency) */

		Class.forName("com.mysql.jdbc.Driver");

		Connection connection = DriverManager.getConnection(
				"jdbc:mysql://grace-cs-336.c8syinthpsan.us-east-1.rds.amazonaws.com:3306/CS336project", "dcg87",
				"treeapple#");
		
		PreparedStatement selection = connection.prepareStatement("SELECT * FROM Advertisements");
		
		// get advertisements 
		ResultSet results = selection.executeQuery();
	

		// show report 
		if (!results.next()) {
			out.print("No advertisements.<br><br><form action=\"SysSupportDash.jsp\"><input type=\"submit\" value=\"Back\"/></form>");
		}else{
			
			//TODO: loop to generate each ad + its info
			results.first();
			out.print("AdID Frequency Slogan Copy");
			while (results.next()){
				String advertID = results.getString("AdID");
				String frequency =  results.getString("Frequency");
				String slogan =  results.getString("Slogan");
				String copy =  results.getString("Copy");
				out.print(advertID + " " + frequency + " " + slogan + copy + "<br>" );
			}
			out.print("<form action=\"SysSupportDash.jsp\"><input type=\"submit\" value=\"Back\"/></form>");
		}
		

		
		
		
		
		
		
		connection.close();
		results.close();
	%>
</body>
</html>