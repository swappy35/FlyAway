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
<title>Pass Change Complete</title>
</head>
<body>
	<!-- Connection setup -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/flyaway"
		user="root" password="root"/>
		
	<!-- Dynamic email & password in local variable -->
	<c:set var="E" value="${param.email}"/>
	<c:set var="P" value="${param.password}"/>
	
	<!-- Query to access DB -->
	<sql:query var="Adm" dataSource="${db}">
		select * from User_Login where email=?;
		<sql:param value="${E}"/>
	</sql:query>
	<!-- Getting Email and Password from DB -->
	<c:forEach var="row" items="${Adm.rows}">
    	<tr>
        	<td><c:set var="Edb" value="${row.email }"/></td>
        	<td><c:set var="Pdb" value="${row.password }"/></td>
 		</tr>
    </c:forEach>
		
	<!-- Query to match Email -->
	<c:choose>  
		<c:when test="${Edb == E}">  
			<sql:update var="chng" dataSource="${db}">
				update User_Login set Password = ? where Email = ?;
				<sql:param value="${P}"/>
				<sql:param value="${E}"/>
			</sql:update> 
			<center>
				<h3>Password successfully changed.</h3><br>
				You can <a href="login.jsp">login</a> from here.
			</center>
    	</c:when> 
    	<c:when test="${Edb != E }">  
    		<center>
				<h3>It seems you entered different email, please check and <a href="pass_change.jsp">try again</a>.</h3>
				<h3>Or you may register <a href="register.jsp">here</a>.</h3>
			</center>
    	</c:when>    
    	<c:otherwise>  
       		Check credentials & try again.
    	</c:otherwise>  
	</c:choose>  

</body>
</html>