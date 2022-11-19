<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en">
<% 

		//getting credentail attributes from loginAction.jsp
		Object sessionEmail = session.getAttribute("email");
		Object sessionFname = session.getAttribute("firstName");
		//Object sessionLname = session.getAttribute("LastName");
		//Object sessionPhone = session.getAttribute("Phone");
		
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
            		<% if(sessionFname == null)
            			%> Login/Sign-Up <%
            			else System.out.println("Login/Sign-Up Button hidden");
            			%>
            		</a></li>
            <li><a href="../jsp/logoutAction.jsp" class = "links"> 
            <% if(sessionFname == null)
                  System.out.println("Logout button hidden");    
                    		else %> Logout <% %> 
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
                        <input type = "text" name = "firstname" id="firstname" />
                    </td>
                </tr>

                <tr>
                    <td> 
                        <label for="lastname">Last Name:</label><br>
                        <input type = "text" name = "lastname" id= "lastname" />
                    </td>
                </tr>

               
                <tr>
                    <td>
                        <label for="email">Email:</label><br>
                        <input type="email" name="email" id="email" >
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="phone">Phone: </label><br>
                        <input type="text" name="phone" id="phone" >
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="position">Position: </label><br>
                        <select name = "position" id = "position">
                        	<option value = "Staff" class = "role">Staff</option>
                        	<option value = "Mechanic" class = "role">Mechanic</option>
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <label for="password">Password: </label><br>
                        <input type="password" name="password" id="password" >
                        <div id="viewPassword-container"><input type="checkbox" id="viewPwd"><label for="viewPwd">Show Password</label></div>
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

<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/18479e6558.js" crossorigin="anonymous"></script>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script src = "admin.js"></script>
</body>
</html>