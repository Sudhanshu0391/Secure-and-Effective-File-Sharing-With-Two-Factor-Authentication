<%-- 
    Document   : skey
    Created on : Feb 4, 2017, 11:44:05 AM
    Author     : java4
--%>

<%@page import="Mail.MailSender"%>
<%@page import="DatabaseConnectivity.Dbconn"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.ConnectException"%>
<%


    String name = (String) session.getAttribute("filename");
    String mail = (String) session.getAttribute("semail");
    System.out.println("Get value from session Parameter : " + name + mail);

    try {

        Connection con = Dbconn.getConnection();
        Statement st1 = null;
        st1 = con.createStatement();

        int in = st1.executeUpdate("update authority set author='Issued', status2='yes' where file_name='" + name + "' AND request='" + mail + "'");
        if (in != 0) {

            System.err.println("Update Successfully......." + in);
            response.sendRedirect("f_request.jsp?msg=Key_Sent");
        } else {
            response.sendRedirect("f_request.jsp?msg=Failed");
        }


    } catch (Exception e) {
        e.printStackTrace();
    }
%>
