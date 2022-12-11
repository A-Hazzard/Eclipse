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
	String msg = request.getParameter("msg");

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
<html lang = "en">
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
                    .progress-bar {
  position: relative;
  height: 100px;
  width: 100px;
}

.progress-bar div {
  position: absolute;
  height: 100px;
  width: 100px;
  border-radius: 50%;
}

.progress-bar div span {
  position: absolute;
  font-family: Arial;
  font-size: 25px;
  line-height: 75px;
  height: 75px;
  width: 75px;
  left: 12.5px;
  top: 12.5px;
  text-align: center;
  border-radius: 50%;
  background-color: white;
}

.progress-bar .background { background-color: #b3cef6; }

.progress-bar .rotate {
  clip: rect(0 50px 100px 0);
  background-color: #4b86db;
}

.progress-bar .left {
  clip: rect(0 50px 100px 0);
  opacity: 1;
  background-color: #b3cef6;
}

.progress-bar .right {
  clip: rect(0 50px 100px 0);
  transform: rotate(180deg);
  opacity: 0;
  background-color: #4b86db;
}

@keyframes 
toggle {  0% {
 opacity: 0;
}
 100% {
 opacity: 1;
}
}
    </style>
    
    <title>Auto Serve ADMIN</title>
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
    <header class="header admin-header" style = "display: none;">

        <h1 id="logo" class ="admin-logo"><a href = "../index.jsp" 
        style = "text-decoration: none; color: black;">Auto Serve Inc.</a></h1>
        
    
        <nav class="navbar admin-navbar">
            <ul class="link-container">
                
                <li><a href="../pages/jobsPages.html" id="jobsPage" class="links">Jobs</a></li>
                <li><a href="../pages/jobApplications.jsp" class="links jsp-links">Job Applications </a>
                <li><a href="admin.jsp" id="adminPortal" class="links jsp-links">Admin Portal</a>
                <li><a href="registerStaff.jsp" id="employeeForm" class="links jsp-links">Forms</a>
                <li><a href="../jsp/logoutAction.jsp" class = "Links jsp-linnks logout">Logout</a>
                
            </ul>
        </nav>

    </header>


    <!--Content loaded using AJAX with JQuery-->
    <main data-aos="zoom-in" data-aos-offset="0" data-aos-delay="1" data-aos-duration="500" data-aos-easing="ease-in-out" data-aos-mirror="true" data-aos-once="false" data-aos-anchor-placement="top" 
    id = "admin-main" style = "height: 100vh;">

        <div id = "admin-top-nav" style = "display: none;">
        	<ul class="link-container">
                
                <li><a href="../pages/jobsPages.html" id="jobsPage" class="links">Reports <i class="fa-sharp fa-solid fa-caret-down"></i></a></li>
                <li><a href="../pages/jobApplications.jsp" class="links jsp-links">Project <i class="fa-sharp fa-solid fa-caret-down"></i></a></li>
                <li><a href="admin.jsp" id="adminPortal" class="links jsp-links"><img src = "../pages/media/US-FLAG.png" width = "20px" height = "20px" alt = "language-flag" id = "language-flag"/> English <i class="fa-sharp fa-solid fa-caret-down"></i></a></li>
                <li id = "profile-picture"><img src = "../pages/media/winsstonFields.jpeg"  alt = "profile-picture"/></li>
                
            </ul>
        </div>
        
        <h1 id = "warn" style = "color: red; padding-top: 20%; text-align: center; display: none;">PLEASE <a href = "../login.jsp">LOGIN</a> AS ADMIN TO VIEW THIS PAGE</h1>
      
      <% 
      Connection con = ConnectionProvider.getConnection();
    	Statement state = con.createStatement();
      	Statement state1 = con.createStatement();
      	Statement state2 = con.createStatement();
      	Statement state3 = con.createStatement();
      	Statement state4 = con.createStatement();
      	Statement state5 = con.createStatement();
      	Statement state6 = con.createStatement();
      	ResultSet rs = state.executeQuery("SELECT COUNT(ID) FROM employee");
      	ResultSet rs1 = state1.executeQuery("SELECT COUNT(ID) FROM staff");
      	ResultSet rs2 = state2.executeQuery("SELECT COUNT(ID) FROM mechanic");
      	ResultSet rs3 = state3.executeQuery("SELECT COUNT(ID) FROM clients");
      	ResultSet rs4 = state4.executeQuery("SELECT work FROM hourly_schedule");
      	ResultSet rs5 = state5.executeQuery("SELECT lunch FROM hourly_schedule");
      	ResultSet rs6 = state6.executeQuery("SELECT meetings FROM hourly_schedule");

      	int employee_count = 0;
      	int staff_count = 0;
      	int mechanic_count = 0;
      	int client_count = 0;
      	int workHours = 0;
      	int lunchHours = 0;
      	int meetingsHours = 0;
      	while(rs.next()){
      		employee_count = rs.getInt(1);
      		
      	}
      	while(rs1.next()){
          	
      		staff_count = rs1.getInt(1);
      	
      	}while(rs2.next()){
      		mechanic_count = rs2.getInt(1);
     
      	}while(rs3.next()){
      		
      		client_count = rs3.getInt(1);
      	}while(rs4.next()){
      		
      		workHours = rs4.getInt(1);
      	}while(rs5.next()){
      		
      		lunchHours = rs5.getInt(1);
      	}while(rs6.next()){
      		
      		meetingsHours = rs6.getInt(1);
      	}
      	
      	System.out.println("text of employees: " + employee_count + "\ntext of Staff Members: " + staff_count + "\ntext of Mechanics: " + mechanic_count + "\ntext of clients: " + client_count);
      %>
    <div class = "statistics" style = "display: flex; justify-content: center;margin-top: 5%;">
	     <div class = "count" style = " margin-left: 5%;">
	           <div class="progress-bar" data-percent="<% out.print(employee_count); %>" data-duration="100" data-color="#ccc,blue"></div>
	     		<p>text of Employees</p>
	     </div>
	      
	      <div class = "count" style = " margin-left: 10%;">
	           <div class="progress-bar" data-percent="<% out.print(staff_count); %>" data-duration="100" data-color="#ccc,yellow"></div>
	     		<p>text of Staff Members</p>
	     </div>
	     
	     <div class = "count" style = " margin-left: 10%;">
	           <div class="progress-bar" data-percent="<% out.print(mechanic_count); %>" data-duration="100" data-color="#ccc,green"></div>
	     		<p>text of Mechanics</p>
	     </div>
	     <div class = "count" style = " margin-left: 10%;">
	           <div class="progress-bar" data-percent="<% out.print(client_count); %>" data-duration="100" data-color="#ccc,purple"></div>
	     		<p>text of clients</p>
	     </div>
     </div>
     <br><br>
     <div>
      <div id="piechart" >
         </div>
     <form action = "../jsp/updateHourlySchedule.jsp" method = "POST">
     		 <% if("invalidNumber".equals(msg)){ %>
                    	<p id = "errorMsg" style = "text-align: left; color: red;">Invalid Number. Try again</p>
                        <%} %>
         		<label for = "workHours_input">New Work Hours: </label><br>
         		<input type = "text" name = "workHours_input" id = "workHours_input" placeholder = "<% out.print(workHours); %>"/>
         		<br>
         		<label for = "lunchHours_input">New Lunch Hours: </label><br>
         		<input type = "text" name = "lunchHours_input" id = "lunchHours_input" placeholder = "<% out.print(lunchHours); %>"/>
         		<br>
         		<label for = "meetingsHours_input">New Work Hours: </label><br>
         		<input type = "text" name = "meetingsHours_input" id = "meetingsHours_input" placeholder = "<% out.print(meetingsHours); %>"/>
         		<br>
         		<button type = "submit">Change Hours</button>
         	</form>
         </div>
        
     
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
            <p id="copyright" style="text-align: center; opacity: .5;">Copyright � 2022 Auto Serve Inc. All Rights Reserved.</p>
    </footer>

<script src="https://code.jquery.com/jquery-3.6.1.min.js" ></script>
<script src="https://kit.fontawesome.com/18479e6558.js" ></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" ></script>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script src="admin.js"></script>
<script src = "../js/jQuery-plugin-progressbar.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Work',     <% out.print(workHours); %>],
          ['Eat',      <% out.print(lunchHours); %>],
          ['Meetings',  <% out.print(meetingsHours); %>]
        
        ]);

        var options = {
          title: 'My Daily Activities'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
      $("#workHours_input").val(<% out.print(workHours); %>);
      $("#meetingsHours_input").val(<% out.print(meetingsHours); %>);
      $("#lunchHours_input").val(<% out.print(lunchHours); %>);
    </script>
<script>
        //stores user position in variable(client/staff/admin)
$(".progress-bar").loading();
$(".count > div").css("margin", "0 auto");

		var car = false;
		var truck = false;
		var van = false;
		var motorbike = false;
		var down = false;
		
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
		var nameStr = parseInt(userFirstName.length);
		//makes blank page if user isnt admin or null
		if(userPosition != "Admin"){
			
		    $("#warn").css("display", "block")
		console.log("null")
		} else{
			$("#admin-top-nav").css("display", "block");
			$("header").css("display", "block");
		}
		
		console.log("Position: " + userPosition);
		getVariables.css("position", "absolute");
		getVariables.css("margin-top", "-100%");
		
		
		if (userPosition != "Admin" || userPosition != "Staff"){
			console.log(userPosition + "\'s ID: " + userID);
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

 </body> 
 </html>	
		
		<!-- 
		TO DO:
		IF USER POSITION = ADMIN
		> DISPLAY ADMIN CONTENT
		ELSE IF USER POSITION = STAFF/CLIENT
		> DISPLAY ONLY ADMIN CANT VIEW THIS CONTENT
		ELSE IF POSITION === NULL
		> DISPLAY ADMIN LOGIN PAGE
		
		-->