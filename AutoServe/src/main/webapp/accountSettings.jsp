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
		String errorMsg = "";
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
                    
                 .flex-wrapper{
                     margin: 10% auto;
    text-align: center;
    display: flex;
    justify-content: center;
    }
    
    .account-info{
    border-radius: .5rem;
    height: 50vh;
    padding: 2%;
    position: relative;
    	box-shadow: rgb(0 0 0 / 13%) 0px 5.6px 9.6px 0px, rgb(0 0 0 / 11%) 0px 0.3px 0.9px 0px;
    }
    
    .profile{
    	font-family: 'Segoe UI';
    	font-size: 14px;
    	text-align: left;
    	
    }
    .security-info{
    margin-left: 2%;
    box-shadow: rgb(0 0 0 / 13%) 0px 5.6px 9.6px 0px, rgb(0 0 0 / 11%) 0px 0.3px 0.9px 0px;
    border-radius: 1rem;
   
    padding: .5%;
    }
    
    .info-header{
    font-family: 'Segoe UI';
    	font-size: 28px;
    }
    
    .fa-envelope{
    	margin-right: 2%;
    }
    
    select{
     width: 100%; 
            font-size: 1rem;
            height: 2.3rem;
            border-top: none;
            border-left: none;
            border-right: none;
            border-color: orange;
            outline: none;
            margin-bottom: 5%;
    }   
     input[type=submit]{
            height: 3rem;
            background-color: rgb(229,36,14);;
            border: none;
            border-radius: 1rem;
            padding: 3%;
            color: white;
            font-size: .8rem;
            margin-top: -10%;
        }
        
         input[type=text], input[type=email], input[type=password]{
        border-top: none;
        border-right: none;
        border-left: none;
        width: 100%;
        height: 2rem;
        margin-bottom: 15%;
        outline: none;
        }
        
        #newPassword, #currentPassword{
        	margin-bottom: 2%;
        }
        
        
        .white{
		       border-radius: 50%;
    width: 5rem;
    background: #dad9d9;
    padding: 3%;
    height: 5rem;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: -38% auto;
        	
        }
        .orange{
        	    background: white;
    border-radius: 50%;
    width: 5rem;
    background: orange;
    padding: 3%;
    height: 5rem;
    display: flex;
    justify-content: center;
    align-items: center;
        }
        
        .fa-user{
        	  font-size: 2rem;
        	
        	}
        	
        	.passwordLabel{
        		margin-top: -5%;
        	}
        	
        	#answer{
        		margin-bottom: 5%;
        	}
    </style>
    
    <title>Account Settings</title>
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
    <main id = "accountSettings-main">
    <br><br>
    <h2 style = "text-align: center;">MY ACCOUNT</h2>
    <% if(("changedSecurityInfo").equals(msg)){ %>
    	<h3 style = "text-align: center;">Changed Security Information</h3>
    	<%} else if(("changedPassword").equals(msg)){ %>
    		<h3 style = "text-align: center;">Changed Password</h3>
    		<%} %>
    		
    			<div class = "flex-wrapper" style = "margin-top: 2%;">
    			
    			<div class = "account-info">
    			
	    			<div class = "white">
	    				<div class = "orange">
	    			    			<i class="fa-solid fa-user"></i>
	    				</div>
    			</div>
    			<br><br><br><br><br>
    				<p class = "profile-name profile">Name: <% out.print(firstName + " " + lastName); %></p>
    				<p class = "profile-Email profile" class = "getVariables">Email: <% out.print(email); %></p>
					<p class = "profile-Phone profile" class =  "getVariables">Phone: <% out.print(phone); %></p>
					<p class = "profile-Position profile" class = "getVariables">Position: <% out.print(position); %></p>
				
    			</div>
    				<div class = "security-info">
    						<p class = "info-header">Security Info</p>
    						<i class="fa-solid fa-user-pen"></i>
    						<br>
    						<p class = "details">Keep your verification methods and security info up to date.</p>
    						 <!--Form used for logging in-->
        <form action="jsp/accountSettings/updateInfoAction.jsp" method="post" class="Form">
            <table id="loginFormTable">
            
           	
                        
                <tr>
                    <td>
                    
                    <% if("invalidSecurityInfo".equals(msg)){ %>
                    	<p id = "errorMsg" style = "text-align: left; color: red;">Information doesn't match. Try again</p>
                        <%} %>
                        
                        <input type = "hidden" class = "position_input" name = "position" value = "<% out.print(position); %>" required>
                        <input type = "hidden" class = "userID_input" name = "userID" value = <% out.print(userID); %> required>
                       <select name = "securityQuestion" required>
				  			<option value = "Where were you born?"> Where were you born? </option>
				  			<option value = "What was your first pet?"> What was your first pet? </option>
				  			<option value = "What primary school did you attend?"> What primary school did you attend? </option>
				  		</select>
				  		
				  		 <label for = "newPassword" style = "display: none;">Answer:</label><br>
                		  	<input type = "text" name = "answer" id = "answer" placeholder = "Enter Answer" required>
                		  	
                		  	<label for = "currentPassword" class = "passwordLabel">Password:</label>
                        <input type="password" autocomplete name="password" id="password" required>
                        
                		  	
                    </td>
                    
                   
                </tr>
            
<br><br><br><br>
                <tr>
                
                    <td><input type="submit" value="Update Info" id="submit"/>
                    </td>
                </tr>
            </table>
        </form>
    				</div>
    				
    				
    				
    				
    				<div class = "security-info">
    						<p class = "info-header">Password</p>
							<i class="fa-solid fa-key"></i>   						<br>
    						<p class = "details">Make your password stronger, or change it if someone else knows it.</p>
    				
    				
    				 <form action = "jsp/accountSettings/updatePasswordAction.jsp" method = "POST">
              
              	 <% if("invalidInfo".equals(msg)){ %>
                    	<p id = "errorMsg" style = "text-align: left; color: red;">Information doesn't match. Try again</p>
                        <%} %>
               <input type = "hidden" class = "position_input" name = "position" value = "<% out.print(position); %>" required>
                        <input type = "hidden" class = "userID_input" name = "userID" value = <% out.print(userID); %> required>
                       
             			<label for="password">Password: </label><br>
                        <br>
                        <label for = "currentPassword">Current Password:</label><br>
                        <input type="password" autocomplete name="currentPassword" id="currentPassword" required>
                        <br>
                        
                        <label for = "newPassword">New Password:</label><br>
                        <input type="password" autocomplete name="newPassword" id="newPassword" required>
                    	
                    	<div id="viewPassword-container"><input type="checkbox" id="viewPwd"><label for="viewPwd">Show Password</label></div>
                    	 <br><br><br>
                    	  <input type="submit" value="Change Password" id="submit-password"/>
              </form>
    				
    				</div>
    				    
             
               
    				
    			</div>
    			
    			
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


$(".updateInfo-btn").on('click', function(){
	$('.trailer').fadeIn("slow");

	//$(".trailer").css('visibility', 'visible');
		
    $('#background-image').css('filter', 'blur(5px)');

})

$('.updatePassword-btn').on('click', function(){
	$('.trailer').fadeOut("slow");
				//$(".trailer").css('visibility', 'hidden');
	
	$('#background-image').css('filter', 'unset');
	
});


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