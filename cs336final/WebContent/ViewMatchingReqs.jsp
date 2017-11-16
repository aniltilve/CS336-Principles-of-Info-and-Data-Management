<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>


<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<title>Matching Requests</title>
</head>

<body>
<%
	Class.forName("com.mysql.jdbc.Driver");
			
	Connection connection = DriverManager.getConnection(
			"jdbc:mysql://grace-cs-336.c8syinthpsan.us-east-1.rds.amazonaws.com:3306/CS336project", 
			"dcg87", "treeapple#");
	
	PreparedStatement selection = connection.prepareStatement("SELECT * FROM Offers WHERE User = ?");
	
	selection.setString(1, session.getAttribute("username").toString());
	ResultSet offers = selection.executeQuery();
	
	if (!offers.isBeforeFirst()){
		out.print("You have not submitted any ride offers.<br><br>");
	}
	else{
		while (offers.next()){
			String origin = offers.getString("Origin"),
					destination = offers.getString("Destination");
			Timestamp beginDateTime = offers.getTimestamp("BeginDateTime"),
					endDateTime = offers.getTimestamp("EndDateTime");
			
			out.print("From <b>" + origin + "</b> to <b>" + destination + "</b> from <b>" + beginDateTime.toString() + 
					"</b> until <b>" + endDateTime.toString() + "</b><br>");
			
			selection = connection.prepareStatement(
				"SELECT User,RequestID FROM Requests WHERE User <> ? AND Origin = ? AND Destination = ? AND BeginDateTime >= ? AND EndDateTime <= ?");
			
			selection.setString(1,session.getAttribute("username").toString());
			selection.setString(2,origin);
			selection.setString(3,destination);
			selection.setTimestamp(4,beginDateTime);
			selection.setTimestamp(5,endDateTime);
			
			ResultSet requests = selection.executeQuery();
			
			if (!requests.isBeforeFirst())
				out.print("<br>There are not matches for this offer.<br><br>");
			else{
				out.print("<form action=\"MatchUsers.jsp\" method=\"POST\"><br>");%>
				<input type="hidden" name="offer" value="<%=offers.getString("OfferID")%>">
				<%while(requests.next()){%>
					<%=requests.getString("User")%>
					<select name="<%=requests.getString("RequestID")%>">
					<option value="1">Accept</option>
					<option value="0">Reject</option>
					</select><br>
				<%}
				out.print("<br><input type=\"submit\" value=\"Confirm matches\"></form><br><br>");
			}
			
			requests.close();
		}
		offers.close();
	}
	
	out.print("<form action=\"UserDashboard.jsp\"><input type=\"submit\" value=\"Back to Dashboard\"/></form>");
	
	connection.close();
%>
</body>
</html>