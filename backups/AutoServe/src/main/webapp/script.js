$(function(){

    //loads home page by default
$("main").load("pages/states/homePage.txt");

$("#footer-links").load("pages/states/footer/carLinks.txt");



    //loads home page on click
    $("#homePage").on('click', function(){
        $("main").hide().load("pages/states/homePage.txt").fadeIn("slow");
    })

        //loads calculatorPage on click
        $("#calculatorPage").on('click', function(){
            $("main").hide().load("pages/states/calculatorPage.txt").fadeIn("slow");
        })

            //loads jobsPage on click
            $("#jobsPage").on('click', function(){
                $("main").hide().load("pages/states/jobsPage.txt").fadeIn("slow");
            })

                //loads memberPage on click
                $("#loginPage").on('click', function(){
                    $("main").hide().load("pages/states/loginPage.txt").fadeIn("slow");
                })

                    //loads memberPage on click
                    $("#aboutUsPage").on('click', function(){
                        $("main").hide().load("pages/states/aboutUsPage.txt").fadeIn("slow");
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

});//end main function


