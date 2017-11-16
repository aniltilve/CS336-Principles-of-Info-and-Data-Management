<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Adding Advertisement</title>
</head>

<body>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection connection = DriverManager.getConnection(
			"jdbc:mysql://grace-cs-336.c8syinthpsan.us-east-1.rds.amazonaws.com:3306/CS336project", "dcg87", "treeapple#");
	
	
	/* TODO: fix.  insert parameters are not in correct order/missing. 
	   
	*/
	
	/* generate advertID. get current number of ads + 1. */
	
	Statement stmt = connection.createStatement();
    ResultSet results = stmt.executeQuery("SELECT COUNT(*) FROM Advertisements");
    results.first();
    
    int nAdvert = results.getInt("COUNT(*)");
	int advertID = nAdvert + 1;		
				
	PreparedStatement insertion = connection.prepareStatement(
			"INSERT INTO Advertisements (AdID,Frequency,Slogan,Copy) VALUES (?,?,?,?)");
	
	
	insertion.setString(1, Integer.toString(advertID));
	insertion.setString(2, "0");
	insertion.setString(3, request.getParameter("slogan"));
	insertion.setString(4, request.getParameter("copy"));

	boolean success = insertion.execute();
	if(success){
		out.print("Added advertisement.");
	}
	
	insertion.close();
	stmt.close();
	results.close();
	connection.close();

	
%>
</body>
</html>