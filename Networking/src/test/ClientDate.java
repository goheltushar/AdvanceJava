/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import java.net.*;
import java.io.*;
import java.util.Scanner;

public class ClientDate {

    public static void main(String[] args) {
        try {
            Socket c = new Socket("localhost", 5000);
            BufferedReader cbr = new BufferedReader(new InputStreamReader(c.getInputStream()));
            System.out.println("Date and Time From Server : " + cbr.readLine());
        } catch (Exception e) {
            System.out.println("client :" + e.toString());
        }
    }
}
