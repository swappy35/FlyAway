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
<title>Flight Details Table</title>
</head>
<body>

	<!-- Connection setup -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/flyaway"
		user="root" password="root"/>

	<!-- Query to Flight Details Table -->
	<sql:query var="flight" dataSource="${db}">
		select * from Flight_Details;
	</sql:query>
					<center>
					<h1>Flight Details Table</h1>
					<table style="width:80%">
						<tr>
							<th>Flight No.</th>
							<th>Airline Name</th>
							<th>Price</th>
							<th>Source City</th>
							<th>Departure Time</th>
							<th>Destination City</th>
							<th>Arrival Time</th>
							<th>Total Seat</th>
							<th>Booked Seat</th>
							<th>Available Seat</th>
							<th>Date of Travel</th>
							<th>Class</th>
						</tr>
					<c:forEach var="row" items="${flight.rows}">
    					<tr>
        					<td><c:out value="${row.Flight_No }"/></td>
        					<td><c:out value="${row.Airline_Name }"/></td>
        					<td><c:out value="${row.Price }"/></td>
        					<td><c:out value="${row.Src_City }"/></td>
        					<td><c:out value="${row.Dep_Time }"/></td>
        					<td><c:out value="${row.Dest_City }"/></td>
        					<td><c:out value="${row.Arr_Time }"/></td>
        					<td><c:out value="${row.Total_Seat }"/></td>
        					<td><c:out value="${row.Booked_Seat }"/></td>
        					<td><c:out value="${row.Available_Seat }"/></td>
        					<td><c:out value="${row.DOT }"/></td>
        					<td><c:out value="${row.Class }"/></td>
 						</tr>
 					</c:forEach>
 				</table>
 				</center>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	<a href="admin_process.jsp">Go Back</a>
 				
</body>
</html>