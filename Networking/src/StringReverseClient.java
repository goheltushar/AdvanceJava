import java.net.*;
import java.io.*;

public class StringReverseClient {
    public static void main(String[] args) {
        try {
            Socket c = new Socket("localhost", 1025);
            PrintWriter cpw = new PrintWriter(new OutputStreamWriter(c.getOutputStream()), true);
            BufferedReader cbr = new BufferedReader(new InputStreamReader(c.getInputStream()));
            cpw.println("Tushar");
            System.out.println(cbr.readLine());
            
        } catch (Exception e) {
            System.out.println("Client :" + e.toString());
        }
    }
}