
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Tutorial3_22 extends HttpServlet{

    boolean checkPrime(int n){
        for (int i = 2; i < n; i++) {
            if(n % i == 0)
                return false;
        }
        return true;
    }
    
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        
        int n1 = Integer.parseInt(req.getParameter("number1"));
        int n2 = Integer.parseInt(req.getParameter("number2"));
        
        int j=n1;
        while(j<=n2){
           if(checkPrime(j)) 
                out.println("<br>Prime : " + j);
           j++;
        }
        
    }
}
