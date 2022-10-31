<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>AutoServe Login</title>
</head>
<body>
    <!--Horizontal Header of the webpage-->
    <header class="header">
        <h1 style="color: white;">LOGO GOES HERE</h1>
        <nav class="navbar">
            <ul class="link-container">
                <li><a href="#" class="links">Link</a></li>
                <li><a href="#" class="links">Link</a></li>
                <li><a href="#" class="links">Link</a></li>
                <li><a href="#" class="links">Link</a></li>
                <li><a href="#" class="links">Link</a></li>
                <li><a href="#" class="links">Link</a></li>
            </ul>
        </nav>
    </header>
    <!--Main content for login page-->
    <main>
        <!--Form used for logging in-->
        <form action="LoginServlet" method="post" id="loginForm">
            <table id="loginFormTable">
                <tr>
                    <td>
                        <label for="firstName">First Name: </label>
                        <input type="text" name="firstName" id="firstName">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="lastName">Last Name: </label>
                        <input type="text" name="lastName" id="lastName">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="email">Email Address: </label>
                        <input type="email" name="email" id="email">
                    </td>
                </tr>

                 <tr>
                    <td>
                        <label for="password">Password: </label>
                        <input type="password" name="password" id="password">
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="phone">Phone Numer: </label>
                        <input type="text" name="phone" id="phone">
                    </td>
                </tr>
    
                <tr>
                    <td>
                        <input type="submit" value="Register" id="submit">
                    </td>
                </tr>
            </table>
        </form>
    </main>
  
</body>
</html>