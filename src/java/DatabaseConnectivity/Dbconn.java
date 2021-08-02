/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DatabaseConnectivity;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author java2
 */
public class Dbconn {

    public static Connection getConnection() {
        Connection con = null;
        try {
           /*
                   Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fine_grained", "root", "");*/
           Class.forName("com.mysql.jdbc.Driver");
           con=DriverManager.getConnection("jdbc:mysql://localhost/fine_grained","root","");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return con;
    }
}
