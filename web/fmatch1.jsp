<%-- 
    Document   : merchant
    Created on : Sep 7, 2015, 11:44:28 AM
    Author     : java
--%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DatabaseConnectivity.Dbconn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.InputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Multi access System for cloud Computing Services</title>
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="css/business-casual.css" rel="stylesheet">
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <!-- Fonts -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
        <script>
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#blah')
                                .attr('src', e.target.result)
                                .width(150)
                                .height(200);
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>
    </head>
    <body background="baa.jpg">
      

        <br><br><br><br><br><br><br><br><br><br><div class="container">
            <div class="row">
                <div class="box" style="height: 650px;">
                    <!--To do you work-->
                    <div style="border: 1px solid white;height: 610px;border-top-width: 20px;border-bottom-width: 10px">
                        <br><br><br><center><h3 style="text-transform: uppercase">Search Baby</h3></center><br />

                         <div id="login" class="animate form" >
                             <%String ape="";out.print(""+ape);%>
                            <!--<h1>view all images</h1>-->
                             <%{
                                 
                                HttpSession httpSession=request.getSession();
                                String downloadFile= String.valueOf(httpSession.getAttribute("downloadFile"));
    
    
                        InputStream n1 = null;
                        String logo = null;
                        String did = null;
                        int i = 1;
            File f = null;
            DiskFileItemFactory diskFile = new DiskFileItemFactory();
            diskFile.setSizeThreshold(1 * 1024 * 1024 * 1024);
            diskFile.setRepository(f);
                        
            ServletFileUpload sfu = new ServletFileUpload(diskFile);
            List item = sfu.parseRequest(request);
            Iterator itr = item.iterator();
            FileItem items = (FileItem) itr.next();
//            String str = ContentExtractor.getStringFromInputStream(items.getInputStream());
            InputStream input = items.getInputStream();
            int size=input.available();
           
//                        String sname1 = request.getParameter("search1");
//                        session.setAttribute("n2", sname);
//                        session.setAttribute("n3", sname1);
                      String  email =(String)session.getAttribute("email");
                        Connection con = Dbconn.getConnection();
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from register where size='" + size + "' AND mail= '" + email + "'");
                        
                   if(rs.next()) {
                       
                       System.out.println("success");
                        
                    
                    %>
                   
                    
                    
                    
                    <%
                             response.sendRedirect("down.jsp?msg=seccsss&fname="+downloadFile);
                        }else {
                            response.sendRedirect("fprint.jsp?msg=Error");
                        }
                       }              
                    %>
                       
                        </div>
                        
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <p>Copyright &copy; 2015-2016
                        </p>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>