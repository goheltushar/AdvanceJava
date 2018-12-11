/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author administrator
 */
class Evaluate {
    public static void main(String[] args) {
        int arr[] = new int[] {0,1,2,3,4,5,6,7,8,9};
        int n=6;
        n = arr[arr[n/2]];
        System.out.println(n);
        System.out.println(arr[n]/2);
    }
   
}
