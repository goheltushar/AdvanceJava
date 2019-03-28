<%-- 
    Document   : processSendSMS
    Created on : 28 Mar, 2019, 12:21:49 PM
    Author     : administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>


<c:set var="prepend" value="Radhey Radhey " scope="session"/>
<c:set var="feedid" value="364413" scope="session"/>
<c:set var="senderid" value="STJKMS" scope="session"/>
<c:set var="username" value="9869422666" scope="session"/>
<c:set var="password" value="rkt@1401" scope="session"/>
<c:set var="To" value="9429912818" scope="session"/>
<c:set var="Text" value="${param.message}" scope="session" />


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


        <sql:setDataSource var = "snapshot" driver = "org.apache.derby.jdbc.ClientDriver"
                           url = "jdbc:derby://localhost:1527/HiberDB"
                           user = "gtushar"  password = "staff"/>


        <sql:query dataSource = "${snapshot}" var = "result">
            SELECT * from Test
        </sql:query>




        <c:forEach var = "row" items = "${result.rows}">

            <c:set var="message" value="${prepend}${row.Name} ${row.Adjective} ${Text}" />
            <c:out value="${message}" />
            <br>
            <c:import url="http://bulkpush.mytoday.com/BulkSms/SingleMsgApi" var="result">
                <c:param name="feedid" value="${feedid}" />
                <c:param name="senderid" value="${senderid}" />
                <c:param name="username" value="${username}" />
                <c:param name="password" value="${password}" />
                <c:param name="To" value="${row.Number}" />
                <c:param name="Text" value="${message}" />
            </c:import>
        </c:forEach>

    </body>
</html>
