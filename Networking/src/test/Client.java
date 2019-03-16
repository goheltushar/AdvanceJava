/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import java.net.*;
import java.io.*;
import java.util.Scanner;

public class Client {

    public static void main(String[] args) {
        try {
            Socket c = new Socket("localhost", 5000);
            PrintWriter cpw = new PrintWriter(new OutputStreamWriter(c.getOutputStream()), true);
            BufferedReader cbr = new BufferedReader(new InputStreamReader(c.getInputStream()));
            Scanner s = new Scanner(System.in);
            int n;
            for (int i = 0; i < 10; i++) {
                System.out.print("Enter Number ( " + i + " ) :-> ");
                n = s.nextInt();
                cpw.println(n);
            }

            for (int i = 0; i < 10; i++) {
                System.out.println(cbr.readLine());
            }
            
        } catch (Exception e) {
            System.out.println("client :" + e.toString());
        }
    }
}
