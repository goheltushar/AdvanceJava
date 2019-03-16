import java.net.*;
import java.io.*;

class MyThread extends Thread {

    Socket mysocket;

    MyThread(Socket s) {
        mysocket = s;
        start();
    }

    public void run() {
        try {
            PrintWriter spw = new PrintWriter(new OutputStreamWriter(mysocket.getOutputStream()), true);
            BufferedReader sbr = new BufferedReader(new InputStreamReader(mysocket.getInputStream()));
            String str = sbr.readLine();
            StringBuffer sb = new StringBuffer(str);
            spw.println(sb.reverse().toString());
            mysocket.close();
        } catch (Exception e) {
            System.out.println("In run :" + e.toString());
        }
    }
}

public class StringReverseServer {

    public static void main(String[] args) {
        try {
            ServerSocket ss = new ServerSocket(1025);
            Socket s;
            while(true){
                s=ss.accept();
                new MyThread(s);
            }
            
        } catch (Exception e) {
            System.out.println("Server : " + e.toString());
        }
    }
}
