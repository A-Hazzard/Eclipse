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
	<link rel="preconnect" href="https://fonts.gstatic.com">
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
    </style>
    
    <title>Assigned Jobs</title>
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

                <%if(position.equals("Mechanic")){
                	%> <li><a href = "../pages/mechanicAssignedHistory.jsp" class="links" id = "assignedHistory">Assignment History</a></li>
                <%} %>
                 <%if(position.equals("Mechanic")){
                	%> <li><a href = "mechanicActiveJobs.jsp" class="links" id = "assignmentHistory">Active Jobs</a></li>
                <%} %>
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
    <main id = "clientApplication-main" class = "mechanicAssignedJobs-main " >
		
			<div id = "header-container" style = "display: none;">	
					<h2 id = "jobApplication-h2">Assigned Job</h2> 
					<button type = "button" id = "refreshApplications-btn">Refresh</button>
				</div>
			<br><br>
			<div id = "applications">
															       <h2 id = "warn" style = "color: red; padding-top: 5%; margin-left: 55%; display: none;">PLEASE <a href = "../login.jsp">LOGIN</a>  TO VIEW THIS PAGE</h2>
			
				<h3 style = "margin-left: 3%; font-size: 2rem; color: red;">You haven't been assigned to any jobs</h3>
			
				<br>
					<div id = "container">
			
				
		<% 
		//Mechanic email already initialized on login
		int ClientID = 0;
		String reg_mechEmail = "";
		String reg_staffEmail = "";
		String reg_vehicleType = "";
		String reg_plateNum = "";
		String reg_issues = "";
		String reg_invoice = "";
		String reg_status = "";
		String reg_category = "";

			try{
				//Geting connection to display client applications
				Connection con = ConnectionProvider.getConnection();
				
				//Create a statement using the connection provider
				Statement state = con.createStatement();
				Statement state1 = con.createStatement();
				Statement state2 = con.createStatement();
				//Create a result set to return the results from the statement
				String engineRepair = "SELECT * FROM engineRepair WHERE mechanicEmail = '"+userEmail+"'";
				String breakRepair = "SELECT * FROM breakRepair WHERE mechanicEmail = '"+userEmail+"'";
				String clutchRepair = "SELECT * FROM clutchRepair WHERE mechanicEmail = '"+userEmail+"'";
				
			
				ResultSet result = state.executeQuery(engineRepair);
				ResultSet result1 = state1.executeQuery(breakRepair);
				ResultSet result2 = state2.executeQuery(clutchRepair);
				
				int reg_clientID = 0;
			
				System.out.println("Jobs TABLE : ");
				
				//Fetches the data columns and returns the values
				while( result.next()){
					//Engine Repair Table
					reg_clientID = result.getInt(1);
					reg_mechEmail = result.getString(2);
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
					height: auto;
					text-align: left;
					box-shadow: .2rem .1rem .4rem rgb(223, 223, 223);
					cursor: pointer;">
					
							<p class = "reg_clientID info">Client ID: <span id = "ID" class = "sub-info"><%out.print(reg_clientID); %></span></p>
							<P class = "reg_staffEmail info">Staff's Email:  <span id = "staffEmail" class = "sub-info"><%out.print(reg_staffEmail); %></span></P>
							<P class = "reg_VehicleType info">Type of Vehicle:  <span id = "type" class = "sub-info"><%out.print(reg_vehicleType); %></span></P>
							<p class = "reg_plateNum info">Vehicle Plate Number:  <span id = "pNum" class = "sub-info"><%out.print(reg_plateNum); %></span></p>
							<p class = "reg_issues info">Issues:  <span id = "issues" class = "sub-info"><%out.print(reg_issues); %></span></p>
							<p class = "reg_status info">Status:  <span id = "status" class = "sub-info"><%out.print(reg_status); %></span></p>
							<p class = "reg_ategory info">Category:  <span id = "category" class = "sub-info"><%out.print(reg_category); %></span></p>
								
						</div>
					
				<%	
				
				System.out.println("Client ID:" +reg_clientID+ "\nMechanic\'s Email:  "+userEmail+" | Vehicle Type: "+reg_vehicleType+ " | Plate Number: " + reg_plateNum+ "\nIssues: " + reg_issues+ "\nCurrent Status: " + reg_status);
				}//end while
					
				//Fetches the data columns and returns the values
				while( result1.next()){
					//Breaks Repair Table
					reg_clientID = result1.getInt(1);
					reg_mechEmail = result1.getString(2);
					reg_staffEmail = result1.getString(3);
					reg_vehicleType = result1.getString(4);
					reg_plateNum = result1.getString(5);
					reg_issues = result1.getString(6);
					reg_category = result1.getString(7);

					reg_status = result1.getString(8);

					
				%>
					<div class = "client-info" style = "
					background: rgb(239 239 239);
					border-radius: .5rem;
					padding: 1%;
					height: auto;
					text-align: left;
					box-shadow: .2rem .1rem .4rem rgb(223, 223, 223);
					cursor: pointer;">
					
							<p class = "reg_clientID info">Client ID: <span id = "ID" class = "sub-info"><%out.print(reg_clientID); %></span></p>
							<P class = "reg_staffEmail info">Staff's Email:  <span id = "staffEmail" class = "sub-info"><%out.print(reg_staffEmail); %></span></P>
							<P class = "reg_VehicleType info">Type of Vehicle:  <span id = "type" class = "sub-info"><%out.print(reg_vehicleType); %></span></P>
							<p class = "reg_plateNum info">Vehicle Plate Number:  <span id = "pNum" class = "sub-info"><%out.print(reg_plateNum); %></span></p>
							<p class = "reg_issues info">Issues:  <span id = "issues" class = "sub-info"><%out.print(reg_issues); %></span></p>
							<p class = "reg_status info">Status:  <span id = "status" class = "sub-info"><%out.print(reg_status); %></span></p>
															<p class = "reg_ategory info">Category:  <span id = "category" class = "sub-info"><%out.print(reg_category); %></span></p>
								
						</div>
					
				<%	
				
				System.out.println("Client ID:" +reg_clientID+ "\nMechanic\'s Email:  "+userEmail+" | Vehicle Type: "+reg_vehicleType+ " | Plate Number: " + reg_plateNum+ "\nIssues: " + reg_issues+ "\nCurrent Status: " + reg_status);
				}//end while
					
				//Fetches the data columns and returns the values
				while( result2.next()){
					//Clutch Repair Table
					reg_clientID = result2.getInt(1);
					reg_mechEmail = result2.getString(2);
					reg_staffEmail = result2.getString(3);
					reg_vehicleType = result2.getString(4);
					reg_plateNum = result2.getString(5);
					reg_issues = result2.getString(6);
					reg_status = result2.getString(7);
					reg_category = result2.getString(8);

					
				%>
					<div class = "client-info" style = "
					background: rgb(239 239 239);
					border-radius: .5rem;
					padding: 1%;
					height: auto;
					text-align: left;
					box-shadow: .2rem .1rem .4rem rgb(223, 223, 223);
					cursor: pointer;">
					
							<p class = "reg_clientID info">Client ID: <span id = "ID" class = "sub-info"><%out.print(reg_clientID); %></span></p>
							<P class = "reg_staffEmail info">Staff's Email:  <span id = "staffEmail" class = "sub-info"><%out.print(reg_staffEmail); %></span></P>
							<P class = "reg_VehicleType info">Type of Vehicle:  <span id = "type" class = "sub-info"><%out.print(reg_vehicleType); %></span></P>
							<p class = "reg_plateNum info">Vehicle Plate Number:  <span id = "pNum" class = "sub-info"><%out.print(reg_plateNum); %></span></p>
							<p class = "reg_issues info">Issues:  <span id = "issues" class = "sub-info"><%out.print(reg_issues); %></span></p>
							<p class = "reg_status info">Status:  <span id = "status" class = "sub-info"><%out.print(reg_status); %></span></p>
							<p class = "reg_ategory info">Category:  <span id = "category" class = "sub-info"><%out.print(reg_category); %></span></p>
								
						</div>
					
				<%	
				
				System.out.println("Client ID:" +reg_clientID+ "\nMechanic\'s Email:  "+userEmail+" | Vehicle Type: "+reg_vehicleType+ " | Plate Number: " + reg_plateNum+ "\nIssues: " + reg_issues+ "\nCurrent Status: " + reg_status);
				}//end while
				
		}catch(SQLException e){
			System.out.println("Problem returning registration info. SQL Error: " + e);
			e.printStackTrace();
		}
	%>
					</div>
				</div>
			
			
			
			
			<form action="../jsp/updateJobStatus.jsp" method = 'post' id="registered-bookings-form" class = "mechanic-form" style = "display: none; height: auto; ">
						<h2>Client #<span class = "span-client-ID"></span></h2>
						<br>
				<div class ="hidden">
					<label class = "input info" for="mechanicEmail_input">Mechanic Email: <span class = "span-mechanic-email"></span></label><br>
					<input type = "text" name = "mechanicEmail_input" id = "mechanicEmail_input"  required>
					
				</div>	
			
					<label class = "input-hidden info" for="clientID_input">ID: <span class = "span-client-ID sub-info"></span></label><br>
					<input class = "input-hidden hidden" type = "text" name = "clientID_input" id = "clientID_input"  required>
				<br>

					<label for="vehicleType_input" class = "info">Type of Vehicle: <span class = "span-client-vehicleType sub-info"></span></label><br> 
					<input type = "text" name="vehicleType_input" id="vehicleType_input" class = "hidden"   required>
					<br>
				
					<label for="plateNum_input" class = "info">Plate Number: <span class = "span-client-plateNum sub-info"></span></label><br>
					<input type="text" name="plateNum_input" id="plateNum_input" class = "hidden"  required><br>
					
					
					<label for="issues_input" class = "info">Issues: <span class = "span-client-issues sub-info"></span></label><br>
					<input type="text" name="issues_input" id="issues_input" class = "hidden"  required><br>
					
					<label for="status_input" class = "info">Status: <span class = "span-client-status sub-info"></span></label><br>
					<input type="text" name="status_input" id="status_input" class = "hidden"  required><br>
					
					<label for="category_input" class = "info">Category: <span class = "span-client-category sub-info"></span></label><br>
					<input type="text" name="category_input" id="category_input" class = "hidden"  required><br>
					
                        <select name = "status" id = "selectStatus" class = "status" disabled required>
                            <option id = "pendingStatus" value = "Pending">Current Status: Pending</option>
                        	<option id = "activeStatus" value = "Active">Current Status: Active</option>
                        	<option id = "finishedStatus" value = "Finished">Current Status: Finished</option>
                        </select>
                        <br>
                    <label for="mechanicFeedback" class = "feedback" style = "display: none;">Feedback:</label><br><br>
	    			<textarea id="mechanicFeedback" class = "feedback" name="mechanicFeedback_input" placeholder="Feedback.." style="height:200px; width: 60%; display: none;"></textarea><br>
	    			
	    			<label for = "invoiceLink_input" class = "invoice" style = "display: none;">Invoice Link:</label><br>
	    			<input type = "text" name = "invoiceLink_input" id = "invoiceLink_input"  class = "invoice" placeholder = "link..." style = "display: none;"/>
	    			<br>
	    			<label for = "fee" class = "fee" style = "display: none;">Fee:</label><br>
	    			<input type = "text" name = "fee" id = "fee"  class = "fee" placeholder = "TTD" style = "display: none;"/>
				
				<input type = "submit" value="Select a client to work with" id = "bookNow-btn" disabled/>

			</form>
        
	</main>
