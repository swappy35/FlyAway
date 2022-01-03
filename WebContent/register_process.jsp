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
<title>Register Process</title>
</head>
<body>
	<!-- Connection setup -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/flyaway"
		user="root" password="root"/>
		
	<!-- Dynamic password in local variable -->
	<c:set var="P1" value="${param.password1}"/>
	<c:set var="P2" value="${param.password2}"/>
		
	<!-- Query to access DB -->
	<c:choose>  
		<c:when test="${P1 == P2}">  
			<sql:update var="Reg" dataSource="${db}">
				insert into User_Login values (?, ?);
				<sql:param value="${param.email}"/>
				<sql:param value="${param.password1}"/>
			</sql:update> 
			<center>
				<h3>Thank You for Registration!</h3><br>
				Please <a href="login.jsp">login</a> here.
			</center>
    	</c:when> 
    	<c:when test="${P1 != P2 }">  
    		<center>
				<h3>Password not matching</h3><br>
				Please try again, <a href="register.jsp">Click here</a>.
			</center>
    	</c:when>    
    	<c:otherwise>  
       		Check credentials & try again.
    	</c:otherwise>  
	</c:choose>  
		
</body>
</html>