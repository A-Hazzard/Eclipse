$(function(){

    //loads home page by default
    $("main").load("pages/states/homePage.txt");

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

    
})