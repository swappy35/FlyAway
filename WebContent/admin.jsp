<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administration Login</title>
</head>
<body>
	<center>
	<h1>Admin Login Access</h1>
    <form action="admin_process.jsp" method="post">
        <table cellpadding="3pt">
            <tr>
                <td>Email :</td>
                <td><input type="email" name="email" size="30" required/></td>
            </tr>
            <tr>
                <td>Password :</td>
                <td><input type="password" name="password" size="30" required/></td>
            </tr>
        </table>
        <br>
        <input type="submit" value="Login" />
        &emsp;&emsp;
        <input type="reset" value="Reset" />
    </form>
    </center>
</body>
</html>