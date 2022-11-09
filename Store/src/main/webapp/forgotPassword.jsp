<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
     <form action="forgotPasswordAction.jsp" method="post"> 
      	<input type="email" name="email" placeholder="Please Enter Your Email" required>
      	<input type="text" name="password" placeholder="Please Enter Your Phone Number" required>
         <select name = "securityQuestion" required>
          <option value = "Where were you born?">Where were you born?   </option>
          <option value = "What was your first pet?">What was your first pet? </option>
          <option value = "What is your grandmother's name?">What is your grandmother's name? </option>
          <option value = "What primary school did you attend?">What primary school did you attend? </option>
        </select>

        <input type = "text" name = "answer" placeholder = "Enter Answer" required />
        <input type = "password" name = "password" placeholder = "Enter Password" required />
        <input type = "submit" value = "Save" required />
      </form>

      
      <h2><a href="">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
 <%
  	String message = request.getParameter("msg");
  	if("done".equals(message))
  	{
  	%>
  		<h1>Password Changed</h1>	
  <%}%>
  <%  
  	if("invalid".equals(message))
  	{
  	%>
  		<h1>Some thing Went Wrong! Try Again !</h1>	
  <%}%>


    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>
</body>
</html>