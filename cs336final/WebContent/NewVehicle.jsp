<%@ page language="java" contentType="text/html;"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adding Vehicle Information</title>
</head>

<body>
<%
	Class.forName("com.mysql.jdbc.Driver");

	//Create a connection to your DB
	Connection connection = DriverManager.getConnection(
			"jdbc:mysql://grace-cs-336.c8syinthpsan.us-east-1.rds.amazonaws.com:3306/CS336project", "dcg87", "treeapple#");

	PreparedStatement insertion = connection.prepareStatement(
			"INSERT INTO Vehicles (VehicleOwner,VIN,LicensePlate,Make,Model,ModelYear,Color,PassengerCapacity) VALUES (?,?,?,?,?,?,?,?)");
	
	insertion.setString(1, session.getAttribute("username").toString());
	insertion.setString(2, request.getParameter("vin"));
	insertion.setString(3, request.getParameter("licensePlate"));
	insertion.setString(4, request.getParameter("make"));
	insertion.setString(5, request.getParameter("model"));
	insertion.setInt(6, Integer.parseInt(request.getParameter("year")));
	insertion.setString(7, request.getParameter("color"));
	insertion.setInt(8, Integer.parseInt(request.getParameter("passengerCapacity")));
		
	if (insertion.executeUpdate() == 0)
		out.print("Could not add vehicle");
	
	String decision = request.getParameter("decision");

	if(decision.equals("Add Another Vehicle"))
		response.sendRedirect("AddVehicle.jsp");
	else if(decision.equals("Add Schedule"))
		response.sendRedirect("AddEvent.jsp");
	else if(decision.equals("Add Vehicle")){
		out.println("Vehicle added successfully!");
	}
	else
		out.print("You have been successfully registered.<br><br><form action=\"Logout.jsp\"><input type=\"submit\" value=\"Back to Login\"/></form>");

	connection.close();
%>
</body>
</html>