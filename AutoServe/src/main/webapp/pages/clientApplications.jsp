<html lang="en">
<%@ page import = "Servlets.ConnectionProvider"%>
<%@ page import = "java.sql.*" %>
<%


		//getting credentail attributes from loginAction.jsp
		Object sessionEmail = session.getAttribute("Email");
		Object sessionFname = session.getAttribute("FirstName");
		Object sessionLname = session.getAttribute("LastName");
		Object sessionPhone = session.getAttribute("Phone");
		Object sessionPosition = session.getAttribute("Position");
		Object sessionUserID = session.getAttribute("UserID");

		String userID = String.valueOf(sessionUserID);

		String email = String.valueOf(sessionEmail);
		String firstName = String.valueOf(sessionFname);
		String lastName = String.valueOf(sessionLname);
		String phone = String.valueOf(sessionPhone);
		String position = String.valueOf(sessionPosition);
		
		if(firstName != null){
			System.out.println(firstName + " ID: " + userID);
		}
		
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
    
    <title>Client Applications</title>
</head>
<body>
	<!-- Accessing java variables -->
	<span id = "userEmail" class = "getVariables"><% out.print(email); %></span>
	<span id = "userFirstName" class =  "getVariables"><% out.print(firstName); %></span>
	<span id = "userLastName" class =  "getVariables"><% out.print(lastName); %></span>
	<span id = "userPhone" class =  "getVariables"><% out.print(phone); %></span>
	<span id = "userPosition" class = "getVariables"><% out.print(position); %></span>
	<span id = "userID" class = "getVariables"><% out.print(userID); %></span>
	
    <!--Horizontal Header of the web page-->
    <header class="header "><!--FLEXBOX-->

        <h1 id="logo" class = "client-logo">Auto Serve Client Application</h1><!--Logo-->
        
    
        <nav class="navbar"><!--NAVIGATION BAR-->
            <ul class="link-container">
                <li><a href="../index.jsp" id="homePage" class="links">Home</a></li>
                
                <li><a href="#" id="loginPage" class="links jsp-links">
                	<% //Display login/signup button if user is not logged in
                	if (sessionFname == null) 
                		%> Login/Sign-Up <%
                	else System.out.println("(index.jsp)Hid Login/Sign-Up button for client/staff"); %>
                </a></li>

                <li class = "clients-jsp-list-items">
                <a href="../jsp/logoutAction.jsp" class = "Links jsp-linnks"> 
		            <% 
                    //Display logout buttong only if user is logged in 
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

    <!--Content loaded using AJAX with JQuery-->
    <main id = "clientApplication-main">
    <br><br>
       <div id ="header-wrapper">
	        <h2 id = "clientApplication-h2" style = "color: rgb(229,36,14); font-family: $headerFont; font-size: 1.5rem; text-align: center;">Client Applications</h2> 
	        <button type = "button" id = "refreshApplications-btn" style = "display: inline;">Refresh</button>
		</div>
		<br><br>
		<% 
			try{
				//Geting connection to display client applications
				Connection con = ConnectionProvider.getConnection();
				//Create a statement using the connection provider
				Statement state = con.createStatement();
				//Create a result set to return the results from the statement
				String sqlQuery = "SELECT clientID, vehicletype, platenumber FROM registrationQ";
				ResultSet result = state.executeQuery(sqlQuery);
				
				int reg_clientID = 0;
				String reg_vehicleType = "";
				String reg_plateNum = "";
				System.out.println("RegistrationQ TABLE : ");
				//Fetches the data columns and returns the values
				while(result.next()){
					//Session variables
					reg_clientID = result.getInt(1);
					reg_vehicleType = result.getString(2);
					reg_plateNum = result.getString(3);
					
				%>
					<div class = "client-info" style = "
					background: rgb(239 239 239);
					display: inline-block;
					border-radius: .5rem;
					padding: 1%;
					width: 25%;
					text-align: center;
					box-shadow: .2rem .1rem .4rem rgb(223, 223, 223);
	">
							<p class = "reg_clientID">Client ID: <%out.print(reg_clientID); %></p>
							<P class = "reg_VehicleType">Type of Vehicle: <%out.print(reg_vehicleType); %></P>
							<p class = "reg_plateNum">Vehicle Plate Number: <%out.print(reg_plateNum); %></p>
						</div>
					
				<%	System.out.println("Client ID:" +reg_clientID+ " | Vehicle Type: "+reg_vehicleType+ " | Plate Number: " + reg_plateNum+ "\n");
				}
				
				
		}catch(SQLException e){
			System.out.println("Problem returning registration info. SQL Error: " + e);
		}%>
</main>

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
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://kit.fontawesome.com/18479e6558.js"></script>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script>
	
	var car = false;
	var truck = false;
	var van = false;
	var motorbike = false;
	var down = false;
	//var isClicked = false;
	let num = 0;
	let btnValue = "";
	let val = "";
	var step = 1;
	var userID = $("#userID").text();
	
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
	var clientInfo_container = $(".client-info");
	clientInfo_container.css("margin-left", "36%");
	clientInfo_container.css("margin-bottom", "1%");
	var nameStr = parseInt(userFirstName.length);
	
	
	console.log("Position: " + userPosition);
	getVariables.css("position", "absolute");
	getVariables.css("margin-top", "-100%");
	
	$("#refreshApplications-btn").on('click', function(){
		location.reload();
	})

</script>
</body>
</html>