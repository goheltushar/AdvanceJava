import java.net.InetAddress;
import java.net.UnknownHostException;
public class Networking {
    public static void main(String[] args) {
        try {
            InetAddress ip = InetAddress.getByName("localhost");
            System.out.println("The IP Address is: " + ip);
        } catch (UnknownHostException ue) {
            System.out.println("Website not found");
        }
    }
}
