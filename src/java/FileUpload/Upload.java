package FileUpload;

import DatabaseConnectivity.Dbconn;
import EncryptionDecryption.TrippleDes;
import FileReador.ContentExtractor;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author java2
 */
public class Upload extends HttpServlet {

    private static java.sql.Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Date(today.getTime());
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
   public void doPost(HttpServletRequest request, HttpServletResponse response) 
throws IOException{ 
    response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
                try{
            
            /* TODO output your page here. You may use following sample code. */
            Connection con;
            PreparedStatement pstmt = null;
            File f = null;
            DiskFileItemFactory diskFile = new DiskFileItemFactory();
            diskFile.setSizeThreshold(1 * 1024 * 1024);
            diskFile.setRepository(f);
            ServletFileUpload sfu = new ServletFileUpload(diskFile);
            List item = sfu.parseRequest(request);
            Iterator itr = item.iterator();
            FileItem items = (FileItem) itr.next();
            String str = ContentExtractor.getStringFromInputStream(items.getInputStream());
            System.out.println("file:"+str);
            String encstr = new TrippleDes().encrypt(str);
            InputStream input = items.getInputStream();
            int size=input.available();
            System.out.println("file name is " +items.getName());
            
            con = Dbconn.getConnection();
            pstmt = con.prepareStatement("insert into files (file_name, size, file, data) values(?,?,?,?)");
            pstmt.setString(1, items.getName());
            pstmt.setInt(2, size);
            pstmt.setBinaryStream(3, items.getInputStream(),items.getInputStream().available());
            pstmt.setString(4, encstr);
             /*Cloud Start*/
                                File f1 = new File(items.getName());
                                FileWriter fw = new FileWriter(f1);
                                fw.write(encstr);
                                fw.close();
                                Ftpcon ftpcon = new Ftpcon();
                                ftpcon.upload(f1, items.getName());
                              /*Cloud End*/
                                
            int i =   pstmt.executeUpdate();
            if(i!=0){
               response.sendRedirect("f_upload.jsp?fileuplodedsusscessfully...");
            }
            else{
                response.sendRedirect("f_upload.jsp?Uploadingfailed...");
            }
        } catch(Exception ex){
             response.sendRedirect("f_upload.jsp?File_name_already_exit");
            ex.printStackTrace();
        } 
                finally{
                    out.close();
                }
    }
}