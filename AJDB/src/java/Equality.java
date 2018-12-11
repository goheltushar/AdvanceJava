/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author administrator
 */
public class Equality {
 int x;
 int y;
 boolean isequal(){
     return(x==y);
 }
}

class Output{
    public static void main(String[] args) {
        Equality obj = new Equality();
        obj.x=5;
        obj.y=5;
        System.out.println(obj.isequal());
    }
}
