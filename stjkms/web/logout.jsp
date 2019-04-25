<%-- 
    Document   : logout
    Created on : 18 Apr, 2019, 1:33:48 PM
    Author     : administrator
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:remove var="username" scope="session" />
        
        <%
            session.invalidate();
            response.sendRedirect(getServletContext().getContextPath() + "/login.jsp");
        %>
        
        
    </body>
</html>