<br><br><br>
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
		$("main").css("height", "unset")

		$("h3").css("display", "none");
	}else{
		$("main").css("height", "80vh");

	}
	
	if(userID == "null" || userID == ""){
			
		    $("#warn").css("display", "block");
		    $("h3").css("display", "none");
	
		}
	else{
		$("#header-container").css("display", "unset");
		$("form").css("display", "block");
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
			let category = $(this).find("#category").text();

			//Initialize empty tag values
			let spanClient_ID = $(".span-client-ID");
			let spanClient_vehicleType = $(".span-client-vehicleType");
			let spanClient_plateNum = $(".span-client-plateNum");
			let spanClient_Issues = $(".span-client-issues");
			let spanClient_status = $(".span-client-status");
			let spanClient_category = $(".span-client-category");
			//Init empy input field values
			let plateNum_input = $("#plateNum_input");
			let vehicleType_input = $("#vehicleType_input");
			let clientID_input = $("#clientID_input");
			let mechEmail_input = $("#mechEmail");
			let issues_input = $("#issues_input");
			let status_input = $("#status_input");
			let category_input = $("#category_input");
			let selectStatus =  $("#selectStatus");
			//On click event for each div
			$(this).on('click', function(){
				//Append values stored in array to tags
				spanClient_ID.text(ID);
					spanClient_vehicleType.text(type);
						spanClient_plateNum.text(pNum);
							spanClient_Issues.text(issues);
								spanClient_status.text(status);
								spanClient_category.text(category);
				//Append values stored in span tags to input fields	
				clientID_input.val(ID);
					plateNum_input.val(pNum);
						vehicleType_input.val(type);
							issues_input.val(issues);
								status_input.val(status);
								category_input.val(category);
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
						                    	let option = $("#selectStatus option:selected").val();
					
				if(option == "Finished" || option == "Active"){
					console.log("Finished Option Selected");
					$(".feedback").css("display", "unset");
					$(".feedback").css("margin-bottom", "1%");
					$(".feedback").attr("required", true);
					
					
					

				}
		
				
				else{
					console.log(option + " Option Selected");
					$(".feedback").css("display", "none")
					$(".feedback").attr("required", false);
					$("#invoiceLink_input").css("display", "none");
					$("#invoiceLink_input").attr("required", false);

					$(".invoice").css("display", "none");
					
				}
				
				if(option == "Finished"){
					$("#invoiceLink_input").attr("required", true);
					$(".invoice").css("display", "unset");
					$(".fee").css("display", "unset");
					$(".fee").css("margin-bottom", "1%");
					$(".fee").attr("required", true);
				}
			})
				
			
					
				
				

		})//End this.click method

		
})//End clientInfo_container method

