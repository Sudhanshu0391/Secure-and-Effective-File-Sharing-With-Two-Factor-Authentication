
<%@page import="DatabaseConnectivity.Dbconn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>

<%
    String key=request.getParameter("key");
    HttpSession user=request.getSession();
    String mail=user.getAttribute("email").toString();
     
     System.out.println("mail "+mail);
   
    try{
       
        Connection con=Dbconn.getConnection();
        Statement st=con.createStatement();
        
        
        ResultSet rt=st.executeQuery("select * from register where mail='"+mail+"'  AND one_key='"+key+"' ");
        if(rt.next()){
           response.sendRedirect("user_page.jsp?msg=Key_Verified");   
             
    } else{
       out.print("Enter the correct key");         
    }}          
        catch(Exception ex){
        ex.printStackTrace();
    }
%>