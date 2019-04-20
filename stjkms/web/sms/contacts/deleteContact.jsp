
<jsp:include page="contactsHeader.jsp" />

<sql:setDataSource var="con" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/stjkms"
                   user="root" password="Kripalu@1008" />


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