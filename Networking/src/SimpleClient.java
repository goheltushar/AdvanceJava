import java.net.*;
import java.io.*;
import java.util.Scanner;
public class SimpleClient {
    public static void main(String[] args) {
        try {
            Socket c = new Socket("localhost", 5000);
            PrintWriter cpw = new PrintWriter(new OutputStreamWriter(c.getOutputStream()), true);
            BufferedReader cbr = new BufferedReader(new InputStreamReader(c.getInputStream()));
            Scanner s = new Scanner(System.in);
            System.out.print("Enter String : -> ");
            String str = s.nextLine();
            cpw.println(str);
            System.out.println(cbr.readLine());
        } catch (Exception e) {
            System.out.println("client :" + e.toString());
        }
    }
}