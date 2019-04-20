<%@include file="contactsHeader.jsp" %>
    

    <sql:update dataSource="${con}"
                sql="insert into contacts(Name,Adjective,Surname,Number) values(?,?,?,?)">

        <sql:param value="${param.name}" />
        <sql:param value="${param.adjective}" />
        <sql:param value="${param.surname}" />
        <sql:param value="${param.number}" />
    </sql:update>


    Record Inserted Successfully.....



</html>