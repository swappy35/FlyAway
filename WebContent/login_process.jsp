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
<title>Existing User Process</title>
</head>
<body>
	<!-- Connection setup -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/flyaway"
		user="root" password="root"/>
		
	<!-- Query to access DB -->
	<sql:query var="Adm" dataSource="${db}">
		select * from User_Login where email=?;
		<sql:param value="${param.email}"/>
	</sql:query>
	
	<!-- Locally getting Email and Password during runtime-->
	<c:set var="E" value="${param.email}"/>
	<c:set var="P" value="${param.password}"/>

	<!-- Getting Email and Password from DB -->
	<c:forEach var="row" items="${Adm.rows}">
    	<tr>
        	<td><c:set var="Edb" value="${row.email }"/></td>
        	<td><c:set var="Pdb" value="${row.password }"/></td>
 		</tr>
    </c:forEach>

	<!-- Checking email and password --> 	
	<c:choose>  
    	<c:when test="${Edb == E && Pdb == P}">  
    		<center>
				<h3>Login Successful.</h3><br>
				Proceed to <a href="search_page.jsp">search page</a>.
			</center>
    	</c:when>  
    	<c:when test="${Edb == E && Pdb != P}">  
    		<center>
				<h3>Incorrect Password</h3><br>
				Please try again, <a href="login.jsp">Click here</a>.
			</center>
    	</c:when>  
    	<c:when test="${Edb != E && Pdb != P}">  
    		<center>
				<h3>Incorrect Credentials</h3><br>
				Please register, <a href="register.jsp">Click here</a>.
			</center>
    	</c:when> 
    	<c:otherwise>  
    		<center>
				<h3>Incorrect Credentials</h3><br>
				Please register, <a href="register.jsp">Click here</a>.
			</center>
    	</c:otherwise>  
	</c:choose> 	
	
</body>
</html>