
import java.net.*;
import java.io.*;

public class SimpleServer {

    public static void main(String[] args) {
        try {
            ServerSocket ss = new ServerSocket(5000);
            Socket s = ss.accept();
            PrintWriter spw = new PrintWriter(new OutputStreamWriter(s.getOutputStream()), true);
            BufferedReader sbr = new BufferedReader(new InputStreamReader(s.getInputStream()));
            String str = sbr.readLine();
            StringBuffer sb = new StringBuffer(str);
            String rev = sb.reverse().toString();
            if(str.equals(rev))
                spw.println("Palindrome...");
            else
                spw.println("Not Palindrome...");
        } catch (Exception e) {
            System.out.println("Server :" + e.toString());
        }
    }
}
