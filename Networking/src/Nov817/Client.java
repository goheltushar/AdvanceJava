/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Nov817;

import java.net.*;

public class Client {

    public static void main(String[] args) {
        try {
            DatagramSocket c_ds = new DatagramSocket(1026);
            DatagramPacket c_dps;
            String s[] = {"1", "2", "7", "85", "9"};

            for (int i = 0; i < 5; i++) {
                c_dps = new DatagramPacket(s[i].getBytes(), 0, s[i].length(), Inet4Address.getLocalHost(), 1025);
                c_ds.send(c_dps);
            }
            
            DatagramPacket c_dpr = new DatagramPacket(new byte[1000], 1000);
            c_ds.receive(c_dpr);
            System.out.println(new String(c_dpr.getData()));
            
        } catch (Exception e) {
            System.out.println("Client : " + e.toString());
        }
    }

}
