/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Nov817;

import java.net.*;
public class Server {
    public static void main(String[] args) {
        try {
            DatagramSocket s_ds = new DatagramSocket(1025);
            byte buf[] = new byte[1000];
            DatagramPacket s_dpr = new DatagramPacket(buf, buf.length);
            int total = 0;
            int a = 0;
            String s;
            for (int i = 0; i < 5; i++) {
                s_ds.receive(s_dpr);
                s = new String(s_dpr.getData(), 0, s_dpr.getLength());
                a = Integer.parseInt(s);
                total += a;
            }
           s = new Integer(total).toString();
           DatagramPacket s_dps = new DatagramPacket(s.getBytes(),s.length(),InetAddress.getLocalHost(),1026);
           s_ds.send(s_dps);
        } catch (Exception e) {
            System.out.println("Server :" + e.toString());
        }
    }

}
