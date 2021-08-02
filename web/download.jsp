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
							
							<li class="current"><a href="f_download.jsp">Log Out</a>
                                                        
								</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</header>

<!--=======content================================-->
<%
try{
 
    String fname = request.getParameter("fname");
    String mail = request.getParameter("mail");
     Connection con;
                                        Statement st;
                                        ResultSet rs;
                                        con = Dbconn.getConnection();
                                        st = con.createStatement();
                                        rs = st.executeQuery("SELECT distinct * FROM `files`,`trustee` where request='"+mail+"' AND  files.file_name='"+fname+"' AND files.file_name = trustee.file_name ;");
        
               
                                        if (rs.next()) {
                                            String trust=rs.getString("trust");
                                             String key=rs.getString("skey");
                                             System.out.println(trust);
                                             
                                             System.out.println(key);
                                       
                                        
     %>
<section id="content"  style="background-color:black">
	<div class="full-width-container block-2">
		<div class="container">
                   <div class="row">
                       <center>
                                <header>
						<h2 style="color:whitesmoke"><span>Two Factor Access Control for File</span></h2>
					</header>
					
                               </center>
			   
			 <div  style="height: 297px; width: 1000px; margin-left: 10px;margin-bottom: -10px;">
                         <div style="width:500px;height: 300px;border-top-left-radius: 19px;border-bottom-left-radius: 19px;float: left;">
	
                             <fieldset style="background-color:cornflowerblue;border-radius: 9px;height: 350px;margin-top: 10px;">
                                 <br>
          <center>
        <h1 style="font: monospace;font-size: 35px;font-weight: bold;color: darkslateblue">Trustee File Security </h1><br><br><br>
          <form action="" name="form1" method="get" > 
<label style="font-size: 20px;margin-left:30px;">Trustee Status :</label> <br><input type="text" id="id"  style="height: 40px; width:250px; " name="key" value="<%=trust%>" required style="margin-left: 45px;" readonly=""/><br><br>
 
     
  
      
            
		</form>
          </center>
                             </fieldset>
                </div>
                                       <div style="height: 355px; width: 500px;margin-left:600px;">
                                           <fieldset style="background-color:#ff33ff;border-radius: 9px;height: 350px;margin-top: 10px;">
                                 <br>
          <center>
        <h1 style="font: monospace;font-size: 35px;font-weight: bold;color: darkslateblue">File Secret Key </h1><br><br><br>
            <form action="downloads.jsp" name="form1" method="get" > 
<label style="font-size: 20px;margin-left:30px;">Secret Key :</label> <br><input type="text" id="id"  style="height: 40px; width:250px; " name="key"required style="margin-left: 45px;" placeholder="Enter secret key "/><br><br>
 
     <input type="hidden" value="<%=trust%>" name="trust" />
                <input type="hidden" value="<%=fname%>" name="fname" />
      <input type="hidden" value="<%=mail%>" name="mail" />
             
<input type="submit"  value="Download"style="border-radius: 12px;height: 38px;width: 93px;background-color:silver"/>

  
      
            
		</form>
          </center>
                             </fieldset>
 
                                       </div>
                         </div>
                       <br>
                       
                       
                              
                                <%
                                                               }
                                     else{
                                       response.sendRedirect("f_download.jsp?msg=get_Request_from_trustee_and_authority");      
                                      }
                                                                               
        } catch (Exception ex) {
            response.sendRedirect("f_download.jsp?msg=get_Request_from_trustee_and_authority");
                                    ex.printStackTrace();
                                }%>
         
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