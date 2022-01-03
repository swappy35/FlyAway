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
<title>Search Page Process</title>
</head>
<body>
	<!-- Connection setup -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/flyaway"
		user="root" password="root"/>
	
	<!-- Query to access DB -->
	<sql:query var="SPP" dataSource="${db}">
		select * from Flight_Details where DOT=? AND Src_City=? AND Dest_City=? AND Available_Seat >=?;
		<sql:param value="${param.DOT}"/>
		<sql:param value="${param.SCity}"/>
		<sql:param value="${param.DCity}"/>
		<sql:param value="${param.NPersons}"/>
	</sql:query>
	
	
	<c:choose>
		<c:when test="${!empty SPP.rows}">
			<!-- Getting Email and Password from DB -->
			<center>
				<h4>Search Results:-</h4>
				<table style="width:80%">
						<tr>
							<th>Flight No.</th>
							<th>Airline Name</th>
							<th>Price</th>
							<th>Src City</th>
							<th>Dep Time</th>
							<th>Dest City</th>
							<th>Arr Time</th>
							<th>Total Seat</th>
							<th>Booked Seat</th>
							<th>Available Seat</th>
							<th>Date of Travel</th>
							<th>Class</th>
						</tr>
					<c:forEach var="row" items="${SPP.rows}">
    					<tr>
        					<td><a href="personaldetails.jsp?fno=<c:out value="${row.Flight_No }"/>"> ${row.Flight_No }</a></td>
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
		</c:when>
		<c:when test="${empty SPP.rows}">
			<center>
				<c:out value="Null"></c:out>
			</center>
		</c:when>
		<c:otherwise>
			<center>
				<c:out value="Otherwise"></c:out>
			</center>
		</c:otherwise>
	</c:choose>

	

	
	<c:set var="DOJ" value="${param.DOT }"/>
	<c:set var="SrcCiy" value="${param.SCity }"/>
	<c:set var="DesCity" value="${param.DCity }"/>
	<c:set var="NP" value="${param.NPersons }"/>
</body>
</html>