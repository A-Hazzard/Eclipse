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
    
    <title>Assignment History</title>
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
				<%if(position.equals(staff)){
                	%> <li><a href = "../pages/jobApplications.jsp" class="links">Job Applications</a></li>
                <%} %>
                <li style = "text-align: center;font-size: 2rem;">
                <span class = "profile-name jsp-userName" style = "margin-left: 2%;">         
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
		
			<div id = "header-container">	
					<h2 id = "jobApplication-h2">Assigned Tasks</h2> 
				</div>
	
			
							<h3 style = "text-align: center; width: 100vw; font-size: 3rem; color: red;">You haven't been assigned to any jobs</h3>
			
				
		<% 
		//Mechanic email already initialized on login
		int ClientID = 0;
		String reg_mechEmail = "";
		String reg_staffEmail = "";
		String reg_vehicleType = "";
		String reg_plateNum = "";
		String reg_issues = "";
		String reg_mechanicFeedback = "";
		String reg_status = "";
		String reg_invoice = ""; 
		String reg_category = "";

			try{
				//Geting connection to display client applications
				Connection con = ConnectionProvider.getConnection();
				
				//Create a statement using the connection provider
				Statement state = con.createStatement();
				
				//Create a result set to return the results from the statement
				String engineRepair = "SELECT * FROM jobs where mechanicEmail = '" +userEmail+"'";
				
			
				ResultSet result = state.executeQuery(engineRepair);
				
				int reg_clientID = 0;
			
				System.out.println("jobs TABLE : ");
				
				//Fetches the data columns and returns the values
				while( result.next()){
					//completedJobsTable
					reg_clientID = result.getInt(1);
					reg_staffEmail = result.getString(3);
					reg_vehicleType = result.getString(4);
					reg_plateNum = result.getString(5);
					reg_issues = result.getString(6);
					reg_category = result.getString(7);
					reg_status = result.getString(8);
					
				%>
					<div class = "client-info" style = "
					background: rgb(239 239 239);
					border-radius: .5rem;
					padding: 1%;
				
					width: 40%;
					text-align: left;
					box-shadow: .2rem .1rem .4rem rgb(223, 223, 223);
					position: relative;
					margin-left: 5%">
					
							<P class = "reg_mechanicEmail info">Staff's contact email:  <span id = "mechanicEmail" class = "sub-info"><%out.print(reg_staffEmail); %></span></P>
							<P class = "reg_VehicleType info">Type of Vehicle:  <span id = "type" class = "sub-info"><%out.print(reg_vehicleType); %></span></P>
							<p class = "reg_plateNum info">Vehicle Plate Number:  <span id = "pNum" class = "sub-info"><%out.print(reg_plateNum); %></span></p>
							<p class = "reg_issues info">Issues:  <span id = "issues" class = "sub-info"><%out.print(reg_issues); %></span></p>
							<p class = "reg_status info">Status:  <span id = "status" class = "sub-info"><%out.print(reg_status); %></span></p>
							<p class = "reg_category info">Category:  <span id = "category" class = "sub-info"><%out.print(reg_category); %></span></p>

						</div>
					
				<%	
				
				System.out.println("Client ID:" +reg_clientID+ "\nMechanic\'s Email:  "+userEmail+" | Vehicle Type: "+reg_vehicleType+ " | Plate Number: " + reg_plateNum+ "\nIssues: " + reg_issues+ "\nCurrent Status: " + reg_status);
				}//end while
					
		}catch(SQLException e){
			System.out.println("Problem returning registration info. SQL Error: " + e);
		}
	%>
				
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
	var refreshBtn = $("#refreshApplications-btn");
	const info = $(".client-info > .info");
	let clientInfo = $(".client-info");
	const orange = "rgb(229,36,14)";
	let bookNowBtn = $("#bookNow-btn"); 
	bookNowBtn.css("background", "grey");
	bookNowBtn.css("opacity", ".5");
	bookNowBtn.css("animation", "none");
	bookNowBtn.css("cursor", "unset");
	let currentStatus = $("#currentStatus");
	currentStatus.val(currentStatus.text());
	//clientInfo_container.css("margin-left", "20%");
	clientInfo_container.css("margin-bottom", "5%");
	info.css("fontSize","1.5rem");
	clientInfo.find("span").css("fontSize", "1.2rem");


	var nameStr = parseInt(userFirstName.length);
    $("#mechanicEmail_input").val(userEmail);

	
	console.log("Position: " + userPosition);
	getVariables.css("position", "absolute");
	getVariables.css("margin-top", "-100%");
	
	//refreshes the applications
	refreshBtn.on('click', ()=>location.reload());
	if($(".client-info").length >= 1) {
		$("h3").css("display", "none");
	}else{
		$("main").css("height", "80vh");

	}

		//For each client application that loads on the website, display their information
		clientInfo_container.each(function(){
			//Variables for each div
			let ID = $(this).find("#ID").text();
			let staffEmail = $(this).find("staffEmail").text();
			let type = $(this).find("#type").text();
			let pNum = $(this).find("#pNum").text();
			let issues = $(this).find("#issues").text();
			let status = $(this).find("#status").text();

			//Initialize empty tag values
			let spanClient_ID = $(".span-client-ID");
			let spanClient_vehicleType = $(".span-client-vehicleType");
			let spanClient_plateNum = $(".span-client-plateNum");
			let spanClient_Issues = $(".span-client-issues");
			let spanClient_status = $(".span-client-status");
			//Init empy input field values
			let plateNum_input = $("#plateNum_input");
			let vehicleType_input = $("#vehicleType_input");
			let clientID_input = $("#clientID_input");
			let mechEmail_input = $("#mechEmail");
			let issues_input = $("#issues_input");
			let status_input = $("#status_input");
			let selectStatus =  $("#selectStatus");
			//On click event for each div
			$(this).on('click', function(){
				//Append values stored in array to tags
				spanClient_ID.text(ID);
					spanClient_vehicleType.text(type);
						spanClient_plateNum.text(pNum);
							spanClient_Issues.text(issues);
								spanClient_status.text(status);
					
				//Append values stored in span tags to input fields	
				clientID_input.val(ID);
					plateNum_input.val(pNum);
						vehicleType_input.val(type);
							issues_input.val(issues);
								status_input.val(status);
									mechEmail_input.attr("readonly", false);
											mechEmail_input.attr("placeholder", "");
												bookNowBtn.val("Choose a status for the job");
													selectStatus.attr("disabled", false);

			//let bookNow-btn_Option = $("#bookNow-btn option:selected").val();
			selectStatus.change(function(){
				
					console.log("Status changed");
						bookNowBtn.attr("disabled", false);
							bookNowBtn.val("Update Status");
								bookNowBtn.css("background", orange);
									bookNowBtn.css("opacity", "1");
											bookNowBtn.css("cursor", "pointer");
			})
				
			
					
				
				

		})//End this.click method

		
})//End clientInfo_container method
	
</script>
</body>
</html>