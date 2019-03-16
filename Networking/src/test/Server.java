
package test;


import java.net.*;
import java.io.*;
import java.util.ArrayList;
import java.util.Comparator;

public class Server {

    public static void main(String[] args) {
        try {
            ServerSocket ss = new ServerSocket(5000);
            Socket s = ss.accept();
            PrintWriter spw = new PrintWriter(new OutputStreamWriter(s.getOutputStream()), true);
            BufferedReader sbr = new BufferedReader(new InputStreamReader(s.getInputStream()));
 
            ArrayList numbers = new ArrayList();
            for(int i =0;i<10;i++){
                numbers.add(Integer.parseInt(sbr.readLine()));
            }
            numbers.sort(null);
             for(int i =0;i<10;i++){
                spw.println(numbers.get(i));
            }
          
        } catch (Exception e) {
            System.out.println("Server :" + e.toString());
        }
    }
}
