
import java.net.*;
import java.io.*;

public class SimpleDGServer {

    public static void main(String[] args) {
        try {
            DatagramSocket sds = new DatagramSocket(1025);
            byte buf[] = new byte[1000];
            DatagramPacket sdp = new DatagramPacket(buf, buf.length);
            sds.receive(sdp);
            String str = new String(sdp.getData(), 0, sdp.getLength());
            StringBuffer sb = new StringBuffer(str);
            str = sb.reverse().toString();
            buf = str.getBytes();
            InetAddress ip = InetAddress.getLocalHost();
            sdp = new DatagramPacket(buf, str.getBytes().length, ip, 1026);
            sds.send(sdp);
            sds.close();
        } catch (Exception e) {
            System.out.println("Server :" + e.toString());
        }
    }
}
