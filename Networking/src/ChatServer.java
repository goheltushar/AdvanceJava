
import java.net.*;
import java.io.*;

public class ChatServer {

    public static void main(String[] args) {
        try {
            DatagramSocket sds = new DatagramSocket(1025);
            byte buf[] = new byte[1000];
            DatagramPacket sdp = new DatagramPacket(buf, buf.length);
            sds.receive(sdp);
            String str = new String(sdp.getData(), 0, sdp.getLength());
            System.out.println("Client Said : " + str);
            sds.close();
        } catch (Exception e) {
        }
    }
}
