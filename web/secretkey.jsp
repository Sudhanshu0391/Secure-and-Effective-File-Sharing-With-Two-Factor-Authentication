<%@page import="Mail.MailSender"%>
<%@page import="DatabaseConnectivity.Dbconn"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.ConnectException"%>
<%


    String title = "Secret Key";
    String name = request.getParameter("fname");
    String mail = request.getParameter("email");
    session.setAttribute("filename", name);
    session.setAttribute("semail", mail);
    System.out.println("Get Parameter : " + name + mail);

    Random s = new Random();
    int a = s.nextInt(80000000 - 5000) + 25000;
    System.out.print(a);
    String key = String.valueOf(a);
    String msg = "Name:" + name + "\nSecret Key:" + key;
    try {

        Connection con = Dbconn.getConnection();
        Statement st, st1 = null;
        st = con.createStatement();
        int i = st.executeUpdate("update files set skey = '" + key + "' where  file_name='" + name + "'");
        if (i != 0) {
            System.out.println("Udate 1111111111111111");
            MailSender smail = new MailSender();
            smail.sendMail(mail, title, msg);

            response.sendRedirect("skey.jsp?msg=Key_Sent");
        } else {
            response.sendRedirect("skey.jsp?msg=Failed");
        }


    } catch (Exception e) {
        e.printStackTrace();
    }
%>