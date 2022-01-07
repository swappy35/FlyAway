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
<title>Payment Done</title>
</head>
<body>
	<!-- Connection setup -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/flyaway"
		user="root" password="root"/>		
		
	<c:set var="BiD" value="${param.bid }"/>
	<c:set var="NP" value="${param.np }"/>
	
<!-- Getting data from Booking Details Table -->
	<sql:query var="BookingDetails" dataSource="${db}">
		select * from Booking_Details where Booking_ID=?;
		<sql:param value="${BiD}"/>
	</sql:query>
	<c:forEach var="Booking" items="${BookingDetails.rows}">
        	<c:set var="bID" value="${Booking.Booking_ID}"/>
        	<c:set var="sNO" value="${Booking.S_No_from_pers_dt }"/>
        	<c:set var="fNO" value="${Booking.Flight_No }"/>
    </c:forEach>	

<!-- Getting data from Personal Details Table -->
	<sql:query var="PersonalDetails" dataSource="${db}">
		select * from Personal_Details where S_No=?;
		<sql:param value="${sNO}"/>
	</sql:query>
	<c:forEach var="Personal" items="${PersonalDetails.rows}">
        	<c:set var="fn" value="${Personal.F_Name}"/>
        	<c:set var="ln" value="${Personal.L_Name }"/>
        	<c:set var="email" value="${Personal.Email }"/>
    </c:forEach>
  
<!-- Getting data from Flight Details Table -->
	<sql:query var="FlightDetails" dataSource="${db}">
		select * from Flight_Details where Flight_No=?;
		<sql:param value="${fNO}"/>
	</sql:query>
	<c:forEach var="Flight" items="${FlightDetails.rows}">
        	<c:set var="TS" value="${Flight.Total_Seat}"/>
        	<c:set var="BS" value="${Flight.Booked_Seat }"/>
        	<c:set var="AS" value="${Flight.Available_Seat }"/>
    </c:forEach>

<!-- Alter data in Flight Details Table -->
	<sql:update var="FlightDetails" dataSource="${db}">
		update Flight_Details set Booked_Seat = ?, Available_Seat = ? where Flight_No = ?;
		<sql:param value="${param.np}"/>
		<sql:param value="${TS-NP}"/>
		<sql:param value="${fNO}"/>
	</sql:update>

	<center>
	<h1>Thank You, <c:out value="${fn }"/> <c:out value="${ln }"/></h1>
	<h2>for booking from FLYAWAY</h2>
	<h3>The ticket has been mailed to you on "<c:out value="${email }"/>"</h3>
	<h3>For further more booking, <a href="dashboard.html">Click Here</a>.</h3>
	<h3>Close the site, if done.</h3>
	</center>
	<br><br><br><br>
	
	
<hr>

<jsp:text>
        <![CDATA[Project done by Swapnil Pal]]>
</jsp:text>
</body>
</html>