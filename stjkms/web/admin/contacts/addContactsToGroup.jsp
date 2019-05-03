<%@include file="../adminHeader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:forEach items="${paramValues.contact}" var="contact_id">
    <sql:update dataSource="${con}"
                sql="insert into groups_contacts(group_id,contacts_id) values(?,?)">
    <sql:param value="${param.group_id}" />
    <sql:param value="${contact_id}" />
  
</sql:update>
    Contact ${contact_id} Added Successfully to Group ${param.group_id}....
    <br>
</c:forEach>






</html>