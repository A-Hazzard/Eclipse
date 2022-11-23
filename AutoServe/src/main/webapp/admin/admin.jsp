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
<!-- Accessing java variables -->
	<span id = "userEmail" class = "getVariables"><% out.print(email); %></span>
	<span id = "userFirstName" class =  getVariables><% out.print(firstName); %></span>
	<span id = "userLastName" class =  getVariables><% out.print(lastName); %></span>
	<span id = "userPhone" class =  getVariables><% out.print(phone); %></span>
	<span id = "userPosition" class = getVariables><% out.print(position); %></span>
	<!-- --------------------------- -->
   <!--Horizontal Header of the web page-->
    <header class="header "><!--FLEXBOX-->

        <h1 id="logo" class ="admin-logo"><a href = "../index.jsp" 
        style = "text-decoration: none; color: black;">Auto Serve Inc.</a></h1><!--Logo-->
        
       
        <nav class="navbar admin-navbar"><!--NAVIGATION BAR-->
            <ul class="link-container">
                
                <li><a href="#" id="calculatorPage" class="links">Calculator</a></li>
                <li><a href="../pages/jobsPages.html" id="jobsPage" class="links">Jobs</a></li>
                <li><a href="#" id="aboutUsPage" class="links">About</a></li>
                <li><a href="#" id = "servicesPage" class="links">Services</a></li> 
                	<% //Display  clients link only if user is either staff or admin
                        if(position.equals(staff) || position.equals(admin)) {
                            %> <li>
                            <a href="../pages/clientApplications.jsp" class="links jsp-links">Client Applications </a>
                            </li> <% }
                        else System.out.println("(index.jsp)Not an admin or staff. Hid Clients link. Email: " + email); 
                    %>

                	<% //Display login/signup link if user is not logged in
                        if (sessionFname == null){ 
                        %> <li><a href="#" id="loginPage" class="links jsp-links">Login/Sign-Up</a>
                            </li> <% }
                        else System.out.println("(index.jsp)Hid Login/Sign-Up button for client/staff"); 
                    %>

                    <% //Display admin portal link if user position = admin
                        if(position.equals("Admin")) {
                        %><li><a href="admin/admin.jsp" id="adminPortal" class="links jsp-links">Admin Portal</a>
                        </li> <% }
                        else System.out.println("(login.jsp) Admin Portal Link hidden. Not Admin\n");
                    %>
		                <% //Display logout link only if user is logged in 
                            if(sessionFname == null) 
                                System.out.println("(index.jsp)Logout button hidden");         
                            else %><li class = "index-jsp-list-items">
                                    <a href="../jsp/logoutAction.jsp" class = "Links jsp-linnks">Logout</a>
                                    </li>
			
				
                <!--Display user name if logged in-->
                <% if (firstName != null) { %>
                    <li style = "text-align: center;font-size: 2rem;">
                        <span class = "profile-name jsp-userName">         
                        <% //Display client link only if user is admin/staff 
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
                    %></span></li>
                <% } %>
            </ul>
        </nav>

    </header>


    <!--Content loaded using AJAX with JQuery-->
    <main data-aos="zoom-in"
        data-aos-offset="0"
        data-aos-delay="1"
        data-aos-duration="500"
        data-aos-easing="ease-in-out"
        data-aos-mirror="true"
        data-aos-once="false"
        data-aos-anchor-placement="top" id = "admin-main" style = "height: 100vh;">
        <br><br><br><br>
        <h2 style = "text-align: center;">ADMIN PAGE, COMING SOON...</h2>
    </main>
    
    <br><br>
    
    <footer>
        <div id="flex-container">
            <div id="footer-nav">
                <h4>Quick Links</h4> 
                <br>
                    <ul>
                        <li class="categories" id="cars">Cars</li>
                        <li class="categories" id="bikes">Bikes</li>
                        <li class="categories" id="scooters">Scooters</li>
                    </ul>
            </div>
            <!--LOAD LINKS FROM footer-nav using JQuery-->
            <div id="footer-links"></div>
        </div>
            <br><br>
            <p id="copyright" style="text-align: center; opacity: .5;">Copyright © 2022 Auto Serve Inc. All Rights Reserved.</p>
    </footer>
 </body> 
<script src="https://code.jquery.com/jquery-3.6.1.min.js" ></script>
<script src="https://kit.fontawesome.com/18479e6558.js" ></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" ></script>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script src="admin.js"></script>

<script>

var car = false;
var truck = false;
var van = false;
var motorbike = false;
var down = false;
var step = 1;
var clientID = $("#clientID").text();
var fName = $(".profile-name").text();

var userEmail = $("#userEmail").text();
var userFirstName = document.getElementById("userFirstName").innerHTML;
var userLastName = document.getElementById("userLastName").innerHTML;
var userFullName = userFirstName.concat(userLastName);
var userPhone = $("#userPhone").text();
var userPosition = $("#userPosition").text();

var fNameContainer_text = $(".profile-name-container").text();
var getVariables = $(".getVariables");
var fNameContainer = $(".profile-name-container");
var nameStr = parseInt(userFirstName.length);


console.log("Position: " + userPosition);
getVariables.css("position", "absolute");
getVariables.css("margin-top", "-100%");


if (userPosition != "Admin" || userPosition != "Staff"){
	console.log(userPosition + "\'s ID: " + clientID);
}

if(userFullName != 4){
	if(userFullName != "nullnull") setStyle();
    console.log("Logged in. Length: " + fNameContainer_text.length);

}
else if(userFullName.length = 4){
    unsetStyle();
	console.log("Logged out now. Length: " + fNameContainer_text.length);
}



function setStyle(){
    fNameContainer.css("border", "1px solid black");
    fNameContainer.css("border-radius", "50%");
    fNameContainer.css("margin-top", "-2.5%");
    fNameContainer.css("width", "30px");
    fNameContainer.css("height", "30px");
    fNameContainer.css("text-align", "center");
    fNameContainer.css("display", "flex");
    fNameContainer.css("align-items", "center");
    fNameContainer.css("justify-content", "center");
	
	if(userPosition == "Staff") {
		console.log("staff styling now");
		fNameContainer.css("margin-left", "70%");
	}
	else if (userPosition == "Client"){
		console.log("Client styling now");
		fNameContainer.css("margin-left", "51%");
	}
	
}

function unsetStyle(){
	console.log("unsetting");
    fNameContainer.css("border", "none");
    fNameContainer.css("color", "red");
    fNameContainer.css("border-radius", "unset");
    fNameContainer.css("margin-left", "unset");
    fNameContainer.css("margin-top", "unset");
    fNameContainer.css("width","unset");
    fNameContainer.css("height", "unset");
    fNameContainer.css("text-align", "unset");
    fNameContainer.css("display", "unset");
    fNameContainer.css("align-items", "unset");
    fNameContainer.css("justify-content", "unset");
}
</script>


<!-- 
TO DO:
IF USER POSITION = ADMIN
> DISPLAY ADMIN CONTENT
ELSE IF USER POSITION = STAFF/CLIENT
> DISPLAY ONLY ADMIN CANT VIEW THIS CONTENT
ELSE IF POSITION === NULL
> DISPLAY ADMIN LOGIN PAGE

-->