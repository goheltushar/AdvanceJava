
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class AuthenticationServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//172.16.17.3:1521/orcl1", "gtushar", "staff");
            Statement smt = con.createStatement();
            ResultSet rs = smt.executeQuery("select * from UserDb where username ='"+ username +"' and password = '"+ password +"'");
            if(rs.next()){
                out.print("You Are Authenticated Succesfully...");
            }else{
                out.print("You Are not a Valid User...");
            }
            
        } catch (Exception e) {
            out.print(e);
        }

    }
}
