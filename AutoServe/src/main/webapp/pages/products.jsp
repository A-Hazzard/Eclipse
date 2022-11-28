<html lang="en">
<% 

		//getting credentail attributes from loginAction.jsp
		Object sessionEmail = session.getAttribute("Email");
		Object sessionFname = session.getAttribute("FirstName");
		Object sessionLname = session.getAttribute("LastName");
		Object sessionPhone = session.getAttribute("Phone");
		Object sessionPosition = session.getAttribute("Position");
		Object sessionUserID = session.getAttribute("userID");
	
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
    
    <title>Products</title>
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

        <h1 id="logo"><a href = "../index.jsp" 
        style = "text-decoration: none; color: black;">Auto Serve Inc.</a></h1><!--Logo-->
        
    
        <nav class="navbar"><!--NAVIGATION BAR-->
            <ul class="link-container">
                
                <li><a href="#" id="calculatorPage" class="links">Calculator</a></li>
                <li><a href="pages/products.jsp" id="productsPage" class="links">Products</a></li>
                <li><a href="pages/jobsPages.html" id="jobsPage" class="links">Jobs</a></li>
                <li><a href="#" id="aboutUsPage" class="links">About</a></li>
                <li><a href="#" id = "servicesPage" class="links">Services</a></li> 
                	<% //Display  clients link only if user is either staff or admin
                        if(position.equals(staff) || position.equals(admin)) {
                            %> <li>
                            <a href="pages/clientApplications.jsp" class="links jsp-links">Client Applications </a>
                            </li> <% }
                        else System.out.println("(index.jsp)Not an admin or staff. Hid Clients link. Email: " + email); 
                    %>

                	<% //Display login/signup link if user is not logged in
                        if (sessionFname == null){ 
                        %> <li><a href="#" id="loginPage" class="links jsp-links">Login/Sign-Up</a>
                            </li> <% }
                        else System.out.println("(index.jsp)Hid Login/Sign-Up button for client/staff"); 
                    %>

                    <% //Display admin portal link if user position = admin
                        if(position.equals("Admin")) {
                        %><li><a href="admin/admin.jsp" id="adminPortal" class="links jsp-links">Admin Portal</a>
                        </li> <% }
                        else System.out.println("(login.jsp) Admin Portal Link hidden. Not Admin\n");
                    %>
		                <% //Display logout link only if user is logged in 
                            if(sessionFname == null) 
                                System.out.println("(index.jsp)Logout button hidden");         
                            else { %><li class = "index-jsp-list-items">
                                    <a href="jsp/logoutAction.jsp" class = "Links jsp-linnks logout">Logout</a>
                                    </li>
								
								<% } %>
                <!--Display user name if logged in-->
                <% 
                if (firstName != null) { %>
                    <li class = "profile-name-container">
                        <span class = "profile-name jsp-userName">         
                        <% //Display client link only if user is admin/staff 
                            if(sessionFname == null)
                                System.out.println("(index.jsp)Username hidden\n");
                            else {
                                if(position.equals(admin))
                                    out.print(firstName.charAt(0));
                                            else
                                                out.print(firstName.charAt(0));
                                
                                System.out.println("(index.jsp)Logged in as " + firstName + "\n");
                                }
                    %></span>
                    <span id = "userID" style = "position: absolute; margin-top: -1000%;"> <% out.print(userID); %> </span></li>
                <% } %>
            </ul>
        </nav>

    </header>

    <section id="products-section">

        <select name = "accessories" id = "selectedAccessory">
            <option class = "list" data-filter = "all" value = "" disabled selected hidden class="default-option">Sort By</option>
            <option class = "list" data-filter = "interior" value = "interior">Interior Accessories</option>
            <option class = "list" data-filter = "exterior" value = "exterior">Exterior Accessories</option>
            <option class = "list" data-filter = "body" value = "body">Body Parts Accessories</option>
            <option class = "list" data-filter = "gps" value = "gps">GPS Accessories</option>
        </select>
        
        <div class="product">
            
            <!--Interior Accessories-->
            <div class="itemBox interior">
                <img src="https://m.media-amazon.com/images/I/61At7gphbsL._AC_UL480_FMwebp_QL65_.jpg" alt="">
				<p class = "product-name">BSTACLL Screen Protector</p>
				<p class = "product-category">Interior Auto Accessory</p>
				<i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
				<span class = "rating" style =  "color : grey">(203)</span>
				<p class = "product-price">TTD $140.95</p>

         
            </div>
            
            

            <div class="itemBox gps">
                    <img src="https://m.media-amazon.com/images/I/617ltiN1XiL._AC_UL480_FMwebp_QL65_.jpg" alt="">
				<p class = "product-name">Coleya 2022 2023 Tucson Screen Protector</p>
				<p class = "product-category">GPS Auto Accessory</p>
				<i class="fa-solid fa-star"></i>
				<i class="fa-solid fa-star"></i>
				<i class="fa-solid fa-star"></i>
				<span class = "rating" style = "color = grey">(102)</span>
				<p class = "product-price">TTD $84.54</p>
            </div>


            <div class="itemBox interior">
                <img src="https://m.media-amazon.com/images/I/61JsXQJttiL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                <p class = "product-name">SINGARO Car Cup Coaster</p>
                <p class = "product-category">Interior Auto Accessory</p>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <span class = "rating" style = "color = grey">(500)</span>
                <p class = "product-price">TTD $25.40</p>
            </div>
            
            <div class="itemBox exterior">
                    <img src="https://m.media-amazon.com/images/I/81oxvsPdZkL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                <p class = "product-name">Mega Racer Crystal Diamond License Plate Frame - Premium 650 Pieces Pink Rhinestones Three Row</p>
                <p class = "product-category">Exterior Auto Accessory</p>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <span class = "rating" style = "color = grey">(250)</span>
                <p class = "product-price">TTD $230.00</p>

            </div>

            <div class="itemBox interior">
                <img src="https://m.media-amazon.com/images/I/71PPuRQ317L._AC_UL480_FMwebp_QL65_.jpg" alt="">
                <p class = "product-name">FH Group Car Seat Covers Front Set Brown Faux Leather Seat Cushions</p>
                <p class = "product-category">Interior Auto Accessory</p>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <span class = "rating" style = "color = grey">(560)</span>
                <p class = "product-price">TTD $906.98</p>

            </div>
            
            <div class="itemBox interior">
                <img src="https://m.media-amazon.com/images/I/71poekM9iAL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                <p class = "product-name">JOJOMARK Compatible with Hyundai Tucson Limited and Hybrid 2022 2023</p>
                <p class = "product-category">Interior Auto Accessory</p>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i> 
                <i class="fa-solid fa-star"></i> 
                <span class = "rating" style = "color = grey">(300)</span>
                <p class = "product-price">TTD $340.56</p>

        
            </div>

            <div class="itemBox gps">
                    <img src="https://m.media-amazon.com/images/I/71-em00WXIL._AC_UY327_FMwebp_QL65_.jpg" alt="">
                <p class = "product-name">Randconcept - GPS Mount for Garmin</p>
                <p class = "product-category">GPS Auto Accessory</p>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <span class = "rating" style = "color = grey">(20)</span>
                <p class = "product-price">TTD $100.00</p>
            </div>
            
            <div class="itemBox interior">
                <img src="https://m.media-amazon.com/images/I/716MvGJzXoL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                <p class = "product-name">Coverado Car Seat Covers, Premium Nappa Leather Auto Seat Cushions Full Set with Embossed Pattern</p>
                <p class = "product-category">Interior Auto Accessory</p>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i> 
                <i class="fa-solid fa-star"></i> 
                <i class="fa-solid fa-star"></i> 
                <i class="fa-solid fa-star"></i> 

                <span class = "rating" style = "color = grey">(2300)</span>
                <p class = "product-price">TTD $1200.54</p>

        
            </div>

            
            <div class="itemBox exterior">
                    <img src="https://m.media-amazon.com/images/I/61M6DdQdHkL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                    <p class = "product-name">LivTee Silicone License Plate Frames Covers</p>
                    <p class = "product-category">Exterior Auto Accessory</p>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i> 
                    <i class="fa-solid fa-star"></i> 
                    <i class="fa-solid fa-star"></i> 
                    <span class = "rating" style = "color = grey">(230)</span>
                    <p class = "product-price">TTD $50.00</p>

        
            </div>

            
        
            <div class="itemBox interior">
                <img src="https://m.media-amazon.com/images/I/81zoLVMdABL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                <p class = "product-name">UYYE Auto Car Trunk Organizer,Compartments Collapsible Durable Organizer for Cargo Storage</p>
                <p class = "product-category">Interior Auto Accessory</p>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <span class = "rating" style = "color = grey">(130)</span>
                <p class = "product-price">TTD $160.89</p>

        
            </div>
            
            <div class="itemBox interior">
                <img src="https://m.media-amazon.com/images/I/61hpo17ix3L._AC_UL480_FMwebp_QL65_.jpg" alt="">
                <p class = "product-name">JUSTTOP Mini Car Trash Can, Small Automatic Portable Trash Can with Lid</p>
                <p class = "product-category">Interior Auto Accessory</p>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <span class = "rating" style = "color = grey">(400)</span>
                <p class = "product-price">TTD $59.76</p>

        
            </div>
            
            <div class="itemBox interior">
                <img src="https://m.media-amazon.com/images/I/71tzfkqJwFL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                <p class = "product-name">SXCY 2023 Tucson SEL/Limited Santa Cruz Center Console Organizer Tray</p>
                <p class = "product-category">Interior Auto Accessory</p>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>

                <span class = "rating" style = "color = grey">(10)</span>
                <p class = "product-price">TTD $89.67</p>

        
            </div>

            
            <div class="itemBox exterior">
                    <img src="https://m.media-amazon.com/images/I/91MIiJn6QOL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                <p class = "product-name">Envelope Style Automotive Trunk Mesh Cargo Net</p>
                <p class = "product-category">Exterior Auto Accessory</p>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>

                <span class = "rating" style = "color = grey">(450)</span>
                <p class = "product-price">TTD $230.65</p>

        
            </div>
            
            <div class="itemBox interior">
                <img src="https://m.media-amazon.com/images/I/71PfojDgC4L._AC_UL480_FMwebp_QL65_.jpg" alt="">
                <p class = "product-name">SINGARO 20 Pieces Car Air Conditioner Air Outlet Decorative Strips</p>
                <p class = "product-category">Interior Auto Accessory</p>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>

                <span class = "rating" style = "color = grey">(490)</span>
                <p class = "product-price">TTD $45.98</p>

        
            </div>

            <div class="itemBox exterior">
                    <img src="https://m.media-amazon.com/images/I/61ubA7DccpL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                <p class = "product-name">Mega Racer Metal Black License Plate Frame - 2 Hole Slim Front or Rear Black Aluminum License Plate</p>
                <p class = "product-category">Exterior Auto Accessory</p>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>

                <span class = "rating" style = "color = grey">(450)</span>
                <p class = "product-price">TTD $156.99</p>

    
            </div>
            
            <div class="itemBox interior">
                <img src="https://m.media-amazon.com/images/I/61dQ7cylC8L._AC_UL480_FMwebp_QL65_.jpg" alt="">
                <p class = "product-name">SINGARO LED Car Cup Holder L</p>
                <p class = "product-category">Interior Auto Accessory</p>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>

                <span class = "rating" style = "color = grey">(310)</span>
                <p class = "product-price">TTD $70.00</p>

            </div>

            <div class="itemBox exterior">
                        <img src="https://m.media-amazon.com/images/I/61ORkX5NHhL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                <p class = "product-name">Tinted License Plate Cover Set of Standard Fit - Front & Back License Plates Shield Fastening to Frames</p>
                <p class = "product-category">Exterior Auto Accessory</p>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>

                <span class = "rating" style = "color = grey">(15)</span>
                <p class = "product-price">TTD $69.99</p>
        
            </div>

            <div class="itemBox interior">
                <img src="https://m.media-amazon.com/images/I/71p8e8ccjiL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                <p class = "product-name">TucDad® 2023 2022 Hyundai Tucson Floor Mats & Cargo Liner</p>
                <p class = "product-category">Interior Auto Accessory</p>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>

                <span class = "rating" style = "color = grey">(166)</span>
                <p class = "product-price">TTD $878.98</p>

        
            </div>
            

            <div class="itemBox exterior">
                    <img src="https://m.media-amazon.com/images/I/41OQE98ebzL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                    <p class = "product-name">SINGARO 4 Pack Car Deer Whistle Warning for Car Horn Unit</p>
                    <p class = "product-category">Exterior Auto Accessory</p>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>

                    <span class = "rating" style = "color = grey">(150)</span>
                    <p class = "product-price">TTD $69.65</p>

        
            </div>


            <div class="itemBox interior">
                <img src="https://m.media-amazon.com/images/I/715Na2hbASL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                <p class = "product-name">UYYE Car Trunk Hanging Organizer,Backseat Hanging Bag, Car Interior Accessories with 4 Pockets & 2 Meshes</p>
                <p class = "product-category">Auto Accessory</p>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>


                <span class = "rating" style = "color = grey">(10)</span>
                <p class = "product-price">TTD $103.60</p>

        
            </div>

            <div class="itemBox exterior">
                    <img src="https://m.media-amazon.com/images/I/713VbkNhBdL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                <p class = "product-name">2 Pack Bling License Plate Frame for Women, Cute Handcrafted Sparkly Rhinestone Car License Plate</p>
                <p class = "product-category">Exterior Auto Accessory</p>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>

                <span class = "rating" style = "color = grey">(70)</span>
                <p class = "product-price">TTD $230.45</p>

         
            </div>

            <div class="itemBox exterior">
                    <img src="https://m.media-amazon.com/images/I/71yb20I9XiL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                <p class = "product-name">SINGARO Car Rear Bumper Protector, 35.1inch x2.75inch Car/SUV Universal Rubber Anti-Scratch Trunk Exterior</p>
                <p class = "product-category">Exterior Auto Accessory</p>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>

                <span class = "rating" style = "color = grey">(890)</span>
                <p class = "product-price">TTD $90.00</p>

         
            </div>

            <div class="itemBox exterior">
                    <img src="https://m.media-amazon.com/images/I/81L8uyPd95L._AC_UL480_FMwebp_QL65_.jpg" alt="">
                    <p class = "product-name">Silicone License Plate Frames - Black Front & Back License Plates Cover Bracket</p>
                    <p class = "product-category">Exterior Auto Accessory</p>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>

                    <span class = "rating" style = "color = grey">(480)</span>
                    <p class = "product-price">TTD $97.17</p>

        
            </div>

        

                <div class="itemBox interior">
                    <img src="https://m.media-amazon.com/images/I/81x5+oVIrZL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                    <p class = "product-name">SINGARO Bling Cup Holder Coasters for Car, 2PCS Universal Non-Slip Cup Holder</p>
                    <p class = "product-category">Interior Auto Accessory</p>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>

                    <span class = "rating" style = "color = grey">(810)</span>
                    <p class = "product-price">TTD $40.97</p>

        
            </div>

            <div class="itemBox exterior">
                    <img src="https://m.media-amazon.com/images/I/71iD+gZgmxL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                    <p class = "product-name">BETRONG 2 Pack Bling Rhinestone Diamond Metal License Plate Frame Covers Over 1200 pcs Crystals (Black)</p>
                    <p class = "product-category">Exterior Auto Accessory</p>
                    <i class="fa-solid fa-star"></i> <span class = "rating" style = "color = grey">(10)</span>
                    <p class = "product-price">TTD $345.90</p>

        
            </div>

            <div class="itemBox exterior">
                    <img src="https://m.media-amazon.com/images/I/61H-oDBA9yL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                    <p class = "product-name">ICBEAMER 37.8" 980mm Sunroof Wind Deflector</p>
                    <p class = "product-category">Exterior Auto Accessory</p>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>

                    <span class = "rating" style = "color = grey">(10)</span>
                    <p class = "product-price">TTD $310.54</p>

         
            </div>

            <div class="itemBox interior"> 
                <img src="https://m.media-amazon.com/images/I/71BB-UFUajL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                <p class = "product-name">Elastic Stretch Car Steering Wheel Cover, Universal 15 inch</p>
                <p class = "product-category">Interior Auto Accessory</p>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>

                <span class = "rating" style = "color = grey">(710)</span>
                <p class = "product-price">TTD $490.65</p>

        
            </div>

            <div class="itemBox body">
                    <img src="https://m.media-amazon.com/images/I/71uQora1mAL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                <p class = "product-name">6F35 Gen 2 Transmission Valve Body With Solenoids Suit </p>
                <p class = "product-category">Body Auto Accessory</p>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>

                <span class = "rating" style = "color = grey">(10)</span>
                <p class = "product-price">TTD $1077.65</p>

        
            </div>

            <div class="itemBox body">
                    <img src="https://m.media-amazon.com/images/I/71FitzYQdcL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                    <p class = "product-name">LivTee 2PCS Round Blind Spot Mirror, HD Glass and ABS Housing Convex Wide Angle Rearview Mirror</p>
                    <p class = "product-category">Body Auto Accessory</p>
                    
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>

                    <span class = "rating" style = "color = grey">(10)</span>
                    <p class = "product-price">TTD $52.98</p>

         
            </div>

            <div class="itemBox exterior">
                    <img src="https://m.media-amazon.com/images/I/71VL5IirDsL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                    <p class = "product-name">Universal Front Bumper License Plate Bracket</p>
                    <p class = "product-category">Exterior Auto Accessory</p>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>

                    <span class = "rating" style = "color = grey">(170)</span>
                    <p class = "product-price">TTD $69.95</p>

        
            </div>

            <div class="itemBox exterior">
                    <img src="https://m.media-amazon.com/images/I/71eLsmEq5XL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                    <p class = "product-name">Orion Motor Tech Mesh Cargo Net 2 Pack</p>
                    <p class = "product-category">Exterior Auto Accessory</p>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>

                    <span class = "rating" style = "color = grey">(10)</span>
                    <p class = "product-price">TTD $45.76</p>

        
            </div>

            <div class="itemBox body">
                    <img src="https://m.media-amazon.com/images/I/71ysmeW2tzL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                    <p class = "product-name">Nilight 2.5" Mini Projector Lens for H1 Headlights Bulb Retrofit</p>
                    <p class = "product-category">Body Auto Accessory</p>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>

                    <span class = "rating" style = "color = grey">(180)</span>
                    <p class = "product-price">TTD $239.65</p>

        
            </div>

            <div class="itemBox exterior">
                    <img src="https://m.media-amazon.com/images/I/71Hz9qwLc0L._AC_UL480_FMwebp_QL65_.jpg" alt="">
                    <p class = "product-name">Amooca Car Seat Headrest Hook 4 Pack Hanger Storage Organizer Universal for Handbag Purse Coat</p>
                    <p class = "product-category">Exterior Auto Accessory</p>
                    <i class="fa-solid fa-star"></i> <span class = "rating" style = "color = grey">(60)</span>
                    <p class = "product-price">TTD $49.00</p>

        
            </div>


            <div class="itemBox gps">
                    <img src="https://m.media-amazon.com/images/I/71yXekmDqwL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                    <p class = "product-name">[Upgraded] for 2022 Hyundai Tucson Santa Cruz Screen Protector</p>
                    <p class = "product-category">GPS Auto Accessory</p>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>

                    <span class = "rating" style = "color = grey">(1,900)</span>
                    <p class = "product-price">TTD $304.98</p>

            </div>

            <div class="itemBox body">
                    <img src="https://m.media-amazon.com/images/I/81EiBGdPkcL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                    <p class = "product-name">Morimoto XB LED Headlight Housing Upgrade, Fits 2011-2016 Ford Superduty</p>
                    <p class = "product-category">Body Auto Accessory</p>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>

                    <span class = "rating" style = "color = grey">(160)</span>
                    <p class = "product-price">TTD $8,8709.90</p>

        
            </div>

            <div class="itemBox interior">
                <img src="https://m.media-amazon.com/images/I/71fDQvX-77L._AC_UL480_FMwebp_QL65_.jpg" alt="">
                <p class = "product-name">Universal Vehicle Bling Cup Holder Insert Coaster Car Interior Accessories-2.75 inch Silicone Anti Slip Crystal</p>
                <p class = "product-category">Interior Auto Accessory</p>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i> 
                <i class="fa-solid fa-star"></i> 

                <span class = "rating" style = "color = grey">(10)</span>
                <p class = "product-price">TTD $39.65</p>

        
            </div>
            

            <div class="itemBox exterior">
                    <img src="https://m.media-amazon.com/images/I/712WzeWt22L._AC_UL480_FMwebp_QL65_.jpg" alt="">
                    <p class = "product-name">Amiss Heavy Duty Cargo Net Stretchable. Adjustable Elastic Trunk Storage Net with Hook for SUVs</p>
                    <p class = "product-category">Exterior Auto Accessory</p>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i> 
                    <i class="fa-solid fa-star"></i> 
                    <span class = "rating" style = "color = grey">(10)</span>
                    <p class = "product-price">TTD $71.87</p>

         
            </div>

            <div class="itemBox exterior">
                    <img src="https://m.media-amazon.com/images/I/71q2X6wJYNL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                    <p class = "product-name">Mega Racer Universal JDM Racing Style Glossy Black Hood Scoop Body Kit</p>
                    <p class = "product-category">Exterior Auto Accessory</p>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>

                    <span class = "rating" style = "color = grey">(160)</span>
                    <p class = "product-price">TTD $480.76</p>
            </div>




        <div class="itemBox exterior">
                    <img src="https://m.media-amazon.com/images/I/61SUmCdzsPS._AC_UL480_FMwebp_QL65_.jpg" alt="">
                    <p class = "product-name">Mega Racer 50 Cal Bullet Antenna - Black Carbon Fiber 5.5 Inch AM/FM Compatible Universal Fit for Truck</p>
                    <p class = "product-category">Exterior Auto Accessory</p>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>

                    <span class = "rating" style = "color = grey">(310)</span>
                    <p class = "product-price">TTD $470.56</p>

        
        </div>

        <div class="itemBox gps">
                <img src="https://m.media-amazon.com/images/I/61At7gphbsL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                <p class = "product-name">BSTACLL Screen Protector Compatible with Hyundai Tucson 2021-2023, [Navigation Touchscreen]</p>
                <p class = "product-category">GPS Auto Accessory</p>
                <i class="fa-solid fa-star"></i> 
                <i class="fa-solid fa-star"></i> 
                <i class="fa-solid fa-star"></i> 

                <span class = "rating" style = "color = grey">(150)</span>
                <p class = "product-price">TTD $170.00</p>

    
        </div>

        <div class="itemBox gps">
                <img src="https://m.media-amazon.com/images/I/71TXL9T7RfL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                <p class = "product-name">TTCR-II Compatible With 2022-2023 Hyundai Tucson and Santa Cruz Screen Protector, Tempered Glass</p>
                <p class = "product-category">GPS Auto Accessory</p>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>
                <i class="fa-solid fa-star"></i>

                <span class = "rating" style = "color = grey">(10)</span>
                <p class = "product-price">TTD $80.00</p>

        
        </div>

        
        <div class="itemBox exterior">
                <img src="https://m.media-amazon.com/images/I/71KksUcFVzS._AC_UL480_FMwebp_QL65_.jpg" alt="">
                <p class = "product-name"></p>
                <p class = "product-category">Exterior Auto Accessory</p>
                <i class="fa-solid fa-star"></i> 
                <i class="fa-solid fa-star"></i> 
                <i class="fa-solid fa-star"></i> 

                <span class = "rating" style = "color = grey">(430)</span>
                <p class = "product-price">TTD $120.65</p>

    
        </div>


        <div class="itemBox gps">
                <img src="https://m.media-amazon.com/images/I/7166FqIIWRS._AC_UL480_FMwebp_QL65_.jpg" alt="">
            <p class = "product-name">BIXUAN Tucson 2022 2023 Tucson Screen Protector Foils for 2022 2023 Tucson NX4 Santa Cruz SEL Limited 10.2</p>
            <p class = "product-category">GPS Auto Accessory</p>
            <i class="fa-solid fa-star"></i> 
            <i class="fa-solid fa-star"></i> 
            <i class="fa-solid fa-star"></i> 

            <span class = "rating" style = "color = grey">(780)</span>
            <p class = "product-price">TTD $210.76</p>

        
        </div>

            
            <div class="itemBox body">
                    <img src="https://m.media-amazon.com/images/I/416Rbrc3nbL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                    <p class = "product-name">PPE - Firewall Insulator 149000105 Compatible with 2001-2005 Chevy/GMC 6.6 LB7/LLY Duramax</p>
                    <p class = "product-category">Body Auto Accessory</p>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>

                    <span class = "rating" style = "color = grey">(310)</span>
                    <p class = "product-price">TTD $1,754.93</p>

        
            </div>


            <div class="itemBox gps">
                    <img src="https://m.media-amazon.com/images/I/51dhL4M2ZML._AC_UL480_FMwebp_QL65_.jpg" alt="">
                    <p class = "product-name">Screen Protector Compatible With 2022 2023 Hyundai Tucson 10.25 inch,Tempered Glass Anti Scratch Bubble</p>
                    <p class = "product-category">GPS Auto Accessory</p>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i> 
                    <i class="fa-solid fa-star"></i> 

                    <span class = "rating" style = "color = grey">(310)</span>
                    <p class = "product-price">TTD $150.64</p>

         
            </div>

            <div class="itemBox exterior">
                    <img src="https://m.media-amazon.com/images/I/61jRPfxGHvL._AC_UL480_QL65_.jpg" alt="">
                    <p class = "product-name">LivTee Blind Spot Mirror, 2" Round HD Glass Frameless Convex Rear View Mirrors Exterior Accessories</p>
                    <p class = "product-category">Exterior Auto Accessory</p>
                    <i class="fa-solid fa-star"></i> <span class = "rating" style = "color = grey">(4,510)</span>
                    <p class = "product-price">TTD $450.56</p>

         
            </div>

            <div class="itemBox exterior">
                    <img src="https://m.media-amazon.com/images/I/713nL-tMNZL._AC_UL480_FMwebp_QL65_.jpg" alt="">
                    <p class = "product-name">EZ Lip – The Original Universal Fit 1-Inch Lip Spoiler</p>
                    <p class = "product-category">Exterior Auto Accessory</p>
                    <i class="fa-solid fa-star"></i> 
                    <i class="fa-solid fa-star"></i> 
                    <i class="fa-solid fa-star"></i> 

                    <span class = "rating" style = "color = grey">(140)</span>
                    <p class = "product-price">TTD $470.56</p>

         
            </div>

            <div class="itemBox gps">
                    <img src="https://m.media-amazon.com/images/I/51W1V0pj1-L._AC_UL480_FMwebp_QL65_.jpg" alt="">
                    <p class = "product-name">Screen Protector for Elantra 2021+ Touchscreen 10.25In GPS Protective Films Suits 2021+ Hyundai Elantra</p>
                    <p class = "product-category">GPS Auto Accessory</p>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>

                    <span class = "rating" style = "color = grey">(10)</span>
                    <p class = "product-price">TTD $340.56</p>

        
            </div>


        
        </div><!--END PRODUCT-->
    </section>

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
    $(function(){
        

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


        console.log("Position: " + userPosition);
        getVariables.css("position", "absolute");
        getVariables.css("margin-top", "-100%");

        const itemBox = $(".itemBox");
        const list = $(".list");
        const selectedAccessory = $("#selectedAccessory");

        selectedAccessory.change(function(){
            const values = $(this).attr('data-filter');
            var value = $("#selectedAccessory option:selected").attr('data-filter');

            //if data-filter == "All", show all the products
            if(value == 'all') $(".itemBox").show('fast');
            else
                {
                    $(".itemBox").not("."+value).hide("1000");
                    $(".itemBox").filter("."+value).show("1000");
                    console.log("Filtering ."+value);
                }
            
        })//end list click event

        selectedAccessory.change(function(){
            $(this).addClass('active').siblings().removeClass('active');
        });
    })//end anonymous ready function

</script>
</body>
</html> 