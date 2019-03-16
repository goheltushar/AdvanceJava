package Tutorial3;


import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "Tutorial4_18", urlPatterns = "/Tutorial4_18")
public class Tutorial3_18 extends HttpServlet {

    int requestCounter;
    
    public void init(ServletConfig config){
        requestCounter=0;
    }
    
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        
        requestCounter++;
        
        RequestDispatcher odd = req.getRequestDispatcher("odd.jsp");
        RequestDispatcher even = req.getRequestDispatcher("even.jsp");
        
        
        if(requestCounter % 2 == 0)
            odd.forward(req, res);
        else
            even.forward(req, res);
    }
}
