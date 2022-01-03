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
<title>Insert title here</title>
</head>
<body>

<h3>Trigger Button Click on Enter</h3>
<p>Press the "Enter" key inside the input field to trigger the button.</p>

<button id="myBtn" onclick="javascript:alert('Hello World!')">Button</button>

<c:set var="a" value="${1101 }"></c:set>
<table>
<tr>
<td><a href="edit?id=<c:out value="${a}"/>"> Click 1</a></td>

</tr>
</table>

</body>
</html>