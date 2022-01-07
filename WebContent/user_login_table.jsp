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
<title>User Login Table</title>
</head>
<body>

	<!-- Connection setup -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/flyaway"
		user="root" password="root"/>

	<!-- Query to User Login Details Table -->
	<sql:query var="usr" dataSource="${db}">
		select * from User_Login;
	</sql:query>
					<center>
					<h1>User Login Table</h1>
					<table style="width:25%">
						<tr>
							<th>Email</th>
							<th>Password</th>
						</tr>
					<c:forEach var="row" items="${usr.rows}">
    					<tr>
        					<td><c:out value="${row.Email }"/></td>
        					<td><c:out value="${row.Password }"/></td>
 						</tr>
 					</c:forEach>
 				</table>
 				</center>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	<a href="admin_process.jsp">Go Back</a>
 				
</body>
</html></html>