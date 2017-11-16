<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.lang.String" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Register</title>
</head>

<body>
	<h1>Create your Account</h1>
	<p>Email is limited to a maximum of 255 characters. 
	All other fields are limited to a maximum of 20 characters.</p>
	<form action="NewUser.jsp" method="POST">
	<b>Your first name</b>
		<br> 
	<input type="text" name="firstname" placeholder="Enter your first name" required maxlength="20" 
			pattern="[A-Z]{1}[a-z '-]{1,19}" 
			title="&#10;1-20 letters&#10;The first letter is uppercase&#10;The remaining letters are lowercase">
		<br><br>
	<b>Your last name</b>
		<br>
	<input type="text" name="lastname" placeholder="Enter your last name" required maxlength="20" 
			pattern="[A-Z]{1}[a-z '-]{1,19}" 
			title="&#10;1-20 letters&#10;The first letter is uppercase&#10;The remaining letters are lowercase">
		<br><br>
	<b>Desired username</b>
		<br>
	<input type="text" name="username" placeholder="Enter a username" required maxlength="20" 
			pattern="[A-Za-z0-9]{1,20}" title="1-20 alphanumeric characters">
		<br><br>
	<b>Your email</b>
		<br>
	<input type="email" name="email" placeholder="Enter your email" required maxlength="255" 
			title="Must be a Rutgers email">
    	<br><br>
	<b>Password</b>
		<br> 
	<input type="password" name="password" placeholder="Enter a password" required maxlength="20" 
			pattern="[A-Za-z0-9]{1,20}" title="1-20 alphanumeric characters">
		<br><br>
	<h2>Privacy Settings</h2>
	<p>Choose who can see your information</p>
	<select name="privacy">
		<option value="Everyone">Everyone</option>
		<option value="Selected Users">Selected Users</option>
		<option value="No One">No One
	</select>
		<br>
	<h2>Optional Information</h2>
	<b>Your address</b>
		<br>
	<input type="text" name="address" placeholder="Enter your Address" maxlength="40" pattern="[0-9A-Za-z '-]{1,40}">	
		<br><br>
	<b>Your phone number</b>
		<br>
	<input type="text" name="phoneNumber" placeholder="Enter your phone number" maxlength="10" pattern="[0-9]{10}">
		<br><br>
	<input type="hidden" name="userType" value="2" />
	<input type ="submit" name="decision" value="Add Vehicle"/> 
	<input type="submit" name = "decision" value="Add Event"/>
	<input type="submit" name = "decision" value="Finish Registration"/>
	<input type="reset" value="Clear"/>
	</form>
</body>
</html>