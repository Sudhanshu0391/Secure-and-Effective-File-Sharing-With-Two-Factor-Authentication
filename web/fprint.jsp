<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@ page import ="java.sql.*" %>
<%@page import="DatabaseConnectivity.Dbconn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
   
<!DOCTYPE html>
<!--[if IE 8]>			<html class="ie ie8"> <![endif]-->
<!--[if IE 9]>			<html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->	
    <html> <!--<![endif]-->
    <head>
<head>
	<title>Fine Grained</title>
	<meta charset="utf-8">
	<meta name = "format-detection" content = "telephone=no" />
	<link rel="icon" href="images/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="css/grid.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/touchTouch.css">
	<link rel="stylesheet" href="css/camera.css">

	<script src="js/jquery.js"></script>
	<script src="js/jquery-migrate-1.2.1.js"></script>
	<script src='js/camera.js'></script>
	<script src="js/touchTouch.jquery.js"></script>
	<script src="js/jquery.stellar.js"></script>
	<script src="js/script.js"></script>
	<script src='//maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=false'></script>
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

  <body class="index">
<!--==============================header=================================-->
<header id="header">
	<div id="stuck_container">
		<div class="container">
			<div class="row">
					<h2 style="color:whitesmoke; font-family: Times New Roman, Times, serif" >Advanced Keyword Searching Over Multiple User Using Secured Cloud Computing</h2>
					<nav>
						<ul class="sf-menu">
							<li class="current"><a href="index.html">Home</a>
										
							</li>
						
					</nav>
				</div>
			</div>
		</div>
	</div>
</header>

<!--=======content================================-->

<section id="content">
	<div class="full-width-container block-1">
		<div class="camera_container">
			<div id="camera_wrap">
				<div class="item" data-src="images/index_img_slider-1.png">
					<div class="camera_caption fadeIn">
						<h3>Finger Print</h3>
					</div>
				</div>
				<div class="item" data-src="images/index_img_slider-2.png">
					<div class="camera_caption fadeIn">
						<h3>Finger Print</h3>
					</div>
				</div>
				<div class="item" data-src="images/index_img_slider-2.png">
					<div class="camera_caption fadeIn">
						<h3>Finger Print</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="full-width-container block-2">
		<div class="container">
			<div class="row">
				<div class="grid_12">
                                  <center> 
                 <form action="fmatch1.jsp" method="post" enctype="multipart/form-data">
               
                <label style="margin-left: -250px;font-weight: bold;font-size: large; color: blue"></label>
                <input type="file" name="upload" style="margin-left: 200px; margin-top: -30px"><br />
                <input type="hidden" name ="fname" value="" />
                <!--<label style="margin-left: -250px;font-weight: bold;font-size: large; color: blue">Locate Image : </label><input type="file" name="uploadimg" style="margin-left: 200px; margin-top: -25px"><br />-->
                <input type="submit" value="Submit">
                 </form></center><br><br>
                            <br><br>
                            <br><br><br><br><br><br><br><br><br><br>
                    </div>
                    <!-- Sidebar -->
                </div>
            </div></center>

            </div>
    
            <!-- Contact wrap -->

            <div class="space80"></div>

            <!-- Footer-Copyright -->
            <div class="footer-bottom">
                <a class="back-top" href="#"><i class="fa fa-chevron-up"></i></a>
                <div class="container">
                    <div class="row-fluid">
                        <div class="col-md-6" hidden>
                            <p>Copyright 2015.All Rights Reserved</p>
                            <p  hidden class="_txt">Web Design: <a href="http://www.metamorphozis.com" class="_link">Free Website Templates</a></p>
                        </div>
                        <div class="col-md-6" hidden>
                            <ul class="top-contact">
                                <li><i class="fa fa-phone"></i> 1234-567-890-12</li>
                                <li><i class="fa fa-envelope"></i> contact@domain.com</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer-Copyright -->
        </div>
        <!-- JavaScript -->
          
<script>
	jQuery(function(){
		jQuery('#camera_wrap').camera({
			height: '68.125%',
			thumbnails: false,
			pagination: true,
			fx: 'simpleFade',
			loader: 'none',
			hover: false,
			navigation: false,
			playPause: false,
			minHeight: "975px"
		});
	});
</script>
<script>
	$(document).ready(function() { 
			if ($('html').hasClass('desktop')) {
				$.stellar({
					horizontalScrolling: false,
					verticalOffset: 20,
					resposive: true,
					hideDistantElements: true,
				});
			}
		});
</script>
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
<script>
	$(function(){
		$('.isotope a').touchTouch();
	});
</script>
<%
    try{
        HttpSession httpSession=request.getSession();
        String query = request.getQueryString();
        Map<String, String> query_pairs = new LinkedHashMap<String, String>();
        String[] pairs = query.split("&");
    for (String pair : pairs) {
        int idx = pair.indexOf("=");
        query_pairs.put(URLDecoder.decode(pair.substring(0, idx), "UTF-8"), URLDecoder.decode(pair.substring(idx + 1), "UTF-8"));
    }
    String downloadFile= query_pairs.get("fname");
    session.setAttribute("downloadFile", downloadFile);
    
    }catch(Exception e){
        e.printStackTrace();
    }
%>
    </body>
</html>
