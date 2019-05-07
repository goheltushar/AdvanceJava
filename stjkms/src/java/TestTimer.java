
import java.util.Timer;
import java.util.Calendar;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author tushar
 */
public class TestTimer {

    public static void main(String[] args) {
        Timer timer = new Timer();
        Calendar calendar = Calendar.getInstance();
        
        calendar.add(Calendar.MINUTE, 1);
       

        timer.schedule(new CheckStatusTimer(), calendar.getTime());

    }

}
