<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Page</title>
</head>
<body>
	<center>
	<h1>Travel Details</h1>
    <form action="search_page_process.jsp" method="post">
    <table cellpadding="3pt">
    	<tr><td>Date of Travel:</td> <td><input type="date" name="DOT" required/></td></tr>
    			<tr>
				<td><label for="SCity">Source City: </label></td>
						<td>
					    <select name="SCity" id="SCity" required>
						<option ></option>
						<option value="Delhi" >Delhi</option>
  						<option value="Mumbai" >Mumbai</option>
  						<option value="Chennai" >Chennai</option>
 						<option value="Kolkata" >Kolkata</option>
						</select>
						</td>
				</tr>
				<tr>
				<td><label for="DCity">Destination City: </label></td>
						<td>
						<select name="DCity" id="DCity" required>
						<option ></option>
						<option value="Delhi" >Delhi</option>
  						<option value="Mumbai" >Mumbai</option>
  						<option value="Chennai" >Chennai</option>
 						<option value="Kolkata" >Kolkata</option>
						</select>
						</td>
				</tr>
        <tr><td>Number of Persons:</td> <td><input type="number" name="NPersons" size="2" required/></td></tr>
        <tr><td></td></tr>
        <tr>
        <td>&emsp;&emsp;&emsp;&emsp;<input type="submit" value="Search" /></td>
        
        <td>&emsp;&emsp;&emsp;<input type="reset" value="Reset" /></td>
        </tr>
    </table>
    </form>	
    </center>
	
</body>
</html>