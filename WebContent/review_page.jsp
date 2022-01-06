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
    
    <!-- Getting data from Search details DB -->
	<sql:query var="Search_Data" dataSource="${db}">
		select * from Search_Details ORDER BY S_No_Search DESC LIMIT 1;
	</sql:query>
	<c:forEach var="SDrows" items="${Search_Data.rows}">
        	<c:set var="DOT" value="${SDrows.DOT}"/>
        	<c:set var="SC" value="${SDrows.Src_City }"/>
        	<c:set var="DC" value="${SDrows.Dest_City }"/>
        	<c:set var="P" value="${SDrows.Persons }"/>
    </c:forEach>
    
    <!-- Getting data from Search details DB -->
	<sql:query var="Flight_Data" dataSource="${db}">
		select * from Flight_Details where Flight_No=?;
		<sql:param value="${param.FB}"/> 
	</sql:query>
	
	<center>
	<h1>Review and Payment Page</h1>
	<h4>Details filled and Flight Booked</h4>
	<table style="width:25%" cellpadding="3pt">
 		<tr>
    		<th>Flight booked by: </th> <td><c:out value="${F_Name}"/>
    										<c:out value="${M_Name}"/>
    										<c:out value="${L_Name}"/></td>
  	    </tr>
  	    <tr>
    		<th>Total Seats Booked: </th> <td><c:out value="${P}"/></td>
  	    </tr> 
 		<tr>
    		<th>Age: </th> <td><c:out value="${Age}"/></td>
  	    </tr> 
 		<tr>
    		<th>Email: </th> <td><c:out value="${em}"/></td>
  	    </tr> 
 		<tr>
    		<th>Mobile Number: </th> <td><c:out value="${Mobile_NO}"/></td>
  	    </tr>
 		<tr>
    		<th>Government ID: </th> <td><c:out value="${Govt_ID}"/>
    									 <c:out value="-"/>
    									 <c:out value="${Govt_ID_NO}"/></td>
  	    </tr>   		
  	    <tr>
    		<th>Address: </th> <td><c:out value="${Address}"/></td>
  	    </tr>  		
  	    <tr>
    		<th>Country: </th> <td><c:out value="${Country}"/></td>
  	    </tr>  	
  	</table>
  	<br>
  	<table>
		<tr>
		<th>Flight No.</th>
		<th>Airline Name</th>
		<th>Price</th>
		<th>Source City</th>
		<th>Departure Time</th>
		<th>Destination City</th>
		<th>Arrival Time</th>
		<th>Total Seat</th>
		<th>Booked Seat</th>
		<th>Available Seat</th>
		<th>Date of Travel</th>
		<th>Class</th>
		</tr>
		<c:forEach var="FDrow" items="${Flight_Data.rows}">
    	<tr>
        <td><c:out value="${FDrow.Flight_No }"/></td>
        <td><c:out value="${FDrow.Airline_Name }"/></td>
        <td><c:set var="PRICE" value="${FDrow.Price }"/><c:out value="${FDrow.Price }"/></td>
        <td><c:out value="${FDrow.Src_City }"/></td>
        <td><c:out value="${FDrow.Dep_Time }"/></td>
        <td><c:out value="${FDrow.Dest_City }"/></td>
        <td><c:out value="${FDrow.Arr_Time }"/></td>
        <td><c:out value="${FDrow.Total_Seat }"/></td>
        <td><c:out value="${FDrow.Booked_Seat }"/></td>
        <td><c:out value="${FDrow.Available_Seat }"/></td>
        <td><c:out value="${FDrow.DOT }"/></td>
       	<td><c:out value="${FDrow.Class }"/></td>
 		</tr>
 		</c:forEach>
  	</table>
  	<h2>Click on the image below to pay &#8377;<c:out value="${PRICE }"/> and confirm the flight!!!</h2>
  	<a href="payment_page.jsp?bid=<c:out value="${BID }"/>&np=<c:out value="${P}"/>">
  	<img src="https://www.piet.co.in/wp-content/uploads/2016/06/payment.png" 
  			alt="Payment.png"
  			width="380" height="130"/>
  	</a>
  	</center>

</body>
</html>