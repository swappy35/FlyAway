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
<title>Admin Process</title>
</head>
<body>
	<!-- Connection setup -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/flyaway"
		user="root" password="root"/>
	
	<!-- Query to access DB -->
	<sql:query var="Adm" dataSource="${db}">
		select * from Admin_Login where email=?;
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
		<c:when test="${empty Adm}">  
       		Fill the credentials. 
    	</c:when> 
    	<c:when test="${Edb == E && Pdb == P}">  
       		Login Successful. 
    	</c:when>  
    	<c:when test="${Edb == E && Pdb != P}">  
        	Wrong Password & try again.
    	</c:when>  
    	<c:otherwise>  
       		Check credentials & try again.
    	</c:otherwise>  
	</c:choose>  
</body>
</html>