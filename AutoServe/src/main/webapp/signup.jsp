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
		String msg = request.getParameter("msg");
		if(firstName != null){
			System.out.println(firstName + " ID: " + userID);
		}
		
		String staff = "Staff", mechanic = "Mechanic", admin = "Admin";
		
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
    <link rel="stylesheet" href="style/style.css">
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
    
    <title>Auto Serve Inc.</title>
</head>
<body>
	<!-- Accessing java variables -->
	<span id = "userEmail" class = "getVariables"><% out.print(email); %></span>
	<span id = "userFirstName" class =  "getVariables"><% out.print(firstName); %></span>
	<span id = "userLastName" class =  "getVariables"><% out.print(lastName); %></span>
	<span id = "userPhone" class =  "getVariables"><% out.print(phone); %></span>
	<span id = "userPosition" class = "getVariables"><% out.print(position); %></span>
	<!-- --------------------------- -->
    <!--Horizontal Header of the web page-->
    <header class="header "><!--FLEXBOX-->

        <h1 id="logo" class ="admin-logo"><a href = "index.jsp" 
        style = "text-decoration: none; color: black;">Auto Serve Inc.</a></h1><!--Logo-->
        
    
        <nav class="navbar"><!--NAVIGATION BAR-->
            <ul class="link-container" style = "margin-left: 90%;">
                <li><a href="index.jsp" id="homePage" class="links">Home</a></li>
            </ul>
        </nav>
    </header>

    <!--Content loaded using AJAX with JQuery-->
    <main id = "index">
     <div data-aos="zoom-in-down"
                    data-aos-offset="1"
                    data-aos-delay="1"
                    data-aos-duration="500"
                    data-aos-easing="ease-in"
                    data-aos-mirror="true"
                    data-aos-once="true"
                    data-aos-anchor-placement="top" id = "access-main">


        <h2>Sign Up</h2><br>
        <p>Already a member? <a href = "login.jsp" id="loginPage2">Log in.</a>


        <form action="jsp/registrationAction.jsp" method="post" class="Form">
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
                        <label for="password">Password: </label><br>
                        <input type="password" autocomplete name="password" id="password" required>
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
<br><br>
<br><br>
<br><br>
<br><br>
        
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
var nameStr = parseInt(userFirstName.length);


console.log("Position: " + userPosition);
getVariables.css("position", "absolute");
getVariables.css("margin-top", "-100%");


//loads registrationPage on click
$("#registrationPage").on('click', function(){

    $("main").hide().load("pages/states/registrationPage.txt").fadeIn("slow");
})

//changes password to Text
$(function(){
let viewPwd = false;

$("#viewPwd").on('click', function(){
let getPwdType = $("#password");
if(viewPwd === false) {
    console.log('checked, changed password field to text')
    getPwdType.attr('type', 'text');
    viewPwd = true;

}
else if(viewPwd === true){
    console.log("Unchecked, changed password field back to password")
    getPwdType.attr('type', 'password');
    viewPwd = false;
}
})
})

// You can also pass an optional settings object
// below listed default settings
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