$(function(){
    $("#footer-links").load("states/footer/carLinks.txt");
	//Loads jobs
	$("#job1").click(function(){
    console.log("loaded " + $(this).attr('id'));
    $("#job-status").hide().load("states/heavyEquipment.txt").fadeIn("slow");
})
		
		$("#job2").click(function(){
			console.log("loaded " + $(this).attr('id'));
		    $("#job-status").hide().load("states/electricVehicleTech.txt").fadeIn("slow");
		})
		
		$("#job3").click(function(){
			console.log("loaded " + $(this).attr('id'));
		    $("#job-status").hide().load("states/mechanicalSystem.txt").fadeIn("slow");
		})
		
  //changes style of links in the footer on click
  $(".categories").click(function(){
        console.log("Underlined " + $(this).text());

        let carClick = false;
        let bikesClick = false;
        let scootersClick = false;
        if ( $(this).text() === "Cars" ) {
            carClick = true;
            bikesClick = false;
            scootersClick = false;
            if(carClick){
                console.log($(this).text() + " link clicked");
                $(this).css("text-decoration", "underline");
                $(this).css("opacity", 1);
                $(this).css("opacity", 1);
                $(this).css("color", "white");

                $("#scooters").css("opacity", .5);
                $("#scooters").css("color", "rgb(205,206,224)");

                $("#bikes").css("opacity", .5);
                $("#bikes").css("color", "rgb(205,206,224)");

                $("#bikes").css("text-decoration", "none");
                $("#scooters").css("text-decoration", "none");

                $("#footer-links").fadeOut(500);
                setTimeout(function(){
                    $("#footer-links").load("states/footer/carLinks.txt").fadeIn(1000);
                }, 500)

            }
        }
        else if ( $(this).text() === "Bikes" ) {
            carClick = false;
            scootersClick = false;
            bikesClick = true;
            if(bikesClick){ 
                console.log($(this).text() + " link clicked");
                $(this).css("text-decoration", "underline");
                $("#cars").css("text-decoration", "none");
                $(this).css("opacity", 1);
                $(this).css("opacity", 1);
                $(this).css("color", "white");

                $("#cars").css("opacity", .5);
                $("#cars").css("color", "rgb(205,206,224)");

                $("#scooters").css("opacity", .5);
                $("#scooters").css("color", "rgb(205,206,224)");

                $("#scooters").css("text-decoration", "none");

                
                $("#footer-links").fadeOut(500);
                setTimeout(function(){
                    $("#footer-links").load("states/footer/bikesLinks.txt").fadeIn(1000);
                }, 500)
                
            }
        }
        else if ( $(this).text() === "Scooters" ) {
            carClick = false;
            bikesClick = false;
            scootersClick = true;
            if(scootersClick){ 
                console.log($(this).text() + " link clicked");
                $(this).css("text-decoration", "underline");
                $(this).css("opacity", 1);
                $(this).css("color", "white");

                $("#cars").css("opacity", .5);
                $("#cars").css("color", "rgb(205,206,224)");

                $("#bikes").css("opacity", .5);
                $("#bikes").css("color", "rgb(205,206,224)");

                $("#cars").css("text-decoration", "none");
                $("#bikes").css("text-decoration", "none");

                $("#footer-links").fadeOut(500);
                setTimeout(function(){
                    $("#footer-links").load("states/footer/scootersLinks.txt").fadeIn(1000);
                }, 500)
            }
        }
    });
  
  
});	
</script>
</body>
</html>