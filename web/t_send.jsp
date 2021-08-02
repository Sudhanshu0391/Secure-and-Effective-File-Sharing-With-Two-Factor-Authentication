<%@page import="DatabaseConnectivity.Dbconn"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%

    String fname = request.getParameter("fname");
    String mail=session.getAttribute("email").toString(); 
//    String mail = request.getParameter("email");
    String size = request.getParameter("size");
    System.err.println(fname + mail + size);
    try {
        Connection con;
        Statement st;
        con = Dbconn.getConnection();
        st = con.createStatement();
        int j = st.executeUpdate("insert into trustee(file_name,request,size,status) values('" + fname + "','" + mail + "','" + size + "','Request')");
        if (j != 0) {

            response.sendRedirect("t_request.jsp?msg=Request_send_to_Trustee");
        } else {
            response.sendRedirect("t_request.jsp?msg=Request_failed");
        }



    } catch (Exception ex) {
        response.sendRedirect("t_request.jsp?You_hava_already_given_request");
        ex.printStackTrace();
    }
%>