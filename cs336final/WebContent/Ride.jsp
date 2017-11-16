<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>


<head>
	<meta http-equiv="refresh" content="10;url=RateUser.jsp" charset=UTF-8">
	<title>Check Request Status</title>
</head>

<body>
<%
	Class.forName("com.mysql.jdbc.Driver");
			
	Connection connection = DriverManager.getConnection(
			"jdbc:mysql://grace-cs-336.c8syinthpsan.us-east-1.rds.amazonaws.com:3306/CS336project", 
			"dcg87", "treeapple#");
	
	PreparedStatement selection = connection.prepareStatement("SELECT * FROM Offers WHERE OfferID = ?");
	
	out.print("Ride in progress");
	
	selection.setString(1,request.getParameter("offerID"));
	
	ResultSet offer = selection.executeQuery();
	
	offer.next();
	
	PreparedStatement insertion = connection.prepareStatement("INSERT INTO Rides (Driver,Origin,Destination,beginDateTime,endDateTime,RideStatus) VALUES (?,?,?,?,?,1)");
	
	String driver = request.getParameter("driver");
	
	insertion.setString(1,request.getParameter("driver"));
	insertion.setString(2,offer.getString("Origin"));
	insertion.setString(3,offer.getString("Destination"));
	insertion.setTimestamp(4,offer.getTimestamp("BeginDateTime"));
	insertion.setTimestamp(5,offer.getTimestamp("EndDateTime"));
	
	insertion.executeUpdate();
	
	selection = connection.prepareStatement("SELECT MAX(RideID) FROM Rides");
	
	ResultSet rideID = selection.executeQuery();
	
	rideID.next();
	
	session.setAttribute("rideID", rideID);
	session.setAttribute("driver", driver);
%>
</body>
