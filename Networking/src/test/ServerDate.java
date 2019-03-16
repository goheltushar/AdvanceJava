package test;

import java.net.*;
import java.io.*;
import java.util.Date;

public class ServerDate {

    public static void main(String[] args) {
        try {
            ServerSocket ss = new ServerSocket(5000);
            Socket s = ss.accept();
            PrintWriter spw = new PrintWriter(new OutputStreamWriter(s.getOutputStream()), true);
            spw.println(new Date());
        } catch (Exception e) {
            System.out.println("Server :" + e.toString());
        }
    }
}
