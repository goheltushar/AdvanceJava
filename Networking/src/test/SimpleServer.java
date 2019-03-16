/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import java.net.*;
import java.io.*;

public class SimpleServer {

    public static void main(String[] args) {
        try {
            ServerSocket ss = new ServerSocket(5000);
            Socket s = ss.accept();
            PrintWriter spw = new PrintWriter(new OutputStreamWriter(s.getOutputStream()), true);
            BufferedReader sbr = new BufferedReader(new InputStreamReader(s.getInputStream()));
            int n = Integer.parseInt(sbr.readLine());
            String result="Prime...";
            
            for (int i = 2; i < n; i++) {
                if((n%i) == 0){
                    result="Not Prime...";
                    break;
                }
            }
            
            spw.println(result);
        } catch (Exception e) {
            System.out.println("Server :" + e.toString());
        }
    }
}
