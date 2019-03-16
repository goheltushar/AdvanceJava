
import java.net.*;
import java.io.*;

public class ChatClient {

    public static void main(String[] args) {
        try {
            DatagramSocket cds = new DatagramSocket(1026);
            DatagramPacket cdp;
            InetAddress ip = InetAddress.getLocalHost();
            BufferedReader cinbr = new BufferedReader(new InputStreamReader(System.in));
            System.out.print("Enter -> ");
            String str = cinbr.readLine();
            byte buf[] = str.getBytes();
            cdp = new DatagramPacket(buf, buf.length, ip, 1025);
            cds.send(cdp);
            cds.close();
        } catch (Exception e) {
            System.out.println("Client:" + e.toString());
        }
    }
}
