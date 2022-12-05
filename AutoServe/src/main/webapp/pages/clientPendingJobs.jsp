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
		String userEmail = String.valueOf(sessionEmail);
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
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Lora&family=Secular+One&display=swap" rel="stylesheet">

    <style>
    	.jsp-userName{ color: blue;
    	 			display: inline;
                    text-decoration: none;
                    color: hsl(0, 0%, 13%);
                    font-size: 1.1rem;
                    font-family: 'Roboto';
                    }
		.info {font-family: "Secular One", Roboto; font-weight: 350;}
		.sub-info {font-family: "Segoe UI", Roboto; font-weight: 400;}
		#applications{}
	
		
		
    </style>
    
    <title>Pending Jobs</title>
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
    <main id = "clientPendingApplication-main">
		
			<div id = "header-container">	
					<h2 id = "jobApplication-h2">Pending Appointments</h2> 
				</div>
				
				<h3 style = "text-align: center; width: 100vw; font-size: 3rem; color: red;">You have no pending Applications</h3>
					
		<% 
		//Mechanic email already initialized on login
		int ClientID = 0;
		String reg_mechEmail = "";
		String reg_staffEmail = "";
		String reg_vehicleType = "";
		String reg_plateNum = "";
		String reg_issues = "";
		String reg_category = "";
		String reg_mechanicFeedback = "";
		String reg_status = "";

			try{
				//Geting connection to display client applications
				Connection con = ConnectionProvider.getConnection();
				
				//Create a statement using the connection provider
				Statement state = con.createStatement();
				
				//Create a result set to return the results from the statement
				String engineRepair = "SELECT * FROM pendingClients WHERE clientID = '"+userID+"'";
				
			
				ResultSet result = state.executeQuery(engineRepair);
				
				int reg_clientID = 0;
			
				System.out.println("Pending TABLE : ");
				
				//Fetches the data columns and returns the values
				while( result.next()){
					//completedJobsTable
					reg_vehicleType = result.getString(2);
					reg_plateNum = result.getString(3);
					reg_issues = result.getString(4);
					reg_category = result.getString(5);
					System.out.println("Pending forms: \n" + reg_vehicleType + "\n" +  reg_plateNum+ "\n" +  reg_issues + "\n" + reg_category);
					
				%>
					<div class = "client-info" style = "
					background: rgb(239 239 239);
					border-radius: .5rem;
					padding: 1%;
					height: 30%;
					width: 40%;
					text-align: left;
					box-shadow: .2rem .1rem .4rem rgb(223, 223, 223);
					position: relative;
					margin-left: 5%">
					<form action = "../jsp/dropPendingApplications.jsp" method = "POST" id = "pendingApplication-form">
							<label class = "hidden" for="clientID_input">ID: <span class = "span-client-ID sub-info"></span></label>
							<input class = "hidden clientID_input" type = "text" name = "clientID_input"  required>
				
							<label for = "vehicleType_input" class = "reg_VehicleType info">Type of Vehicle:  <span class = "type" class = "sub-info"><%out.print(reg_vehicleType); %></span></label><br>
												<input type = "text" name="vehicleType_input" class="vehicleType_input" class = "hidden"   required>
							<label for = "plateNum_input" class = "reg_plateNum info">Vehicle Plate Number:  <span class = "pNum" class = "sub-info"><%out.print(reg_plateNum); %></span></label>
												<input type="text" name="plateNum_input" class="plateNum_input" class = "hidden"  required><br>
							<label for = "issues_input" class = "reg_issues info">Issues:  <span class = "issues" class = "sub-info"><%out.print(reg_issues); %></span></label>
												<input type="text" name="issues_input" class="issues_input" class = "hidden"  required><br>
							<label for = "category_input" class = "reg_category info">Category:  <span class = "category" class = "sub-info"><%out.print(reg_category); %></span></label>
												<input type="text" name="category_input" class="category_input" class = "hidden"  required><br>
							
							<button type = "submit" value = "CancelAppointment" style = "padding: 3%; color: black; font-size: 1rem; font-style: bold; font-family: $headerFont; background-color: white; border: none; border-radius: .5rem;">Cancel Appointment</button>
						</form>
						</div>
					
				<%	
				
				System.out.println("Client ID:" +reg_clientID+ "\nMechanic\'s Email:  "+userEmail+" | Vehicle Type: "+reg_vehicleType+ " | Plate Number: " + reg_plateNum+ "\nIssues: " + reg_issues+ "\nCurrent Status: " + reg_status);
				}//end while
					
		}catch(SQLException e){
			System.out.println("Problem returning registration info. SQL Error: " + e);
		}
	%>
			
	   
	</main>

 <footer style = "position: static;">
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
	const info = $(".client-info > .info");
	let clientInfo = $(".client-info");
	const orange = "rgb(229,36,14)";
	//clientInfo_container.css("margin-left", "20%");
	clientInfo_container.css("margin-bottom", "5%");
	info.css("fontSize","1.5rem");
	clientInfo.find("span").css("fontSize", "1.2rem");


	var nameStr = parseInt(userFirstName.length);
    $("#mechanicEmail_input").val(userEmail);

	
	console.log("Position: " + userPosition);
	getVariables.css("position", "absolute");
	getVariables.css("margin-top", "-100%");
	if($(".client-info").length >= 1) {
		$("h3").css("display", "none");
	}else{
		$("main").css("height", "80vh");

	}

		//For each client application that loads on the website, display their information
		clientInfo_container.each(function(){
			//Variables for each div
			let type = $(this).find(".type").text();
			let pNum = $(this).find(".pNum").text();
			let issues = $(this).find(".issues").text();
			let status = $(this).find(".status").text();
			let category = $(this).find(".category").text();
			let ID = $(this).find(".span-client-ID");
			//Init empy input field values
			let vehicleType_input = $(this).find(".vehicleType_input");
			let plateNum_input = $(this).find(".plateNum_input");
			let issues_input = $(this).find(".issues_input");
			let status_input = $(this).find(".status_input");
			let category_input = $(this).find(".category_input");
			let userID_input = $(this).find(".clientID_input");
				//Append values stored in span tags to input fields	
					plateNum_input.val(pNum);
						vehicleType_input.val(type);
							issues_input.val(issues);
								category_input.val(category);
									ID.text(userID);
										userID_input.val(ID.text());
$("#pendingApplication-form > .hidden").css("position", "absolute");
$("#pendingApplication-form > .hidden").css("margin-left", "-1000%");
$("#pendingApplication-form > input[type=text]").css("margin-left", "-1000%");
$("#pendingApplication-form > input[type=text]").css("position", "absolute");


		$("button").on('click',()=>{console.log("clicked");})
})//End clientInfo_container method

</script>
</body>
</html>