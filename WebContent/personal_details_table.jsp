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
<title>Personal Details Table</title>
</head>
<body>

	<!-- Connection setup -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/flyaway"
		user="root" password="root"/>

	<!-- Query to Flight Details Table -->
	<sql:query var="prsnl" dataSource="${db}">
		select * from Personal_Details;
	</sql:query>
					<center>
					<h1>Personal Details Table</h1>
					<table style="width:80%">
						<tr>
							<th>Serial No</th>
							<th>First Name</th>
							<th>Middle Name</th>
							<th>Last Name</th>
							<th>Email</th>
							<th>Age</th>
							<th>Mobile No</th>
							<th>Govt. ID</th>
							<th>Govt. ID No</th>
							<th>Address</th>
							<th>Country</th>
						</tr>
					<c:forEach var="row" items="${prsnl.rows}">
    					<tr>
        					<td><c:out value="${row.S_No }"/></td>
        					<td><c:out value="${row.F_Name }"/></td>
        					<td><c:out value="${row.M_Name }"/></td>
        					<td><c:out value="${row.L_Name }"/></td>
        					<td><c:out value="${row.Email }"/></td>
        					<td><c:out value="${row.Age}"/></td>
        					<td><c:out value="${row.Mobile }"/></td>
        					<td><c:out value="${row.Govt_ID }"/></td>
        					<td><c:out value="${row.Govt_ID_No}"/></td>
        					<td><c:out value="${row.Address }"/></td>
        					<td><c:out value="${row.Country }"/></td>
 						</tr>
 					</c:forEach>
 				</table>
 				</center>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	<a href="admin_process.jsp">Go Back</a>
 				
</body>
</html>