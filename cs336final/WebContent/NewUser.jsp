<%@ page language="java" contentType="text/html;"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registering User</title>
</head>

<body>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection connection = DriverManager.getConnection(
			"jdbc:mysql://grace-cs-336.c8syinthpsan.us-east-1.rds.amazonaws.com:3306/CS336project", 
			"dcg87", "treeapple#");
	
	String username = request.getParameter("username");
	
	session.setAttribute("username", username);
	
	PreparedStatement insertion = connection.prepareStatement(
			"INSERT INTO Users (Username,Email,UserPassword,Name,UserType,Address, Phone, Privacy) VALUES (?,?,?,?,?,?,?,?)");

	insertion.setString(1, username);
	insertion.setString(2, request.getParameter("email"));
	insertion.setString(3, request.getParameter("password"));
	insertion.setString(4, request.getParameter("firstname") + " " + request.getParameter("lastname"));
	insertion.setInt(5, Integer.parseInt(request.getParameter("userType")));
	insertion.setString(6, request.getParameter("address"));
	insertion.setString(7, request.getParameter("phoneNumber"));
	insertion.setString(8, request.getParameter("privacy"));
		
	int rowsAffected = 0;
	
	try{
		rowsAffected = insertion.executeUpdate();
	}
	catch (SQLException sqlException){}
	finally{
		connection.close();
	}
	
	if (rowsAffected == 0){
		out.print("That username already exists. Please choose a different username.");
		out.print("<br><br><form action=\"Register.jsp\"><input type=\"submit\" value=\"Back to Register\"/></form>");
	}
	else{
		int userType = Integer.parseInt(request.getParameter("userType"));
		
		if(userType == 1){
			out.print("Successfully Registered System Support Staff Member.");
			response.sendRedirect("AdminDashboard.jsp");
		}
		else if (userType == 2){
			String decision = request.getParameter("decision");
			
			if(decision.equals("Add Vehicle"))
				response.sendRedirect("AddVehicle.jsp");
			else if(decision.equals("Add Event"))
				response.sendRedirect("AddEvent.jsp");
			else
				out.print("You have been successfully registered.<br><br><form action=\"Logout.jsp\"><input type=\"submit\" value=\"Back to Login\"/></form>");
		}
	}

	connection.close();
%>
</body>
</html>