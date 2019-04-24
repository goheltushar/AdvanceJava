
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="con" driver="com.mysql.jdbc.Driver"
                           url="${initParam.url}"
                           user="${initParam.user}" password="${initParam.password}"/>

<sql:update dataSource="${con}"
            sql="insert into users(username,password,firstname,lastname,email,mobile) values(?,?,?,?,?,?)">
    <sql:param value="${param.username}" />
    <sql:param value="${param.password}" />
    <sql:param value="${param.firstname}" />
    <sql:param value="${param.lastname}" />
    <sql:param value="${param.email}" />
    <sql:param value="${param.mobile}" />
</sql:update>


User Created Successfully ....



</html>