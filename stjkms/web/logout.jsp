<%-- 
    Document   : logout
    Created on : 18 Apr, 2019, 1:33:48 PM
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
            session.removeAttribute("email");
            session.invalidate();
            response.sendRedirect("index.html");
        %>
        
        
    </body>
</html>
