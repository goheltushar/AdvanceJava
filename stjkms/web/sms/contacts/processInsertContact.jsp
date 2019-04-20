<jsp:include page="contactsHeader.jsp" />

   

    <sql:setDataSource var="con" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/stjkms"
                       user="root" password="Kripalu@1008" />

    <sql:update dataSource="${con}"
                sql="insert into contacts(Name,Adjective,Surname,Number) values(?,?,?,?)">

        <sql:param value="${param.name}" />
        <sql:param value="${param.adjective}" />
        <sql:param value="${param.surname}" />
        <sql:param value="${param.number}" />
    </sql:update>


    Record Inserted Successfully.....



</html>