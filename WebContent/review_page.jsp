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
<title>Review Page</title>
</head>
<body>
	<!-- Connection setup -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/flyaway"
		user="root" password="root"/>
	
	<!-- Query to insert in Personal Details Table -->
	<sql:update dataSource="${db}">
		insert into Personal_Details values(S_No = ?,?,?,?,?,?,?,?,?,?,?);
		<sql:param value="${param.FB}"/>    
		<sql:param value="${param.FN}"/>
		<sql:param value="${param.MN}"/>
		<sql:param value="${param.LN}"/>
		<sql:param value="${param.EM}"/>
		<sql:param value="${param.Age}"/>
		<sql:param value="${param.CN}"/>
		<sql:param value="${param.GID}"/>
		<sql:param value="${param.GIDN}"/>
		<sql:param value="${param.AD}"/>
		<sql:param value="${param.CT}"/>
	</sql:update>
	
	<!-- Getting data from Personal Details table -->
	<sql:query var="PDsno" dataSource="${db}">
		select * from Personal_Details where Email = ?; 
		<sql:param value="${param.EM}"/>
	</sql:query>
	<c:forEach var="row" items="${PDsno.rows}">
        	<c:set var="sno" value="${row.S_No }"/>
        	<c:set var="F_Name" value="${row.F_Name }"/>
        	<c:set var="M_Name" value="${row.M_Name }"/>
        	<c:set var="L_Name" value="${row.L_Name }"/>
        	<c:set var="em" value="${row.Email }"/>
        	<c:set var="Age" value="${row.Age }"/>
        	<c:set var="Mobile_NO" value="${row.Mobile_No }"/>
        	<c:set var="Govt_ID" value="${row.Govt_ID }"/>
        	<c:set var="Govt_ID_NO" value="${row.Govt_ID_NO }"/>
        	<c:set var="Address" value="${row.Address }"/>
        	<c:set var="Country" value="${row.Country }"/>
    </c:forEach>
	
	<!-- Inserting data into Booking Details table -->
	<sql:update dataSource="${db}">
		insert into Booking_Details values(Booking_ID = ?,?,?,?);
		<sql:param value="${param.FB}"/>  
		<sql:param value="${sno}"/>
		<sql:param value="${em}"/>
		<sql:param value="${param.FB}"/>
	</sql:update>
	
	<!-- Getting data from Personal details DB -->
	<sql:query var="Book_Data" dataSource="${db}">
		select * from Booking_Details ORDER BY Booking_ID DESC LIMIT 1;
	</sql:query>
	<c:forEach var="BDrows" items="${Book_Data.rows}">
        	<c:set var="BID" value="${BDrows.Booking_ID}"/>
        	<c:set var="SNO" value="${BDrows.S_No_from_pers_dt }"/>
        	<c:set var="EMAIL" value="${BDrows.Email_from_pers_dt }"/>
        	<c:set var="FNO" value="${BDrows.Flight_No }"/>
    </c:forEach>
    <c:out value="${BID }"/>
    <c:out value="${SNO }"/>
    <c:out value="${EMAIL }"/>
    <c:out value="${FNO }"/>
    
    <!-- Getting data from Search details DB -->
	<sql:query var="Search_Data" dataSource="${db}">
		select * from Search_Details ORDER BY Persons DESC LIMIT 1;
	</sql:query>
		<c:forEach var="SDrows" items="${Search_Data.rows}">
        	<c:set var="DOT" value="${SDrows.DOT}"/>
        	<c:set var="SC" value="${SDrows.Src_City }"/>
        	<c:set var="DC" value="${SDrows.Dest_City }"/>
        	<c:set var="P" value="${SDrows.Persons }"/>
    </c:forEach>
    <c:out value="${DOT }"/>
    <c:out value="${SC }"/>
    <c:out value="${DC }"/>
    <c:out value="${P }"/>
	
	<center>
	<h1>Review and Payment Page</h1>
	<h4>Details filled and Flight Booked</h4>
	<table>
 		<tr>
    		<th>Company</th>
   		    <th>Contact</th>
    		<th>Country</th>
  	    </tr>
  	</table>
  	</center>

</body>
</html>