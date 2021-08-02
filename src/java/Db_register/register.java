package Db_register;

import DatabaseConnectivity.Dbconn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author IBN5
 */
public class register extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           String name=request.getParameter("name");
           HttpSession session = request.getSession();
          session.setAttribute( "theName", name );
           String uname=request.getParameter("username");
           String pass=request.getParameter("password");
           String mail=request.getParameter("mail");
           String ph=request.getParameter("mobile");
          Connection con= Dbconn.getConnection();
          Statement st=con.createStatement();
           int i=st.executeUpdate("insert into register (username,name,password,mail,phoneno)values('"+uname+"','"+name+"','"+pass+"','"+mail+"','"+ph+"')");
          con.close();
           if(i!=0){
                response.sendRedirect("finger.jsp?msg=success");
              response.sendRedirect("register.jsp?status='registered_successfully'");
          }
           else{
            response.sendRedirect("register.jsp?status='registration_failed'");
               
           }
        } 
        catch(Exception e){
            out.println(e);
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
