package Tutorial3;


import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "RegistraionServlet", urlPatterns = "/RegistraionServlet")
public class RegistraionServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        String id = req.getParameter("empid");
        String name = req.getParameter("empname");
        String email = req.getParameter("empemail");
        int age = Integer.parseInt(req.getParameter("empage"));

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//172.16.17.3:1521/orcl1", "gtushar", "staff");
            Statement smt = con.createStatement();
            smt.execute("insert into emp values('" + id + "', '" + name + "', '" + email + "'," + age + "");
            out.print("Record Inserted Succesfully...");
        } catch (Exception e) {
            out.print(e);
        }

    }
}
