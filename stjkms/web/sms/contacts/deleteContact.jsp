
<%@include file="contactsHeader.jsp" %>


<c:catch var="catchException">
    <sql:update dataSource="${con}"
                sql="delete from contacts where id = ?">
        <sql:param value="${param.id}" />
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