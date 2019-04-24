<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


        <sql:setDataSource var="con" driver="com.mysql.jdbc.Driver"
                           url="${initParam.url}"
                           user="${initParam.user}" password="${initParam.password}" scope="session"/>

        <c:set var="uname" value="${param.username}" />

        <sql:query dataSource="${con}" sql="select * from users where username = ? and password = ?" var="result">
            <sql:param value="${uname}" />
            <sql:param value="${param.password}" />
        </sql:query>


        <c:if test="${result.rowCount == 1}" >
            <c:set var="username" value="${uname}" scope="session" />
            <c:if test="${username == 'admin'}" >
                <jsp:forward page="admin/aindex.jsp" />
            </c:if>

        </c:if>

        <jsp:forward page="failLogin.jsp" />
    </body>
</html>
