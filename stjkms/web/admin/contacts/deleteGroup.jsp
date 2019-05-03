
<%@include file="../adminHeader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	

<c:catch var="catchException">
    <sql:update dataSource="${con}"
                sql="delete from groups where group_id = ?">
        <sql:param value="${param.group_id}" />
    </sql:update>
    
    <sql:update dataSource="${con}"
                sql="update ${contacts_table} set group_id = 0 where group_id = ?">
        <sql:param value="${param.group_id}" />
    </sql:update>
</c:catch>

<c:if test="${catchException != null}">
    <p>
        The exception is : ${catchException} <br /> There is an exception:
        ${catchException.message}
    </p>
</c:if>

<c:if test="${catchException == null}">
    <p>Record Deleted Successfully.....</p>
</c:if>

</html>