<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New User</title>
</head>
<body>
	<center>
	<h1>Registration Form</h1>
    <form action="register_process.jsp" method="post">
        <table cellpadding="3pt">
            <tr>
                <td>Email :</td>
                <td><input type="email" name="email" size="30" required/></td>
            </tr>
            <tr>
                <td>Password :</td>
                <td><input type="password" name="password1" size="30" required/></td>
            </tr>
            <tr>
                <td>Confirm Password :</td>
                <td><input type="password" name="password2" size="30" required/></td>
            </tr>
        </table>
        <br>
        <input type="submit" value="Register" />
        &emsp;&emsp;
        <input type="reset" value="Reset" />
    </form>
    </center>
</body>
</html>