import java.net.*;
import java.io.*;
public class SimpleServer1 {
    public static void main(String[] args) {
        try {
            ServerSocket ss = new ServerSocket(5000);
            Socket s = ss.accept();
            PrintWriter spw = new PrintWriter(new OutputStreamWriter(s.getOutputStream()), true);
            BufferedReader sbr = new BufferedReader(new InputStreamReader(s.getInputStream()));
            String str = sbr.readLine();
            StringBuffer sb = new StringBuffer(str);
            char ch;
            for (int i = 0; i < sb.length(); i++) {
                ch = sb.charAt(i);
                if (Character.isLowerCase(ch)) {
                    sb.setCharAt(i, Character.toUpperCase(ch));
                }
                if (Character.isUpperCase(ch)) {
                    sb.setCharAt(i, Character.toLowerCase(ch));
                }
            }
            spw.println(sb.toString());
        } catch (Exception e) {
            System.out.println("Server :" + e.toString());
        }
    }
}
