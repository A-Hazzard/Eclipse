<html lang="en">
<% 

		//getting credentail attributes from loginAction.jsp
		Object sessionEmail = session.getAttribute("Email");
		Object sessionFname = session.getAttribute("FirstName");
		Object sessionLname = session.getAttribute("LastName");
		Object sessionPhone = session.getAttribute("Phone");
		Object sessionPosition = session.getAttribute("Position");

		
		String email = String.valueOf(sessionEmail);
		String firstName = String.valueOf(sessionFname);
		String lastName = String.valueOf(sessionLname);
		String phone = String.valueOf(sessionPhone);
		String position = String.valueOf(sessionPosition);


		String staff = "Staff", admin = "Admin";
		
		if(sessionFname == null){
            System.out.println("(index.jsp)Username hidden\n");
            System.out.println("(index.jsp)Not logged in\n");
        }else{
           
            System.out.println("(index.jsp)Logged in as " + sessionFname + "\n");
        }
		
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../style/style.css">
    <link rel="shortcut icon" type="image/x-icon" href="https://th.bing.com/th/id/OIP.cAA3eIjKFPQHSQJTSnmTMgHaHa?pid=ImgDet&rs=1    " />
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <style>
    	.jsp-userName{ color: blue;
    	 			display: inline;
                    text-decoration: none;
                    color: hsl(0, 0%, 13%);
                    font-size: 1.1rem;
                    font-family: 'Roboto';
                    }
    </style>
    
    <title>Auto Serve ADMIN</title>
</head>
<body>
    <!--Horizontal Header of the web page-->
    <header class="header "><!--FLEXBOX-->

        <h1 id="logo">Auto Serve ADMIN</h1><!--Logo-->
        
       
        <nav class="navbar"><!--NAVIGATION BAR-->
            <ul class="link-container">
                <li><a href="../index.jsp" id="homePage" class="links">Home</a></li>
                <li><a href="#" id="calculatorPage" class="links">Calculator</a></li>
                <li><a href="../pages/jobsPages.html" id="jobsPage" class="links">Jobs</a></li>
                <li><a href="#" id="aboutUsPage" class="links">About</a></li>
                <li><a href="#" id = "servicesPage" class="links">Services</a></li>
                
                
                <li><a href="../pages/clients.html" class="links jsp-links">
                	<% //Display  clients button only if user is either staff or admin
                	if(position.equals(staff) || position.equals(admin))
                		%> Client Applications <% 
                	   else System.out.println("(index.jsp)Not an admin or staff. Hid Clients link. Email: " + email); %>
                	
                </a></li>
                
                <li><a href="#" id="loginPage" class="links jsp-links">
                	<% //Display login/signup button if user is not logged in
                	if (sessionFname == null) 
                		%> Login/Sign-Up <%
                	 else System.out.println("(index.jsp)Hid Login/Sign-Up button for client/staff"); %>
                </a></li>
                <li><a href="../jsp/logoutAction.jsp" class = "Links jsp-linnks"> 
		                <% //Display logout buttong only if user is logged in 
		                if(sessionFname == null) 
		                	System.out.println("(index.jsp)Logout button hidden");         
				        else %> Logout 
				</a></li>
                <li style = "text-align: center;font-size: 2rem;">
                <span class = "profile-name jsp-userName">         
                <% //Display client button only if user is admin/staff 
                if(sessionFname == null)
                	System.out.println("(index.jsp)Username hidden\n");
                else {
                	if(position.equals(admin))
                		out.print(firstName + "("+position+")");
                			else if (position.equals(staff))
                				out.print(firstName + "("+position+")");
                				else
                					out.print(firstName + "("+position+")");
                	
                	System.out.println("(index.jsp)Logged in as " + firstName + "\n");
                	}
                %>

  				 </span></li>

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