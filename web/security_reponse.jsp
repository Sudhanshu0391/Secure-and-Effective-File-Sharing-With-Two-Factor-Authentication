<%@page import="DatabaseConnectivity.Dbconn"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%

    String fname = request.getParameter("fname");
    String mail = request.getParameter("email");
    System.out.println("Trustee Values :" + fname + mail);
    try {
        Connection con;
        Statement st;
        con = Dbconn.getConnection();
        st = con.createStatement();
        int j = st.executeUpdate("update trustee set trust='Issued', status1='yes' where file_name='" + fname + "' AND request='" + mail + "'");
        if (j != 0) {

            response.sendRedirect("file_issue.jsp?msg=File_security_issued");
        } else {
            response.sendRedirect("file_issue.jsp?msg=Issued_failed");
        }

    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>