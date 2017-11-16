<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>System Support Dashboard</title>
</head>

<body>
    <h1>Welcome back, <%=session.getAttribute("firstName").toString()%>!</h1> 
    <form action="Logout.jsp">
		<input type="submit" value="Log out" />
	</form>
	
	<h2>End-User Account Management</h2>
	<h2>Reset Password</h2>
	<form action="ResetPassword.jsp" method="POST">
	<b>Username</b>
		<br>
	<input type="text" name="username" placeholder = "Enter a username" required maxlength="20"/>
    	<br><br>
	<b>Password</b>
		<br> 
	<input type="password" name="password" placeholder="Enter a password" required maxlength="20"/>
		<br><br>
	<input type="submit" value="Reset"/> <input type="reset" value="Clear"/>
		<br><br>
	</form>
	<h2>Ban An End-User</h2>
	<form action="BanUser.jsp" method="POST">
	<b>Username</b>
		<br>
	<input type="text" name="username" placeholder="Enter a username" required maxlength="20"/>
    	<br><br>
	<input type="submit" value="Ban"/> <input type="reset" value="Clear"/>
		<br><br>
	</form>	
	
	<h2>Advertising</h2>
	<h3>Add New Advertisement</h3>
	<form action="NewAdvertisement.jsp" method="POST">
	<b>Slogan</b>
		<br>
	<input type="text" size="80" name="slogan" placeholder ="Subject" maxlength="40"/>
		<br><br>
	<b>Copy</b>
		<br> 
	<textarea  rows="10" cols="60" maxlength="500" class ="input" name="copy" required></textarea>
		<br><br>
	<input type="submit" value="Add"/> <input type="reset" value="Clear"/>
	</form>
</body>
</html>