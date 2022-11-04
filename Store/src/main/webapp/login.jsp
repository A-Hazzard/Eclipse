<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
      <form action="loginAction.jsp" method="post"> 
      	<input type="email" name="email" placeholder="Please Enter Your Email" required>
      	<input type="password" name="password" placeholder="Please Enter Your Password" required>
      	<input type="submit" value="login">
      </form>
      <h2><a href="signup.jsp">SignUp</a></h2>
      <h2><a href="forgotPass.jsp">Forgot Password?</a></h2>
  </div>
  <div class='whysignLogin'>
  <%
  	String message = request.getParameter("msg");
  	if("notexist".equals(message))
  	{
  	%>
  		<h1>Incorrect User Name or Password</h1>	
  <%}%>
  <%  
  	if("invalid".equals(message))
  	{
  	%>
  		<h1>Some thing Went Wrong! Try Again !</h1>	
  <%}%>

  <h2>Online Shopping</h2>
    <p>Online Shopping allows the users to shop online.</p>
  </div>
</div>

</body>
</html>