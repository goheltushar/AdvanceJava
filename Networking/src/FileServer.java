import java.net.*;
import java.io.*;
public class FileServer {
    public static void main(String[] args) {
        try {
            ServerSocket ss = new ServerSocket(1025);
            Socket s = ss.accept();
            PrintWriter spw = new PrintWriter(new OutputStreamWriter(s.getOutputStream()), true);
            BufferedReader sbr = new BufferedReader(new InputStreamReader(s.getInputStream()));
            String name = sbr.readLine();
            FileReader sfr = new FileReader(name);
            BufferedReader sfbr = new BufferedReader(sfr);
            String test = "";
            while ((test = sfbr.readLine()) != null) {
                spw.println(test);
            }
        } catch (Exception e) {
            System.out.println("Server :" + e.toString());
        }

    }

}