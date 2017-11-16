<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Login</title>
</head>

<body>
	<h1>Welcome back! Please Log In</h1>
	<form action="VerifyUser.jsp" method="GET">
		<b>Username</b>
			<br>
		<input name="username" type="text" placeholder="Enter your username" required maxlength="20" pattern="[A-Za-z0-9]{1,20}" title="1-20 alphanumeric characters">
			<br><br>
		<b>Password</b>
			<br>
		<input name="password" type="password" placeholder="Enter your password" required maxlength="20" pattern="[A-Za-z0-9]{1,20}" title="1-20 alphanumeric characters">
			<br><br>
		<input type="submit" value="Log in"> <input type="reset" value="Clear">
	</form>
</body>

</html>