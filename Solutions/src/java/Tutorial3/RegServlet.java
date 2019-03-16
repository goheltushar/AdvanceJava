package Tutorial3;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RegServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        String id = req.getParameter("empid");
        String name = req.getParameter("empname");
        String email = req.getParameter("empemail");
        int age = Integer.parseInt(req.getParameter("empage"));
        
        out.println(id + "<br>" + name + "<br>" + email + "<br>" + age);
    }
}
