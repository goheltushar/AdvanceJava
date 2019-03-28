<%-- 
    Document   : SendSMS
    Created on : 28 Mar, 2019, 12:18:44 PM
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

        <form method="get" action="processSendSMS.jsp">

            <table>
                <tr>
                    <td> Enter Message : </td>
                    <td> <input type="text" name="message" placeholder="Enter Your Message Here !!!" value="${Text}"/></td>
                    <td> <input type="Submit" name="Submit" value="Submit" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
