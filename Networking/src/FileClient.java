import java.net.*;
import java.io.*;

public class FileClient {

    public static void main(String[] args) {
        try {
            Socket c = new Socket("localhost", 1025);
            PrintWriter cpw = new PrintWriter(new OutputStreamWriter(c.getOutputStream()), true);
            BufferedReader cbr = new BufferedReader(new InputStreamReader(c.getInputStream()));
            FileWriter cfw = new FileWriter("Test1.txt");
            PrintWriter cfpw = new PrintWriter(cfw,true);

            cpw.println("Test.txt");
            String test = "";
            while ((test = cbr.readLine()) != null) {
                System.out.println(test);
                cfpw.println(test);
            }
            
        } catch (Exception e) {
            System.out.println("client :" + e.toString());
        }
    }
}