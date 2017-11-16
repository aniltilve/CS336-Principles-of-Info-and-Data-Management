<%@ page language="java" contentType="text/html;"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.time.*"%>
<%@ page import="javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Adding Offer</title>
</head>

<body>
<%
	LocalDateTime beginDateTime = null, endDateTime = null;
	try{
		int beginHour = Integer.parseInt(request.getParameter("beginHour"));
		
		if (request.getParameter("beginPeriod").equals("pm"))
			beginHour += 12;
		
		beginDateTime = LocalDateTime.of(
				Integer.parseInt(request.getParameter("beginYear")),
				Integer.parseInt(request.getParameter("beginMonth")),
				Integer.parseInt(request.getParameter("beginDay")),
				beginHour,
				Integer.parseInt(request.getParameter("beginMinute")));
		
		int endHour = Integer.parseInt(request.getParameter("endHour"));
		
		if (request.getParameter("endPeriod").equals("pm"))
			endHour += 12;
		
		endDateTime = LocalDateTime.of(
				Integer.parseInt(request.getParameter("endYear")),
				Integer.parseInt(request.getParameter("endMonth")),
				Integer.parseInt(request.getParameter("endDay")),
				endHour,
				Integer.parseInt(request.getParameter("endMinute")));
	}
	catch (DateTimeException dateTimeException){}

	if (beginDateTime == null){
		out.print("The day-of-month of your beginning date and time is invalid.");
		out.print("<br><br><form action=\"AddEvent.jsp\"><input type=\"submit\" value=\"Try Again\"/></form>");
	}
	else if (endDateTime == null){
		out.print("The day-of-month of your ending date and time is invalid.");
		out.print("<br><br><form action=\"AddEvent.jsp\"><input type=\"submit\" value=\"Try Again\"/></form>");
	}
	else if (endDateTime.isBefore(beginDateTime)){
		out.print("The ending date and time is before the beginning date and time.");
		out.print("<br><br><form action=\"AddEvent.jsp\"><input type=\"submit\" value=\"Try Again\"/></form>");
	}
	else{
		Class.forName("com.mysql.jdbc.Driver");
	
		Connection connection = DriverManager.getConnection(
				"jdbc:mysql://grace-cs-336.c8syinthpsan.us-east-1.rds.amazonaws.com:3306/CS336project", "dcg87", "treeapple#");
	
		String username = session.getAttribute("username").toString(),
				vehicle = request.getParameter("vehicle");		
		
		PreparedStatement insertion = connection.prepareStatement(
				"INSERT INTO Offers (User,Vehicle,Origin,Destination,BeginDateTime,EndDateTime) VALUES (?,?,?,?,?,?)");
		
		insertion.setString(1, username);
		insertion.setString(2, vehicle.substring(vehicle.indexOf("(")+1,vehicle.indexOf(")")));
		insertion.setString(3, request.getParameter("origin"));
		insertion.setString(4, request.getParameter("destination"));
		insertion.setTimestamp(5, Timestamp.valueOf(beginDateTime));
		insertion.setTimestamp(6, Timestamp.valueOf(endDateTime));
		
		int rowsAffected = 0;
		
		try{
			rowsAffected = insertion.executeUpdate();
		}
		catch(SQLException sqlException){}
		
		if (rowsAffected == 0)
			out.print("Failed to add offer.<br><br><form action=\"UserDashboard.jsp\"><input type=\"submit\" value=\"Try Again\"/></form>");
		else
			out.print("Your offer has been successfully added.<br><br><form action=\"UserDashboard.jsp\"><input type=\"submit\" value=\"Back to Dashboard\"/></form>");
		
		connection.close();
	}
%>
</body>
</html>