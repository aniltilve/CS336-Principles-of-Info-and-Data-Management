<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>


<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<title>Inbox</title>
</head>

<body>
<%
	Class.forName("com.mysql.jdbc.Driver");
			
	Connection connection = DriverManager.getConnection(
			"jdbc:mysql://grace-cs-336.c8syinthpsan.us-east-1.rds.amazonaws.com:3306/CS336project", 
			"dcg87", "treeapple#");
	
	PreparedStatement selection = connection.prepareStatement(
			"SELECT Sender,EmailSubject,Body,DateTimeReceived FROM Messages WHERE Recepient = ? ORDER BY DateTimeReceived DESC");
	
	selection.setString(1, session.getAttribute("username").toString());
	ResultSet results = selection.executeQuery();
			
	
	if (!results.isBeforeFirst())
		out.print("You have no messages.");
	else{
		while (results.next()){
			String sender = results.getString("Sender"),
					subject = results.getString("EmailSubject"),
					body = results.getString("Body"),
					dateTimeReceived = results.getTimestamp("DateTimeReceived").toString();
			
			out.print("<b>From:</b> " + sender + "<br>" +
				"<b>On:</b> " + dateTimeReceived + "<br>" + 
				"<b>Subject:</b> ");
			
			if (subject == null || subject.isEmpty())
				out.print("<i>no subject</i><br><p>" + body + "</p>");
			else
				out.print(subject + "<p>" + body + "</p>");
		}
	}
	
	out.print("<br><br><form action=\"UserDashboard.jsp\"><input type=\"submit\" value=\"Back to Dashboard\"/></form>");
	
	connection.close();
	results.close();
%>
</body>

</html>