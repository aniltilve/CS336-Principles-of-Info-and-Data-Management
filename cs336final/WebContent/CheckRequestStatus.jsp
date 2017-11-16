<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>


<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<title>Check Request Status</title>
</head>

<body>
<%
	Class.forName("com.mysql.jdbc.Driver");
			
	Connection connection = DriverManager.getConnection(
			"jdbc:mysql://grace-cs-336.c8syinthpsan.us-east-1.rds.amazonaws.com:3306/CS336project", 
			"dcg87", "treeapple#");
	
	PreparedStatement selection = connection.prepareStatement("SELECT * FROM Requests WHERE User = ?");
	
	selection.setString(1, session.getAttribute("username").toString());
	ResultSet requests = selection.executeQuery();
	
	if (!requests.isBeforeFirst()){
		out.print("You have not submitted any ride requests.<br><br>");
	}
	else{
		while (requests.next()){
			String origin = requests.getString("Origin"),
					destination = requests.getString("Destination");
			Timestamp beginDateTime = requests.getTimestamp("BeginDateTime"),
					endDateTime = requests.getTimestamp("EndDateTime");
			
			out.print("From <b>" + origin + "</b> to <b>" + destination + "</b> from <b>" + beginDateTime.toString() + 
					"</b> until <b>" + endDateTime.toString() + "</b><br>");
			
			selection = connection.prepareStatement(
				"SELECT OfferID, Status FROM Matches WHERE RequestID = ?");
			
			selection.setString(1,requests.getString("RequestID"));
			
			ResultSet offers = selection.executeQuery();
			
			if (!offers.isBeforeFirst())
				out.print("<br>There are not matches for this request.<br><br>");
			else{%>
				<table cellpadding="15">
				<tr>
					<td><b>User<b></td>
					<td><b>License Plate<b></td>
					<td><b>Year<b></td>
					<td><b>Make<b></td>
					<td><b>Model<b></td>
					<td><b>Color<b></td>
					<td><b>Status<b></td>
					<td></td>
				</tr>
				<%while(offers.next()){
					selection = connection.prepareStatement(
						"SELECT O.User, V.* FROM Offers O, Vehicles V WHERE O.OfferID = ? AND V.VIN = (SELECT Vehicle FROM Offers WHERE OfferID = ?)");
					
					String offerID = offers.getString("OfferID");
					
					selection.setString(1, offerID);
					selection.setString(2, offerID);

					ResultSet info = selection.executeQuery();
					
					info.next();
					String status = offers.getString("Status");%>
					
					<tr>
						<td><%=info.getString("User")%></td>
						<td><%=status.equals("1")? info.getString("LicensePlate") : ""%></td>
						<td><%=status.equals("1")? info.getString("ModelYear") : ""%></td>
						<td><%=status.equals("1")? info.getString("Make") : ""%></td>
						<td><%=status.equals("1")? info.getString("Model") : ""%></td>
						<td><%=status.equals("1")? info.getString("Color") : ""%></td>
						<td><%=status.equals("1")? "Accepted" : "Rejected"%></td>
						<%if (status.equals("1")) 
							out.print("<td><form action=\"Ride.jsp\" method=\"POST\">");
							out.print("<input hidden name=\"driver\" value=\""+ info.getString("User") + "\">");
							out.print("<input hidden name=\"offerID\" value=\""+ offerID + "\">");
							out.print("<input type=\"submit\" value=\"Begin Ride\"></form><td>");%>
					</tr>
				<%}%>
				</table>
			<%}
			
			offers.close();
		}
		requests.close();
	}
	
	out.print("<form action=\"UserDashboard.jsp\"><input type=\"submit\" value=\"Back to Dashboard\"/></form>");
	
	connection.close();
%>
</body>
</html>