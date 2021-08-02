<%-- 
    Document   : loginaction
    Created on : Feb 23, 2016, 3:43:53 PM
    Author     : Kavi java4
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DatabaseConnectivity.Dbconn"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%>

<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    String name = request.getParameter("name");
     String fname = request.getParameter("fname");
    String key = request.getParameter("key");
    session.setAttribute( "theName", name );
    System.out.println("session name set"+name);
    String pass = request.getParameter("pass");
    System.out.println("password"+pass);
    int status = Integer.parseInt(request.getParameter("status"));
    String email = request.getParameter("mail");
    String dob = request.getParameter("date");
    String gen = request.getParameter("gen");
    String loc = request.getParameter("loc");
//    String user = request.getParameter("username");
    String phone = request.getParameter("mobile");
    String com = request.getParameter("com");
    String command = request.getParameter("command");
//    String key = "Yes"; 
         System.out.println("coammandseweer"+com);
     try {
        con = Dbconn.getConnection();
        st = con.createStatement();
        switch (status) {
            case 1:
                try {
                    rs = st.executeQuery("select * from reg where name='" + name + "' AND pass='" + pass + "'");
                    if (rs.next()) {
//                        session.setAttribute("email", rs.getString("mail"));
                        session.setAttribute("Name", rs.getString("name"));
                        
                        session.setAttribute("id", rs.getString("id"));
                        
                        response.sendRedirect("uhome.jsp?sec=Success");
                    } else {
                        response.sendRedirect("userlogin.jsp?err=Error");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 2:
                try {
                    rs = st.executeQuery("select * from reg where skeys='" + pass + "'");
                    if (rs.next()) {
//                        session.setAttribute("email", rs.getString("email"));
                        session.setAttribute("lname", rs.getString("name"));
                        
                        session.setAttribute("id", rs.getString("id"));
                        
                        response.sendRedirect("lock.jsp?msg=success");
                    } else {
                        response.sendRedirect("lockpass.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
                
                case 3:

              try {
                 con = Dbconn.getConnection();
                 st = con.createStatement();
            int i = st.executeUpdate("insert into reg(name, pass, mail, DOB, gender, phone, loc) values ('" + name + "','" + pass + "','" + email + "','" + dob + "','" + gen + "','" + phone + "','" + loc + "')");
                if (i != 0) {
                
                response.sendRedirect("finger.jsp?msg=success");
                } else {
                     response.sendRedirect("index.jsp?msgg=failed");
                 }
                  } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
               case 4:
                try {
                    rs = st.executeQuery("select * from reg where skeys='" + pass + "'");
                    if (rs.next()) {
//                        session.setAttribute("email", rs.getString("email"));
//                        session.setAttribute("name", rs.getString("name"));
                        
//                        session.setAttribute("id", rs.getString("id"));
                        
                        response.sendRedirect("unlock.jsp?msg=success");
                    } else {
                        response.sendRedirect("lockpass.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
          case 5:
                try {
                    rs = st.executeQuery("select * from files where skey='" + key + "'");
                    if (rs.next()) {
//                        session.setAttribute("email", rs.getString("email"));
//                        session.setAttribute("name", rs.getString("name"));
                        
//                        session.setAttribute("id", rs.getString("id"));
                        
                        response.sendRedirect("fprint.jsp?msg=success");
                    } else {
                        response.sendRedirect("dvc.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
  
                case 6:
                try {
                    rs = st.executeQuery("select * from reg where yyys='" + pass + "' AND role='Commander'");
                    if (rs.next()) {
                   
                        response.sendRedirect("c_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("c_one_p.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                               
                break;
            
            case 8:
                try {
                    if (name.equalsIgnoreCase("admin") && pass.equalsIgnoreCase("admin")) {
                        response.sendRedirect("ahome.jsp?sec=Success");
                    } else {
                        response.sendRedirect("admin.jsp?err=Error");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
                case 9:
                try {
                    rs = st.executeQuery("select * from files where skey='" + key + "'");
                    if (rs.next()) {
//                        session.setAttribute("email", rs.getString("email"));
//                        session.setAttribute("name", rs.getString("name"));
                        
//                        session.setAttribute("id", rs.getString("id"));
                        
                        response.sendRedirect("fprint.jsp?msg=success&fname="+fname);
                    } else {
                        response.sendRedirect("dvc.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            default:
                response.sendRedirect("index.html");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>