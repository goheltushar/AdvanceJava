<%@include file="../adminHeader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:update dataSource="${con}"
            sql="insert into groups(group_name,remarks) values(?,?)">
    <sql:param value="${param.name}" />
    <sql:param value="${param.remarks}" />
  
</sql:update>


Group Added Successfully....

</html>