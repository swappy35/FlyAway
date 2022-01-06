<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Personal Details Page </title>
</head>
<body>
	<!-- Connection setup -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/flyaway"
		user="root" password="root"/>
	
	<!-- Query to access DB -->
	<sql:query var="Buffer" dataSource="${db}">
		select * from Flight_Details where Flight_No=?;
		<sql:param value="${param.fno}"/>
	</sql:query>
	
						<c:forEach var="row" items="${Buffer.rows}">
    					<tr>
        					<td><c:set var="Flight_No" value="${row.Flight_No }"/></td>
        					<td><c:set var="Airline_Name" value="${row.Airline_Name }"/></td>
        					<td><c:set var="Price" value="${row.Price }"/></td>
        					<td><c:set var="Src_City" value="${row.Src_City }"/></td>
        					<td><c:set var="Dep_Time" value="${row.Dep_Time }"/></td>
        					<td><c:set var="Dest_City" value="${row.Dest_City }"/></td>
        					<td><c:set var="Arr_Time" value="${row.Arr_Time }"/></td>
        					<td><c:set var="Total_Seat" value="${row.Total_Seat }"/></td>
        					<td><c:set var="Booked_Seat" value="${row.Booked_Seat }"/></td>
        					<td><c:set var="Available_Seat" value="${row.Available_Seat }"/></td>
        					<td><c:set var="DOT" value="${row.DOT }"/></td>
        					<td><c:set var="Class" value="${row.Class }"/></td>
 						</tr>
 					</c:forEach>
 					
	<center>
	<h1>Fill Personal Details</h1>
    <form action="review_page.jsp" method="post">
    <table>
	<tr><td>Flight Booked:</td> <td><input type="text" name="FB" value="${Flight_No}" readonly/></td></tr>
    <tr><td>First Name:</td> <td><input type="text" name="FN" required/></td></tr>
    <tr><td>Middle Name:</td> <td><input type="text" name="MN" /></td></tr>
    <tr><td>Last Name:</td> <td><input type="text" name="LN" required/></td></tr>
    <tr><td>Email:</td> <td><input type="email" name="EM" required/></td></tr>
    <tr><td>Age:</td> <td><input type="number" name="Age" required/></td></tr>
    <tr><td>Contact Number:</td> <td><input type="number" name="CN" size="10" required/></td></tr>
    <tr><td><label for="GID">Government ID: </label></td>
			<td>
				<select name="GID" id="GID" required>
				<option ></option>
				<option value="aadhar" >Aadhar</option>
  				<option value="passport" >Passport</option>
  				<option value="pan" >PAN</option>
 				<option value="voter" >Voter ID</option>
 				<option value="license" >Driving License</option>
				</select>
			</td>
			<tr><td></td><td><input type="number" name="GIDN" required/></td>
		</tr>   	
		<tr><td>Address:</td> <td><input type="text" name="AD" required/></td></tr>
    	<tr><td>Country:</td> <td><input type="text" name="CT" required/></td></tr>
        <tr><td></td></tr>
        <tr>
        <td>&emsp;&emsp;&emsp;&emsp;<input type="submit" value="Submit to Review" /></td>
        <td>&emsp;&emsp;<input type="reset" value="Reset" /></td>
        </tr>
    </table>
    </form>	
    </center>

</body>
</html>