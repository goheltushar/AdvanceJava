import java.net.*;
import java.io.*;
public class SimpleDGClient {
    public static void main(String[] args) {
        try {
            DatagramSocket cds = new DatagramSocket(1026);
            String str = "Bahubali";
            byte buf[] = str.getBytes();
            InetAddress ip = InetAddress.getLocalHost();
            DatagramPacket cdp = new DatagramPacket(buf, buf.length,ip,1025);
            cds.send(cdp);
            byte buf1[] = new byte[1000];
            cdp = new DatagramPacket(buf,buf1.length);
            cds.receive(cdp);
            System.out.println(new String(cdp.getData(),0,cdp.getLength()));
            cds.close();
        } catch (Exception e) {
            System.out.println("Client :" + e.toString());
        }
    }
}
