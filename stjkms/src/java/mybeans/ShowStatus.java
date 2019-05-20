/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mybeans;

import java.io.*;
import java.sql.*;

/**
 *
 * @author tushar
 */
public class ShowStatus implements Serializable {
    
    Connection con;
    
    public ShowStatus() {

    }

    void initializeDB(String url,String user,String password) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user,password);
           
        } catch (Exception e) {
        }
    }

    public void copyInputStream(InputStream in, OutputStream out) throws IOException {
        byte[] buffer = new byte[1024];
        int len = in.read(buffer);
        while (len >= 0) {
            out.write(buffer, 0, len);
            len = in.read(buffer);
        }
        in.close();
        out.close();
    }
}
