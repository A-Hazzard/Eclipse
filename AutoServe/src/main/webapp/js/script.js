$(function(){


if (userPosition != "Admin" || userPosition != "Staff"){
	console.log(userPosition + "\'s ID: " + userID);
    $(".navbar").css("flex", "1.5");
            $(".navbar > ul").css("width", "100vw");
    console.log("Navbar flex changed to 1.5");
}
 if(userPosition == "Admin") {
	$(".navbar").css("flex", "2");
	console.log("Changed flex to 3");
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
		fNameContainer.css("margin-left", "56%");
		fNameContainer.css("margin-top", "-2%");

		
	}
	else if(userPosition == "Admin") {
		console.log("Admin styling now");
		fNameContainer.css("margin-left", "66%");
		fNameContainer.css("margin-top", "-2%");

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

    //loads home page by default
$("main").load("pages/states/homePage.txt");

$("#footer-links").load("pages/states/footer/carLinks.txt");



    //loads home page on click
    $("#homePage").on('click', function(){
        $("main").hide().load("pages/states/homePage.txt").fadeIn("slow");
    })

        //loads calculatorPage on click
        $("#calculatorPage").on('click', function(){
            $("main").hide().load("pages/states/calculatorPage.txt").fadeIn("fast");
        })

            //loads jobsPage on click
            $("#jobsPage").on('click', function(){
                $("main").hide().load("pages/states/jobsPage.txt").fadeIn("slow");
            })

                //loads memberPage on click
                $("#loginPage").on('click', function(){
	
                    $("main").hide().load("pages/states/loginPage.txt").fadeIn("slow");
                })

                    //loads obutUsPage on click
                    $("#aboutUsPage").on('click', function(){
                        $("main").hide().load("pages/states/aboutUsPage.txt").fadeIn("slow");
                    });
                        //loads servicesPage on click
                    $("#servicesPage").on('click', function(){
                        $("main").hide().load("pages/states/servicesPage.txt").fadeIn("fast");
                    });

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
                    $("#footer-links").load("pages/states/footer/carLinks.txt").fadeIn(1000);
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
                    $("#footer-links").load("pages/states/footer/bikesLinks.txt").fadeIn(1000);
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
                    $("#footer-links").load("pages/states/footer/scootersLinks.txt").fadeIn(1000);
                }, 500)
            }
        }
    });




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
});//end main function


