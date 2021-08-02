<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@ page import ="java.sql.*" %>
 
<% 

  String url = "jdbc:mysql://localhost:3306/fine_grained";
        String user = "root";
        String password = "";
        String query = request.getQueryString();
        Map<String, String> query_pairs = new LinkedHashMap<String, String>();
         String[] pairs = query.split("&");
    for (String pair : pairs) {
        int idx = pair.indexOf("=");
        query_pairs.put(URLDecoder.decode(pair.substring(0, idx), "UTF-8"), URLDecoder.decode(pair.substring(idx + 1), "UTF-8"));
    }
        
            Connection conn = DriverManager.getConnection(url, user, password);
            // String id=request.getParameter("id");
             HttpSession httpSession=request.getSession();
             String downloadFile = String.valueOf(httpSession.getAttribute("downloadFile"));
            String sql = "Select *  from files where file_name='" + query_pairs.get("fname") + "'";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            
            while (result.next()) {
                
                Blob blob = result.getBlob("file");
                String fname = result.getString("file_name");
          
                 String filePath = "C:/Users/Gayathiri/Desktop/"+ fname;
                InputStream inputStream = blob.getBinaryStream();
                OutputStream outputStream = new FileOutputStream(filePath);
 
                int bytesRead = -1;
                byte[] buf = new byte[1024];
                while ((bytesRead = inputStream.read(buf)) != -1) {
                    outputStream.write(buf, 0, bytesRead);
                }
 
                inputStream.close();
                outputStream.close();
               out.println("<script>alert('File Saved Successfully')");
            }response.sendRedirect("downloadingfilepage.jsp");
      
%>
