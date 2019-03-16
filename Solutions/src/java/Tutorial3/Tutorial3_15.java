package Tutorial3;


import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "Tutorial4_15", urlPatterns = "/Tutorial4_15")
public class Tutorial3_15 extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        out.println("Client Browser : " + req.getHeader("User-Agent"));
        out.println("<br>Client IP Address : " + req.getRemoteAddr());
        out.println("<br>Client Port : " + req.getRemotePort());
        out.println("<br>Server Port  : " + req.getServerPort());
        out.println("<br>Local Port  : " + req.getLocalPort());
        out.println("<br>Request Method  : " + req.getMethod());
        out.println("<br>Query String : " + req.getQueryString());
    }
}
