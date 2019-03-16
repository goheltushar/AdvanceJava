
import java.sql.*;

public class SampleDB {

    public static void main(String[] args) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//172.16.17.3:1521/orcl", "gtushar", "staff");
            System.out.println("*** Connected to the database ***");
            Statement smnt = con.createStatement();
            ResultSet rslset1 = smnt.executeQuery("select * from emp");
            String names;
            long salaries;
            int count = 0;
            long payroll = 0;

            while (rslset1.next()) {
                names = rslset1.getString(1);
                salaries = rslset1.getInt("Salary");
                System.out.println(names + "   " + salaries);
                count = count + 1;
                payroll = payroll + salaries;
            }
            //con.commit();
            con.close();
        } catch (Exception ea) {
            System.err.println("Error Somewhere !!!!" + ea.toString());
            ea.printStackTrace();
        }
    }
}
