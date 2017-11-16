<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page language="java" contentType="text/html;"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html;">
<title>User Dashboard</title>
</head>

<body>
    <h1>Welcome Back, <%=session.getAttribute("firstName").toString()%>!</h1> 
    <form action="Logout.jsp">
		<input type="submit" value="Log out" />
	</form>

	<h2><u>Statistics</u></h2>
    <form action="statistics.jsp">
		<input type="submit" value="View Statistics" />
	</form>
	
	<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection connection = DriverManager.getConnection(
			"jdbc:mysql://grace-cs-336.c8syinthpsan.us-east-1.rds.amazonaws.com:3306/CS336project", "dcg87", "treeapple#");
	
	PreparedStatement selection = connection.prepareStatement("SELECT * FROM Vehicles WHERE VehicleOwner = ?");
	selection.setString(1, session.getAttribute("username").toString());
	ResultSet results = selection.executeQuery();
	%>
	
	<h2><u>Rides</u></h2>
	<h3>Offer Ride</h3>
	<form action="NewOffer.jsp" method="GET">
	<b>Frequency</b>
		<br>
	<input type="radio" name="frequency" value="once" checked>Once<br>
  	<input type="radio" name="frequency" value="recurring">Recurring<br>
  		<br>
  	<b>Origin</b>
  		<br>
  	<select name="origin">
  		<option value="Allison Road Classrooms">Allison Road Classrooms</option>
  		<option value="Biel Road">Biel Road</option>
  		<option value="Buell Apartments">Buell Apartments</option>
  		<option value="Busch Campus Center">Busch Campus Center</option>
  		<option value="Busch Suites">Busch Suites</option>
  		<option value="Davidson Hall">Davidson Hall</option>
  		<option value="Gibbons Hall">Gibbons Hall</option>
  		<option value="Henderson Apartments">Henderson Apartments</option>
  		<option value="Hill Center">Hill Center</option>
  		<option value="Katzenbach Hall">Katzenbach Hall</option>
  		<option value="Liberty Street">Liberty Street</option>
  		<option value="Lipman Hall">Lipman Hall</option>
  		<option value="Library of Science">Library of Science</option>
  		<option value="Livingston Plaza">Livingston Plaza</option>
  		<option value="Livingston Student Center">Livingston Student Center</option>
  		<option value="Paterson Street">Paterson Street</option>
  		<option value="Public Safety Building">Public Safety Building</option>
  		<option value="Quads">Quads</option>
  		<option value="Red Oak Lane">Red Oak Lane</option>
  		<option value="Rockoff Hall">Rockoff Hall</option>
  		<option value="Rutgers Student Center">Rutgers Student Center</option>
  		<option value="Scott Hall">Scott Hall</option>
  		<option value="Stadium">Stadium</option>
  		<option value="Student Activities Center">Student Activities Center</option>
  		<option value="Train Station">Train Station</option>
  		<option value="Werblin Recreation Center">Werblin Recreation Center</option>
  		<option value="Zimerli Arts Museum">Zimerli Arts Museum</option>
  	</select>
  		<br><br>
  	<b>Destination</b>
  		<br>
  		
  	<select name="destination">
  		<option value="Allison Road Classrooms">Allison Road Classrooms</option>
  		<option value="Biel Road">Biel Road</option>
  		<option value="Buell Apartments">Buell Apartments</option>
  		<option value="Busch Campus Center">Busch Campus Center</option>
  		<option value="Busch Suites">Busch Suites</option>
  		<option value="Davidson Hall">Davidson Hall</option>
  		<option value="Gibbons Hall">Gibbons Hall</option>
  		<option value="Henderson Apartments">Henderson Apartments</option>
  		<option value="Hill Center">Hill Center</option>
  		<option value="Katzenbach Hall">Katzenbach Hall</option>
  		<option value="Liberty Street">Liberty Street</option>
  		<option value="Lipman Hall">Lipman Hall</option>
  		<option value="Library of Science">Library of Science</option>
  		<option value="Livingston Plaza">Livingston Plaza</option>
  		<option value="Livingston Student Center">Livingston Student Center</option>
  		<option value="Paterson Street">Paterson Street</option>
  		<option value="Public Safety Building">Public Safety Building</option>
  		<option value="Quads">Quads</option>
  		<option value="Red Oak Lane">Red Oak Lane</option>
  		<option value="Rockoff Hall">Rockoff Hall</option>
  		<option value="Rutgers Student Center">Rutgers Student Center</option>
  		<option value="Scott Hall">Scott Hall</option>
  		<option value="Stadium">Stadium</option>
  		<option value="Student Activities Center">Student Activities Center</option>
  		<option value="Train Station">Train Station</option>
  		<option value="Werblin Recreation Center">Werblin Recreation Center</option>
  		<option value="Zimerli Arts Museum">Zimerli Arts Museum</option>
  	</select>
  		<br><br>
	<b>Time Window</b>
		<br>
  	<select name="beginHour">
  		<%for (int hour = 1; hour < 13; hour++) {%>
  		<option value="<%=hour-1%>"><%=hour%></option>
  		<%}%>
  	</select>
  	:
  	<select name="beginMinute">
  		<%for (int minute = 0; minute < 60; minute++) {%>
  		<option value="<%=minute%>"><%=minute < 10? String.format("%02d", minute) : minute%></option>
  		<%}%>
  	</select>
  	<select name="beginPeriod">
  		<option value="am">A.M.</option>
  		<option value="pm">P.M.</option>
  	</select>
  	on
  	<select name="beginMonth">
  		<%for (int month = 1; month < 13; month++) {%>
  		<option value="<%=month%>"><%=new DateFormatSymbols().getMonths()[month-1]%></option>
  		<%}%>
  	</select>
  	<select name="beginDay">
  		<%for (int day = 1; day < 32; day++) {%>
  		<option value="<%=day%>"><%=day < 10? String.format("%02d", day) : day%></option>
  		<%}%>
  	</select>
  	<select name="beginYear">
  		<%for (int year = 2017; year < 2051; year++) {%>
  		<option value="<%=year%>"><%=year%></option>
  		<%}%>
  	</select>
  	<br>
  	to
  	<br>
  	<select name="endHour">
  		<%for (int hour = 1; hour < 13; hour++) {%>
  		<option value="<%=hour-1%>"><%=hour%></option>
  		<%}%>
  	</select>
  	:
  	<select name="endMinute">
  		<%for (int minute = 0; minute < 60; minute++) {%>
  		<option value="<%=minute%>"><%=minute < 10? String.format("%02d", minute) : minute%></option>
  		<%}%>
  	</select>
  	<select name="endPeriod">
  		<option value="am">A.M.</option>
  		<option value="pm">P.M.</option>
  	</select>
  	on
  	<select name="endMonth">
  		<%for (int month = 1; month < 13; month++) {%>
  		<option value="<%=month%>"><%=new DateFormatSymbols().getMonths()[month-1]%></option>
  		<%}%>
  	</select>
  	<select name="endDay">
  		<%for (int day = 1; day < 32; day++) {%>
  		<option value="<%=day%>"><%=day < 10? String.format("%02d", day) : day%></option>
  		<%}%>
  	</select>
  	<select name="endYear">
  		<%for (int year = 2017; year < 2051; year++) {%>
  		<option value="<%=year%>"><%=year%></option>
  		<%}%>
  	</select>
   		<br><br>
   	<b>Choose Vehicle</b>
   		<br>
   	<select name="vehicle">
   	<%while (results.next()) {%>
		<option><%=results.getString("ModelYear") + " " + results.getString("Make") + " " + results.getString("Model") + " (" + results.getString("VIN") + ")"%></option>
	<%}
	
	results.beforeFirst();%>
   	</select>
   		<br><br>
	<input type="submit" name = "decision" value="Offer">
	</form>
		<br>
	<form action="ViewMatchingReqs.jsp" method="GET">
		<input type="submit" value="View Matching Requests">
	</form>
	
	<h3>Request Ride</h3>
	<form action="NewRequest.jsp" method="GET">
	<b>Frequency</b>
		<br>
	<input type="radio" name="frequency" value="once" checked>Once<br>
  	<input type="radio" name="frequency" value="recurring">Recurring<br>
  		<br>
  	<b>Origin</b>
  		<br>
  	<select name="origin">
  		<option value="Allison Road Classrooms">Allison Road Classrooms</option>
  		<option value="Biel Road">Biel Road</option>
  		<option value="Buell Apartments">Buell Apartments</option>
  		<option value="Busch Campus Center">Busch Campus Center</option>
  		<option value="Busch Suites">Busch Suites</option>
  		<option value="Davidson Hall">Davidson Hall</option>
  		<option value="Gibbons Hall">Gibbons Hall</option>
  		<option value="Henderson Apartments">Henderson Apartments</option>
  		<option value="Hill Center">Hill Center</option>
  		<option value="Katzenbach Hall">Katzenbach Hall</option>
  		<option value="Liberty Street">Liberty Street</option>
  		<option value="Lipman Hall">Lipman Hall</option>
  		<option value="Library of Science">Library of Science</option>
  		<option value="Livingston Plaza">Livingston Plaza</option>
  		<option value="Livingston Student Center">Livingston Student Center</option>
  		<option value="Paterson Street">Paterson Street</option>
  		<option value="Public Safety Building">Public Safety Building</option>
  		<option value="Quads">Quads</option>
  		<option value="Red Oak Lane">Red Oak Lane</option>
  		<option value="Rockoff Hall">Rockoff Hall</option>
  		<option value="Rutgers Student Center">Rutgers Student Center</option>
  		<option value="Scott Hall">Scott Hall</option>
  		<option value="Stadium">Stadium</option>
  		<option value="Student Activities Center">Student Activities Center</option>
  		<option value="Train Station">Train Station</option>
  		<option value="Werblin Recreation Center">Werblin Recreation Center</option>
  		<option value="Zimerli Arts Museum">Zimerli Arts Museum</option>
  	</select>
  		<br><br>
  	<b>Destination</b>
  		<br>
  	<select name="destination">
  		<option value="Allison Road Classrooms">Allison Road Classrooms</option>
  		<option value="Biel Road">Biel Road</option>
  		<option value="Buell Apartments">Buell Apartments</option>
  		<option value="Busch Campus Center">Busch Campus Center</option>
  		<option value="Busch Suites">Busch Suites</option>
  		<option value="Davidson Hall">Davidson Hall</option>
  		<option value="Gibbons Hall">Gibbons Hall</option>
  		<option value="Henderson Apartments">Henderson Apartments</option>
  		<option value="Hill Center">Hill Center</option>
  		<option value="Katzenbach Hall">Katzenbach Hall</option>
  		<option value="Liberty Street">Liberty Street</option>
  		<option value="Lipman Hall">Lipman Hall</option>
  		<option value="Library of Science">Library of Science</option>
  		<option value="Livingston Plaza">Livingston Plaza</option>
  		<option value="Livingston Student Center">Livingston Student Center</option>
  		<option value="Paterson Street">Paterson Street</option>
  		<option value="Public Safety Building">Public Safety Building</option>
  		<option value="Quads">Quads</option>
  		<option value="Red Oak Lane">Red Oak Lane</option>
  		<option value="Rockoff Hall">Rockoff Hall</option>
  		<option value="Rutgers Student Center">Rutgers Student Center</option>
  		<option value="Scott Hall">Scott Hall</option>
  		<option value="Stadium">Stadium</option>
  		<option value="Student Activities Center">Student Activities Center</option>
  		<option value="Train Station">Train Station</option>
  		<option value="Werblin Recreation Center">Werblin Recreation Center</option>
  		<option value="Zimerli Arts Museum">Zimerli Arts Museum</option>
  	</select>
  	<br><br>
  	<b>Time Window</b>
  		<br>
  	<select name="beginHour">
  		<%for (int hour = 1; hour < 13; hour++) {%>
  		<option value="<%=hour-1%>"><%=hour%></option>
  		<%}%>
  	</select>
  	:
  	<select name="beginMinute">
  		<%for (int minute = 0; minute < 60; minute++) {%>
  		<option value="<%=minute%>"><%=minute < 10? String.format("%02d", minute) : minute%></option>
  		<%}%>
  	</select>
  	<select name="beginPeriod">
  		<option value="am">A.M.</option>
  		<option value="pm">P.M.</option>
  	</select>
  	on
  	<select name="beginMonth">
  		<%for (int month = 1; month < 13; month++) {%>
  		<option value="<%=month%>"><%=new DateFormatSymbols().getMonths()[month-1]%></option>
  		<%}%>
  	</select>
  	<select name="beginDay">
  		<%for (int day = 1; day < 32; day++) {%>
  		<option value="<%=day%>"><%=day < 10? String.format("%02d", day) : day%></option>
  		<%}%>
  	</select>
  	<select name="beginYear">
  		<%for (int year = 2017; year < 2051; year++) {%>
  		<option value="<%=year%>"><%=year%></option>
  		<%}%>
  	</select>
  	<br>
  	to
  	<br>
  	<select name="endHour">
  		<%for (int hour = 1; hour < 13; hour++) {%>
  		<option value="<%=hour-1%>"><%=hour%></option>
  		<%}%>
  	</select>
  	:
  	<select name="endMinute">
  		<%for (int minute = 0; minute < 60; minute++) {%>
  		<option value="<%=minute%>"><%=minute < 10? String.format("%02d", minute) : minute%></option>
  		<%}%>
  	</select>
  	<select name="endPeriod">
  		<option value="am">A.M.</option>
  		<option value="pm">P.M.</option>
  	</select>
  	on
  	<select name="endMonth">
  		<%for (int month = 1; month < 13; month++) {%>
  		<option value="<%=month%>"><%=new DateFormatSymbols().getMonths()[month-1]%></option>
  		<%}%>
  	</select>
  	<select name="endDay">
  		<%for (int day = 1; day < 32; day++) {%>
  		<option value="<%=day%>"><%=day < 10? String.format("%02d", day) : day%></option>
  		<%}%>
  	</select>
  	<select name="endYear">
  		<%for (int year = 2017; year < 2051; year++) {%>
  		<option value="<%=year%>"><%=year%></option>
  		<%}%>
  	</select>
   		<br><br>
	<input type="submit" name = "decision" value="Request">
	</form>
		<br>
	<form action="CheckRequestStatus.jsp" method="GET">
		<input type="submit" value="Check request status">
	</form>
	<h2><u>Messaging</u></h2>
	<h3>Send new message</h3>
	<form action="SendMessage.jsp" method="POST">
	<b>To</b>
		<br> 
	<input type="text" size="80" name="recepient" placeholder="Recepient" required maxlength="20">
		<br><br>
	<b>Subject</b>
		<br>
	<input type="text" size="80" name="subject" placeholder ="Subject" maxlength="40">
		<br><br>
	<b>Body</b>
		<br> 
	<textarea  rows="10" cols="60" maxlength="500" class ="input" name="body" required></textarea>
		<br><br>
		<input type="submit" value="Send"/> <input type="reset" value="Clear">
	</form>
		<br><br>
	<form action="Inbox.jsp" method="GET">
		<input type="submit" value="View Inbox">
	</form>
	
	<h2><u>Vehicles</u></h2>

	<table cellpadding="10" border="1">
		<tr>
		<td><b>VIN<b></td>
		<td><b>License Plate<b></td>
		<td><b>Year<b></td>
		<td><b>Make<b></td>
		<td><b>Model<b></td>
		<td><b>Color<b></td>
		<td><b>Passenger Capacity<b></td>
		</tr>

	<%
	while (results.next()) {
	%>
	<tr>
		<td><%=results.getString(1)%></td>
		<td><%=results.getString(2)%></td>	
		<td><%=results.getInt(3)%></td>
		<td><%=results.getString(4)%></td>
		<td><%=results.getString(5)%></td>
		<td><%=results.getString(6)%></td>
		<td><%=results.getInt("PassengerCapacity")%></td>
	</tr>
	<% } %>
	</table>
	<br>
	<form action="ModifyVehicle.jsp" >
		<input type="submit" value="Modify Vehicle">
	</form>

	<h2><u>Events</u></h2>	
			<table cellpadding="10" border="1">
			<tr>
			<td><b>Event Name<b></td>
			<td><b>Begin DateTime<b></td>
			<td><b>End DateTime<b></td>
			</tr>
			<%
			selection = connection.prepareStatement("SELECT * FROM Events WHERE User = ?");
			selection.setString(1, session.getAttribute("username").toString());
			ResultSet events = selection.executeQuery();
			%>
			<%while (events.next()){%>
			<tr>
				<td><%=events.getString("EventName")%></td>
				<td><%=events.getTimestamp("BeginDateTime")%></td>
				<td><%=events.getTimestamp("EndDateTime")%></td>		
			</tr>
			<% } %>
			</table>
			<br>
    <form action="ModifyEvent.jsp">
		<input type="submit" value="Modify Event" />
	</form>
	<br>
	<h2><u>Who Can See My Information?</u></h2>
	<%
	PreparedStatement select = connection.prepareStatement("SELECT Privacy FROM Users WHERE Username = ?");
	select.setString(1, session.getAttribute("username").toString());
	ResultSet rst = select.executeQuery();
	
	while(rst.next()){
		String privacy = rst.getString("Privacy");
		out.println(privacy);
	}
	%>
	
	<br><br>
    <form action="ModifyPrivacy.jsp">
		<input type="submit" value="Modify Privacy" />
	</form>

</body>
</html>