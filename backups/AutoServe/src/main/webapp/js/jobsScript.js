
$(function(){
    $("#footer-links").load("footer/carLinks.txt");
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
                    $("#footer-links").load("footer/carLinks.txt").fadeIn(1000);
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
                    $("#footer-links").load("footer/bikesLinks.txt").fadeIn(1000);
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
                    $("#footer-links").load("footer/scootersLinks.txt").fadeIn(1000);
                }, 500)
            }
        }
    });


    AOS.init();

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


	})
