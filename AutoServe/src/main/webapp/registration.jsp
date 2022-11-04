<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AutoServe Inc. Registration</title>
</head>
<body>
	<h1>Register for you AutoServe Account</h1>
		<form action = "RegServlet" method = "post">
			<table>
				<tr>
                    <td>First Name: <input type = "text" name = "firstname" required/></td>
                </tr>

                <tr>
                    <td>Last Name: <input type = "text" name = "lastname" required/></td>
                </tr>

                <tr>
                    <td>Email: <input type = "text" name = "email" required/></td>
                </tr>

                <tr>
                    <td>Password: <input type = "text" name = "password" required/></td>
                </tr>

                <tr>
                    <td><input type = "submit" value = "Sign-Up" required/>
                </tr>
			
			</table>
		
		</form>
</body>
</html>