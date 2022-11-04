<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
	<h1>LOGIN PAGE</h1>
	<form action = "LoginServlet" method = "post">
		<table>
			<tr>
				<td>User Name: <input type = "text" name = "userName" placeholder = "User Name" /></td>
			</tr>
			<tr>
				<td>Password: <input type = "password" name = "pwd" /></td>
			</tr>
			<tr>
				<td>User Name: <input type = "submit" value="Login" /></td>
			</tr>
		</table>
	
	</form>
</body>
</html>