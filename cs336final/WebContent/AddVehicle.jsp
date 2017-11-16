<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.lang.String" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>

<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<title>Add Vehicle</title>
</head>

<body>
	<h3>Add Vehicle Information</h3>
	<form action="NewVehicle.jsp" method="POST">
	<b>Model Year</b>
		<br>
	<input type="number" name="year" placeholder ="Enter model year" min="1900" max="2020">
		<br><br>
	<b>Make</b>
		<br>
	<select name="make">
		<option value="Acura">Acura</option>
		<option value="Alfa Romeo">Alfa Romeo</option>
		<option value="AMC">AMC</option>
		<option value="Aston Martin">Aston Martin</option>
		<option value="Audi">Audi</option>
		<option value="Bentley">Bentley</option>
		<option value="BMW">BMW</option>
		<option value="Buick">Buick</option>
		<option value="Bugatti">Bugatti</option>
		<option value="Cadillac">Cadillac</option>
		<option value="Chevrolet">Chevrolet</option>
		<option value="Chrysler">Chrysler</option>
		<option value="Daewoo">Daewoo</option>
		<option value="Datsun">Datsun</option>
		<option value="DeLorean">DeLorean</option>
		<option value="Dodge">Dodge</option>
		<option value="Eagle">Eagle</option>
		<option value="Ferrari">Ferrari</option>
		<option value="Fiat">Fiat</option>
		<option value="Fisker">Fisker</option>
		<option value="Ford">Ford</option>
		<option value="Freightliner">Freightliner</option>
		<option value="Genesis">Genesis</option>
		<option value="Geo">Geo</option>
		<option value="GMC">GMC</option>
		<option value="Honda">Honda</option>
		<option value="Hummer">Hummer</option>
		<option value="Hyundai">Hyundai</option>
		<option value="Infiniti">Infiniti</option>
		<option value="Isuzu">Isuzu</option>
		<option value="Jaguar">Jaguar</option>
		<option value="Jeep">Jeep</option>
		<option value="Kia">Kia</option>
		<option value="Koeniggsegg">Koeniggsegg</option>
		<option value="Lamborghini">Lamborghini</option>
		<option value="Land Rover">Land Rover</option>
		<option value="Lexus">Lexus</option>
		<option value="Lincoln">Lincoln</option>
		<option value="Lotus">Lotus</option>
		<option value="Maserati">Maserati</option>
		<option value="Maybach">Maybach</option>
		<option value="Mazda">Mazda</option>
		<option value="McLaren">McLaren</option>
		<option value="Mercedes-Benz">Mercedes-Benz</option>
		<option value="Mercury">Mercury</option>
		<option value="Mini">Mini</option>
		<option value="Mitsubishi">Mitsubishi</option>
		<option value="Nissan">Nissan</option>
		<option value="Oldsmobile">Oldsmobile</option>
		<option value="Other">Other</option>
		<option value="Plymouth">Plymouth</option>
		<option value="Pontiac">Pontiac</option>
		<option value="Porsche">Porsche</option>
		<option value="RAM">RAM</option>
		<option value="Rolls-Royce">Rolls-Royce</option>
		<option value="Saab">Saab</option>
		<option value="Saturn">Saturn</option>
		<option value="Scion">Scion</option>
		<option value="Smart">Smart</option>
		<option value="SRT">SRT</option>
		<option value="Subaru">Subaru</option>
		<option value="Suzuki">Suzuki</option>
		<option value="Tesla">Tesla</option>
		<option value="Toyota">Toyota</option>
		<option value="Volkswagen">Volkswagen</option>
		<option value="Volvo">Volvo</option>
		<option value="Yugo">Yugo</option>
	</select>
		<br><br>
	<b>Model</b>
		<br>
	<input type="text" name="model" placeholder ="Enter model" maxlength="20" pattern="[A-Za-z ]{1,20}" title="1-20 letters">
		<br><br>
	<b>VIN</b>
		<br>
	<input type="text" name="vin" placeholder ="Enter VIN" maxlength="17" pattern="[A-Za-z0-9]{11,17}" title="11-17 alphanumeric characters">
		<br><br>
	<b>License Plate Number</b>
		<br>
	<input type="text" name="licensePlate" placeholder ="Enter license plate number" maxlength="8" pattern="[A-Z0-9]{6,8}" title="6-8 uppercase alphanumeric characters">
		<br><br>
	<b>Color</b>
		<br>
	<select name="color">
		<option value="beige">Beige</option>
		<option value="black">Black</option>
		<option value="blue">Blue</option>
		<option value="brown">Brown</option>
	  	<option value="green">Green</option>
	  	<option value="grey">Grey</option>
	  	<option value="orange">Orange</option>
	  	<option value="other">Other</option>
	  	<option value="pink">Pink</option>
	  	<option value="purple">Purple</option>
	  	<option value="red">Red</option>
	  	<option value="silver">Silver</option>
	  	<option value="yellow">Yellow</option>
	  	<option value="white">White</option>
	</select>
		<br><br>
	<b>Number of Passengers: </b>
		<br>
	<input type="number" name="passengerCapacity" placeholder ="Number of Passengers" min="0" max="10">
		<br><br>
	<input type ="submit" name="decision" value="Add Another Vehicle"/>
	<input type="submit" name="decision" value="Add Schedule"/>
	<input type="submit" name="decision" value="Finish registration"/>
	<input type="reset" value="Clear" />
	</form>
		<br><br>
</body>