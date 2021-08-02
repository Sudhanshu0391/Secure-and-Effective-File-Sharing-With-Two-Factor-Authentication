<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="javax.crypto.KeyGenerator"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DatabaseConnectivity.Dbconn"%>

<%
    Connection con = null;
    Statement st = null;
    String key = request.getParameter("key");
    String trust = request.getParameter("trust");
    String fname = request.getParameter("fname");
     String mail = request.getParameter("mail");
    try {
        con = Dbconn.getConnection();
        st = con.createStatement();
        ResultSet rs=st.executeQuery("SELECT distinct * FROM `files`,`trustee` where    files.file_name='"+fname+"' AND request='"+mail+"' AND skey='"+key+"' AND files.file_name = trustee.file_name; ");
        
        if (rs.next()) {
            String t=rs.getString("trust");
               String data=rs.getString("file");
          if(t.equalsIgnoreCase("Issued")){
            
             int i= st.executeUpdate("insert into f_download (file_name, down)values('"+fname+"','"+mail+"')");
        if(i!=0){
              byte a[] = data.getBytes();
        response.setContentType("text/plain");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fname + "\"");
        OutputStream os = response.getOutputStream();
        os.write(a);
        os.close();
        a = null;
        if (a == null) {
        }
 
        }
            }
                             else{
                   response.sendRedirect("f_download.jsp?msg=Get_File_secutiry_Request_from_Trustee_to_download");
       
                             }
        }
        else
        {
            response.sendRedirect("f_download.jsp?msg=Get_Secret_key_from_authority_to_download");
        }
    } catch (Exception ex) {
        response.sendRedirect("f_download.jsp?msg=Download_failed");
       
        ex.printStackTrace();
    }

%>
