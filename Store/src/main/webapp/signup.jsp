<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
    	<form action = "signupAction.jsp" method = "post">
    		<input type = "text" name = "name" placeholder = "Enter Name" required>
    	  <input type = "text" name = "email" placeholder = "Enter Email" required>
        <input type = "text" name = "mobile" placeholder = "Enter Mobile Number" required>
        <select name = "securityQuestion" required>
          <option value = "Where were you born?">Where were you born?   </option>
          <option value = "What was your first pet?">What was your first pet? </option>
          <option value = "What is your grandmother's name?">What is your grandmother's name? </option>
          <option value = "What primary school did you attend?">What primary school did you attend? </option>
        </select>

        <input type = "text" name = "answer" placeholder = "Enter Answer" required />
        <input type = "password" name = "password" placeholder = "Enter Password" required />
        <input type = "submit" value = "Sign Up" required />

    	</form>
    	
    	
    	
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>


	<% 
	String msg = request.getParameter("msg");
	if("valid".equals(msg)) 
	 {
	%>	<h1>Successfully Registered</h1>
	<% } %>
		<% 
		if("invlid".equals(msg))
		{
		%> <h1>Some thing Went Wrong! Try Again !</h1> 
		<% } %>

    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
  
  
</div>

</body>
</html>