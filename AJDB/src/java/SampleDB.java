
import java.sql.*;


public class SampleDB {

    public static void main(String[] args) {
        try {
            /*TimeZone timeZone = TimeZone.getTimeZone("Asia/Kolkata");
            TimeZone.setDefault(timeZone);*/
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//172.16.17.3:1521/orcl", "gtushar", "staff");
            System.out.println("------- Connected Succesfully ----------");
            Statement smt = con.createStatement();
            ResultSet rs = smt.executeQuery("select * from emp");
            while(rs.next()){
                System.out.println(rs.getObject(1));
                System.out.println(rs.getObject(2));
                System.out.println(rs.getObject(3));
            }
        } catch (Exception e) {
            System.out.println("Error in main : " + e.toString());
        }
    }
}
