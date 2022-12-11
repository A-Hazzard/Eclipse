<html lang="en">
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
    
    <title>Vehicle Registration</title>
</head>
<body>
	<!-- Accessing java variables -->
	<span id = "userEmail" class = "getVariables"><% out.print(email); %></span>
	<span id = "userFirstName" class =  "getVariables"><% out.print(firstName); %></span>
	<span id = "userLastName" class =  "getVariables"><% out.print(lastName); %></span>
	<span id = "userPhone" class =  "getVariables"><% out.print(phone); %></span>
	<span id = "userPosition" class = "getVariables"><% out.print(position); %></span>
    <span id = "userID" class = "getVariables"><% out.print(userID); %></span>

	<!-- --------------------------- -->
<!--Horizontal Header of the web page-->
    <header class="header "><!--FLEXBOX-->

        <h1 id="logo">Auto Serve Inc.</h1><!--Logo-->
        
        <nav class="navbar"><!--NAVIGATION BAR-->
        <ul class="link-container">
                
                <li><a href="../index.jsp" id="homePage" class="links">Home</a></li>
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
        data-aos-anchor-placement="top" 
        id = "vehicle-main">
        
        
        <form action="../jsp/bookingAction.jsp" method = 'post' id="CTA-bookings-form">
 									<h2>Need to service your Vehicle?</h2><br>
       						 <p>Book Now!</p>
        
                        <label class = "input-hidden" for="userID_input">ID</label><br>
                        <input class = "input-hidden" type = "text" name = "userID_input" id = "userID_input" required>
                        <label class = "input-hidden" for="bookFirstName">ID</label><br>
                        <input class = "input-hidden" type="text" name="firstName" id="bookFirstName" required>

                <label for="vehicleType">Type of Vehicle:</label><br> 
				<select name="selectVehicleType" id="vehicleType" style = "   
                width: 60%; 
			    font-size: 1rem;
			    height: 2.3rem;
			    border-top: none;
			    border-left: none;
			    border-right: none;
			    border-color: orange;
			    outline: none;
			    margin-bottom: 5%;" required>                        <option value="" disabled selected hidden class="default-option">Select your Vehicle</option>
                        <option value="Car">Car</option>
                        <option value="Truck">Truck</option>
                        <option value="Van">Van</option>
                        <option value="MotorBike">MotorBike</option>
                    </select> <br>
            
                <label for="plateNum">Plate Number: </label><br>
                <input type="text" name="plateNumber" id="plateNum" required><br><br>
                
                <label for="category">Category:</label><br>
                        <select name = "category" id = "category" class = "category">
                            <option selected disabled hidden>Select the type of job</option>
                        	<option value = "Engine">Engine Repair & Service</option>
                        	<option value = "Breaks">Breaks Repair & Service</option>
                        	<option value = "Clutch">Clutch Repair & Service</option>
                        </select>
                 <br><br>
                        
                <label for="issues">Issues with Vehicle</label><br><br>
    			<textarea id="issues" name="issues" placeholder="Issues.." style="height:200px; width: 60%;"></textarea>
    			<br><br>
            <input type = "submit" value="Book Now!" id = "bookNow-btn" />

</form>
        
        
        </main>
    
    <br><br>
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
    
    
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://kit.fontawesome.com/18479e6558.js"></script>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<!--  <script src="../js/script.js"></script>-->
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
var nameStr = parseInt(userFirstName.length);


console.log("Position: " + userPosition);
getVariables.css("position", "absolute");
getVariables.css("margin-top", "-100%");
let homePageLink = $("#homePage");
let footerTag = $("footer");
let logoTag = $("#logo");
homePageLink.css("margin-left", "90%");
homePageLink.css("z-index", "2");
logoTag.css("margin-left", "2%");
$("form").css("padding-top", "3%");
$("#footer-links").load("states/footer/carLinks.txt");


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

var bookNowBtn = $("#bookNow-btn");

/*checked to see if user logged in by checking for a first name value, the appending that name to the firstname input
                field in the calculator form*/
                if($("#bookFirstName").val() == null || $("#userID").val() == null) 
                    console.log("Please enter a value for first name and number. Current Value: " + $("#bookFirstName").val() + " : " + $("#userID").val());
                    else{
                    $("#bookFirstName").val(userFirstName);
                    $("#userID_input").val(userID);
                    console.log("The value for first name: " + $("#bookFirstName").val());
                    console.log("The value for CLIENT ID: " + $("#userID_input").val());
                
                }
                
                $(".input-hidden").css("position", "absolute");
                $(".input-hidden").css("margin-left", "-1000%");
                
                $(".bookNow-btn").on('click', function(){
                if(firstName === null){
                alert("Please login to register your vehicle");
                }
                });
                
    
                
                if(userFirstName == "null") {
                    disableButton()
                    console.log("Please login/sign-up to register your vehicle");
                    bookNowBtn.val("Please login/sign-up to register your vehicle");
                    
                    }
                    if(userPosition == "Admin" || userPosition == "Staff" || userPosition == "Mechanic"){
                        disableButton();
                        console.log("To prevent database conflicts. Please register client vehicles via the DBMS");
                        bookNowBtn.val("To prevent database conflicts. Please register client vehicles via the DBMS");
                        bookNowBtn.css("padding-top", "5%");
                        bookNowBtn.css("padding-bottom", "5%");
                        bookNowBtn.css("padding-left", "1%");
                        bookNowBtn.css("padding-right", "1%");
                        bookNowBtn.css("width", "60%");
                        bookNowBtn.css("animation", "none");
                        
                        //bookNowBtn.css("margin-left", "-6%");
                    
                    
                    }
                    function disableButton(){
                    $("#vehicleType, #plateNum, #bookNow-btn").prop("disabled", true);
                
                        bookNowBtn.prop("disabled", true);
                        bookNowBtn.css("opacity", "50%");
                        bookNowBtn.css("background-color", "grey");
                        bookNowBtn.css("cursor", "unset");
                        
                        
                    }

                    $("form").on('submit', function(){
                    	alert("Your vehicle has been registered. Please wait 24/48 hours for confirmation.");
                    })
                    
                    
$(function(){
    $("#footer-links").load("states/footer/carLinks.txt");
$("#homePage").css("margin-left", "90%");
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
//You can also pass an optional settings object
//below listed default settings
AOS.init({
// Global settings:
disable: false, // accepts following values: 'phone', 'tablet', 'mobile', boolean, expression or function
startEvent: 'DOMContentLoaded', // name of the event dispatched on the document, that AOS should initialize on
initClassName: 'aos-init', // class applied after initialization
animatedClassName: 'aos-animate', // class applied on animation
useClassNames: false, // if true, will add content of `data-aos` as classes on scroll
disableMutationObserver: false, // disables automatic mutations' detections (advanced)
debounceDelay: 50, // the delay on debounce used while resizing window (advanced)
throttleDelay: 99, // the delay on throttle used while scrolling the page (advanced)


// Settings that can be overridden on per-element basis, by `data-aos-*` attributes:
offset: 120, // offset (in px) from the original trigger point
delay: 0, // values from 0 to 3000, with step 50ms
duration: 400, // values from 0 to 3000, with step 50ms
easing: 'ease', // default easing for AOS animations
once: false, // whether animation should happen only once - while scrolling down
mirror: false, // whether elements should animate out while scrolling past them
anchorPlacement: 'top-bottom', // defines which position of the element regarding to window should trigger the animation

});

</script>
</body>
</html>