<%@page import="DatabaseConnectivity.Dbconn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
<body class="index-4">
<header id="header">
	<div id="stuck_container">
		<div class="container">
			<div class="row">
				<div class="grid_12">
					<h2 style="color:whitesmoke; font-family: Times New Roman, Times, serif" >Advanced Keyword Searching Over Multiple User Using Secured Cloud Computing</h2>
					<nav>
						<ul class="sf-menu">
							<li ><a href="user_page.jsp">User Home</a>
										
							</li>
							
							<li><a href="t_request.jsp">Trustee Request</a></li>
							<li><a href="a_request.jsp">Authority Secret Key</a></li>
                                                        <li class="current"><a href="f_download.jsp">File Download</a></li>
							
							<li><a href="user_login.jsp">Log Out</a>
                                                        
								</li>
						</ul>
	
					</nav>
				</div>
			</div>
		</div>
	</div>
</header>

<!--=======content================================-->

<section id="content"  style="background-color:black">
	<div class="full-width-container block-2">
		<div class="container">
                   <div class="row">
                             <center>
                                <header>
						<h2 style="color:whitesmoke"><span>File Download</span></h2>
					</header>
					
                               </center>
			   <center>
                               <table border="8" width="1000px" hieght="1200px" style="text-align: center;background-color:#ffff00">
                   
                       <tr>
                               
                           <th style="color:#660066; font-size:23px;font:bolder" >File Name</th>
                                <th style="color:#660066; font-size:23px;font:bolder">Uploaded On</th>
                                <th style="color:#660066; font-size:23px;font:bolder">Size</th>
                                
                                <th style="color:#660066; font-size:23px;font:bolder">File Download</th>
                               </tr>
                               <br></br>
                         <tr>
                                <%
                                    try {
                                                                       
HttpSession user=request.getSession();
String mail=user.getAttribute("email").toString(); 
                                        Connection con;
                                        Statement st;
                                        ResultSet rs;
                                        con = Dbconn.getConnection();
                                        st = con.createStatement();
                                        rs = st.executeQuery("select * from files ");
               
                                        while (rs.next()) {
                                             
            %>
                                <td style="font-size:18px;font:bolder"><%=rs.getString("file_name")%></td>
                              
                                <td style="font-size:18px;font:bolder" ><%=rs.getString("date")%></td>
                                <td style="font-size:18px;font:bolder"><%=rs.getString("size")%></td>
                                
                                 <td style="font-size:18px;font:bolder;color:whitesmoke">
                                     <a href="fingerverification.jsp?downloadFile=<%=rs.getString("file_name")%>&mail=<%=mail%>" >Download</a> </td>
                               </tr>
                            <%}
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }
                            %>
                        </table>
               </center>
            
                   
                            
         
				</div>
			</div>				</div>
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