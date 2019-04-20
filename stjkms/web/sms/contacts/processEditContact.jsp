<jsp:include page="contactsHeader.jsp" />

 <sql:setDataSource var="con" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/stjkms"
                       user="root" password="Kripalu@1008" />
	
	
<c:catch var="catchException">
	<sql:update dataSource="${con}"
		sql="update contacts set Name = ?,Adjective = ?, Surname = ?, Number = ? where id = ?">
		<sql:param value="${param.name}" />
		<sql:param value="${param.adjective}" />
		<sql:param value="${param.surname}" />
		<sql:param value="${param.number}" />
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
	<p>Record Edited Successfully.....</p>
</c:if>

  

</html>