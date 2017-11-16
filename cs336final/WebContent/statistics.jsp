<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Statistics</title>
</head>
<body>

Statistics 

	<div style="font-weight: bold; height: 128px">
	
	
		<br> <br>
		<div>Rides Given Per Month</div>
		
	<form action = "ridesGivenMonth.jsp"
		
	
		<br><select name="ridesGivenMonth">
         
			<option value="January">January</option>
			<option value="February">February</option>
			<option value="March">March</option>
			<option value="April">April</option>
			<option value="May">May</option>
			<option value="June">June</option>
			<option value="July">July</option>
			<option value="August">August</option>
			<option value="September">September</option>
			<option value="October">October</option>
			<option value="November">November</option>
			<option value="December">December</option>

		</select><input type="submit" name="month" value="submit">
	</form>
		<div>

			<br> <br>Rides Given Per Semester<br> <br>
			<form action = "ridesGivenSem.jsp"
		
	
		<br><select name="ridesGivenSem">
         
			<option value="Fall">Fall</option>
			<option value="Spring">Spring</option>
			

		</select><input type="submit" name="month" value="submit">
	</form>
			
			<br> <br>Rides Taken Per Month<br> <br>
			
			<form action = "ridesTakenMonth.jsp"
		
	
		<br><select name="ridesTakenMonth">
         
			<option value="January">January</option>
			<option value="February">February</option>
			<option value="March">March</option>
			<option value="April">April</option>
			<option value="May">May</option>
			<option value="June">June</option>
			<option value="July">July</option>
			<option value="August">August</option>
			<option value="September">September</option>
			<option value="October">October</option>
			<option value="November">November</option>
			<option value="December">December</option>

		</select><input type="submit" name="month" value="submit">
	</form>
			<br> <br>Rides Taken Per Semester<br> <br>
			<form action = "ridesTakenSem.jsp"
		
	
		<br><select name="ridesTakenSem">
         
			<option value="Fall">Fall</option>
			<option value="Spring">Spring</option>
			

		</select><input type="submit" name="month" value="submit">
	</form>
			<br>
			<form action="">
				<input type="submit" value="back">
			</form>
		</div>
	</div>
</body>
<b><big> </big></b>
</html>