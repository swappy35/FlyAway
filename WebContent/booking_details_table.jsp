<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
table, th, td {
  border:1px solid black;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking Details Table</title>
</head>
<body>

	<!-- Connection setup -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/flyaway"
		user="root" password="root"/>

	<!-- Query to Booking Details Table -->
	<sql:query var="booking" dataSource="${db}">
		select * from Booking_Details;
	</sql:query>
					<center>
					<h1>Booking Details Table</h1>
					<table style="width:80%">
						<tr>
							<th>Booking ID</th>
							<th>Serial No from Personal Details</th>
							<th>Email from Personal Details</th>
							<th>Flight No</th>
						</tr>
					<c:forEach var="row" items="${booking.rows}">
    					<tr>
        					<td><c:out value="${row.Booking_ID }"/></td>
        					<td><c:out value="${row.S_No_from_pers_dt }"/></td>
        					<td><c:out value="${row.Email_from_pers_dt }"/></td>
        					<td><c:out value="${row.Flight_No }"/></td>
 						</tr>
 					</c:forEach>
 				</table>
 				</center>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	<a href="admin_process.jsp">Go Back</a>
 				
</body>
</html>