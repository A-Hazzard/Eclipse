<!DOCTYPE html>
<html lang="en">
<% 

		//getting credentail attributes from loginAction.jsp
		Object sessionEmail = session.getAttribute("Email");
		Object sessionFname = session.getAttribute("FirstName");
		Object sessionLname = session.getAttribute("LastName");
		Object sessionPhone = session.getAttribute("Phone");
		
		 if(sessionFname == null){
                        System.out.println("Username hidden\n");
                        
                    }else{
                       
                        System.out.println("Logged in as " + sessionFname + "\n");
                    }
%>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../style/style.css">
        <link rel="shortcut icon" type="image/x-icon" href="https://th.bing.com/th/id/OIP.cAA3eIjKFPQHSQJTSnmTMgHaHa?pid=ImgDet&rs=1    " />
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <title>Auto Serve ADMIN</title>
    </head>
</head>
<body>

  <!--Horizontal Header of the web page-->
  <header class="header "><!--FLEXBOX-->

    <h1 id="logo">Auto Serve Inc.</h1><!--Logo-->
    

    <nav class="navbar"><!--NAVIGATION BAR-->
        <ul class="link-container">
            <li><a href="#" id="homePage" class="links">Home</a></li>
            <li><a href="#" id="calculatorPage" class="links">Calculator</a></li>
            <li><a href="pages/jobsPages.html" id="jobsPage" class="links">Jobs</a></li>
            <li><a href="#" id="aboutUsPage" class="links">About</a></li>
            <li><a href="#" id = "servicesPage" class="links">Services</a></li>
            <li><a href="pages/clients.html" class="links">Clients</a></li>
            <li><a href="#" id="loginPage" class="links">
            <%	if(sessionFname == null || sessionLname == null)
            		System.out.println("Login/SignUp Buttons Hidden\n");
            			else %> Login/Sign-Up <%  %>
            		</a></li>
            <li><a href="../jsp/logoutAction.jsp" class = "links"> 
            <%
                    if(sessionFname == null || sessionLname == null)
                        %> Logout <%     
                    		else %> System.out.println("Logout button hidden");  <% %>
                    </a></li>

        </ul>
    </nav>

</header>
    <main id="admin-main">
          <!--Main content for login page-->
    <div id = "access-main">
<br><br>

        <h2>Welcome Admin</h2>
        <p>Register your new staff members</p>


        <form action="../RegServlet" method="post" class="Form">
            <table id="loginFormTable">
                <tr>
                    <td> 
                        <label for="firstname">First Name:</label><br>
                        <input type = "text" name = "firstname" id="firstname" required/>
                    </td>
                </tr>

                <tr>
                    <td> 
                        <label for="lastname">Last Name:</label><br>
                        <input type = "text" name = "lastname" id= "lastname" required/>
                    </td>
                </tr>

               
                <tr>
                    <td>
                        <label for="email">Email:</label><br>
                        <input type="email" name="email" id="email" required>
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="phone">Phone: </label><br>
                        <input type="text" name="phone" id="phone" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="position">Position: </label><br>
                        <input type="text" name="position" id="position" required>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <label for="password">Password: </label><br>
                        <input type="password" name="password" id="password" required>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <br>
                        <a href = "pages/forgotPassword.html" id="forgotpassword">Forgot Password</a>
                    </td>
                </tr>

                <tr>
                    <td><input type="submit" value="Sign Up" id="submit"/></td>
                </tr>
            </table>
        </form>

		
</div>
    </main>

</body>
</html>