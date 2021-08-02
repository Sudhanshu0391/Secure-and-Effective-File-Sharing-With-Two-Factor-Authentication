<%@page import="DatabaseConnectivity.Dbconn"%>
<%--<%@page import="util.ContentExtractor"%>--%>
<%@page import="java.io.InputStream"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.FileFilter" %>
<html>
    <head>
        <title>
        </title>
    </head>
    <body>
        <%
        Connection conn=null;
        PreparedStatement pstmt = null;  
         
        try {
           String sname=(String)session.getAttribute("theName");
           System.out.println("session name get"+sname);
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
            System.out.println("file name is " +items.getName());
                       
            
            conn = new Dbconn().getConnection();
//            pstmt = conn.prepareStatement("insert into global (file_name, size, file) values(?,?,?)");
         String query =("update register set file_name=?, size=?, image=? where name='"+sname+"' ");
             pstmt = conn.prepareStatement(query);
//            pstmt = conn.prepareStatement("insert into local (file_name1, size1, file1, image1) values(?,?,?,?)");
            pstmt.setString(1, items.getName());
            pstmt.setInt(2, size);
            pstmt.setBinaryStream(3, items.getInputStream(),items.getInputStream().available());
//            pstmt.setBinaryStream(4, items.getInputStream(),items.getInputStream().available());
           
            int i =   pstmt.executeUpdate();
            if(i!=0){
               response.sendRedirect("user_login.jsp?Image_uploaded_successfully...");
            }
            else{
                response.sendRedirect("baby_img_up.jsp?Uploading_failed...");
            }
        } catch(Exception ex){
             response.sendRedirect("baby_img_up.jsp?Error");
            ex.printStackTrace();
        } finally {            
            conn.close();
        }
%>
    </body>
</html>
