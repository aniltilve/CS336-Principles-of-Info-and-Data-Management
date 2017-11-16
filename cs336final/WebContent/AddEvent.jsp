<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page language="java" contentType="text/html;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Event</title>
</head>

<body>
<h3>Add Calendar Event</h3>
	<form action="NewEvent.jsp" method="POST">
	<b>Event name</b>
		<br> 
	<input type="text" name="eventName" placeholder="Enter event name" required maxlength="20" 
			pattern="[A-Za-z ]{1,20}" title="1-20 letters">
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
	<input type ="submit" name="decision" value="Add Another Event"/> 
	<input type="submit" name="decision" value="Add Vehicle"/>
	<input type="submit" name="decision" value="Finish Registration"/>
	<input type="reset" value="Clear"/>
	</form>
</body>
</html>