
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title> Login </title>
</head>
<body>
<div id='container'>
  <div class='signup'>
      <form action="LoginAction.jsp" method="post"> 
      	<input type="email" name="email" placeholder="Please Enter Your Email" required>
      	<input type = "password" name= "password" placeholder="Please Enter your Password" required>
      		<input type= "submit" value= "login">
      </form>
      <h2><a href="signup.jsp">SignUp</a></h2>
      <h2><a href="forgotPassword.jsp">Forgot Password?</a></h2>
  </div>
  <div class='whysignLogin'>
  <%
  	String msg = request.getParameter("msg");
  	if("notexist".equals(msg))
  	{
  	%>
  		<h1>Incorrect User Name or Password</h1>	
  <%}%>
  <%  
  	if("invalid".equals(msg))
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