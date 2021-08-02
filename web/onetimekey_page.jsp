<%@page import="Mail.MailSender"%>
<%@page import="java.sql.Statement"%>
<%@page import="DatabaseConnectivity.Dbconn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<title>Fine Grained</title>
	<meta charset="utf-8">
	<meta name = "format-detection" content = "telephone=no" />
	<link rel="icon" href="images/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="css/grid.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/contact-form.css">

	<script src="js/jquery.js"></script>
	<script src="js/jquery-migrate-1.2.1.js"></script>
	<script src="js/script.js"></script>
	<script src="js/TMForm.js"></script>
	<script src="js/modal.js"></script>
	<script src='//maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=false'></script>
	<!--[if (gt IE 9)|!(IE)]><!-->
	<script src="js/jquery.mobile.customized.min.js"></script>
	<script src="js/wow.js"></script>
	<script>
		$(document).ready(function () {
			if ($('html').hasClass('desktop')) {
				new WOW().init();
			}
		});
	</script>
	</head>
        <%
    
    
    Random s = new Random();
    int a = s.nextInt(9000 - 3000)+1000;
    System.out.print(a);
    String key = String.valueOf(a);
   String msg = "\nOne time Key:" +key;
    
        HttpSession user=request.getSession();
            String mail=user.getAttribute("email").toString();
            System.out.println("mail: " + mail);
            
        Connection con = Dbconn.getConnection();
        Statement st = con.createStatement();
        int i = st.executeUpdate("update register set one_key = '" + key + "' where mail ='" + mail + "'");
        if(i!=0){
             new MailSender().sendMail(mail, "One Time key", msg);
  
        }
  %>
<body class="index-4">
<header id="header">
	<div id="stuck_container">
		<div class="container">
			<div class="row">
				<div class="grid_12">
					<h2 style="color:whitesmoke; font-family: Times New Roman, Times, serif" >Advanced Keyword Searching Over Multiple User Using Secured Cloud Computing</h2>
					<nav>
						<ul class="sf-menu">
							<li class="current"><a href="user_login.jsp">Log Out</a>
                                                        
							
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</header>

<section id="content"  style="background-color:black">
	<div class="full-width-container block-2">
		<div class="container">
			<div class="row">
			 <div  style="height: 300px; width: 1000px; margin-left: 10px;margin-bottom: -10px;">
                         <div style="width:500px;height: 300px;border-top-left-radius: 19px;border-bottom-left-radius: 19px;float: left;">
	
                             <fieldset style="background-color:coral;border-radius: 9px;height: 350px;margin-top: 10px;">
                                 <br>
          <center>
        <h1 style="font: monospace;font-size: 35px;font-weight: bold;color:whitesmoke">One Time Key Verfication</h1><br><br><br>
            <form action="okey_verify.jsp" name="form1" method="get" > 
<label style="font-size: 20px;margin-left:30px;">One Time Key:</label> <br><input type="text" id="id"  style="height: 40px; width:250px; " name="key"required style="margin-left: 45px;" placeholder="Enter one time key "/><br><br>
 
<input type="submit"  value="Verify"style="border-radius: 12px;height: 38px;width: 93px;background-color:#ff33ff"/>

<input type="reset" value="Reset" style="border-radius: 12px;height: 38px;width: 83px;background-color:#ff33ff"></input><br></br>
     
  
      
            
		</form>
          </center>
                             </fieldset>
                </div>
                                       <div style="height: 350px; width: 500px;margin-left:600px; background-image: url('images/key1.jpg')">
                                       </div>
                                 </div>
         
                   
         
				</div>
			</div>
		</div>
	</div>
</section>


<script type="text/javascript">
		google_api_map_init();
		function google_api_map_init(){
			var map;
			var coordData = new google.maps.LatLng(parseFloat(40.6894388), parseFloat(-73.9036233,10)); 

			var styleArray = [
				{"featureType":"water","stylers":[{"color":"#021019"}]},
				{"featureType":"landscape","stylers":[{"color":"#08304b"}]},
				{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#0c4152"},{"lightness":5}]},
				{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#000000"}]},
				{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#0b434f"},{"lightness":25}]},
				{"featureType":"road.arterial","elementType":"geometry.fill","stylers":[{"color":"#000000"}]},
				{"featureType":"road.arterial","elementType":"geometry.stroke","stylers":[{"color":"#0b3d51"},{"lightness":16}]},
				{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#000000"}]},
				{"elementType":"labels.text.fill","stylers":[{"color":"#ffffff"}]},
				{"elementType":"labels.text.stroke","stylers":[{"color":"#000000"},{"lightness":13}]},
				{"featureType":"transit","stylers":[{"color":"#146474"}]},
				{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#000000"}]},
				{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#144b53"},{"lightness":14},{"weight":1.4}]}
				]
			 
			function initialize() { 
			  var mapOptions = { 
				zoom: 12, 
				center: coordData, 
				scrollwheel: false, 
				styles: styleArray 
			  } 
 
			  var contentString = "<div></div>"; 
			  var infowindow = new google.maps.InfoWindow({ 
				content: contentString, 
				maxWidth: 200 
			  }); 
			   
			  var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions); 


			google.maps.event.addDomListener(window, 'resize', function() {

			  map.setCenter(coordData);

			  var center = map.getCenter();
			});
		}

			google.maps.event.addDomListener(window, "load", initialize); 

		}
</script>
<!-- coded by Fred -->
</body>
</html>