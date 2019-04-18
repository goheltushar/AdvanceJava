<%-- 
    Document   : processLogin.jsp
    Created on : 18 Apr, 2019, 1:01:51 PM
    Author     : administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            String email = (String) session.getAttribute("email");
            if (null == email) {
                if (request.getParameter("email").equals("goheltushar1401@gmail.com")
                        && request.getParameter("password").equals("stjkms")) {
                    session.setAttribute("email", "goheltushar1401@gmail.com");
                    RequestDispatcher rd = request.getRequestDispatcher("main.html");
                    rd.forward(request, response);
                }else{
                    RequestDispatcher rd = request.getRequestDispatcher("index.html");
                    rd.forward(request, response);
                }
            }else{
                RequestDispatcher rd = request.getRequestDispatcher("main.html");
                    rd.forward(request, response);
            }

        %>

    </body>
</html>
