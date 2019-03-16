package Tutorial3;


import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;


public class Tutorial3_16 extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        ServletConfig config = getServletConfig();
        int n = Integer.parseInt(config.getInitParameter("number"));
        int count=0;
        while((n%10)>0){
            n=n/10;
            count++;
        }
        out.println(count);
    }
}
