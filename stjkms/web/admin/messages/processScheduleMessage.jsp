<%@include file="../adminHeader.jsp" %>


<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<c:set var = "now" value="<%= new java.util.Date()%>" />
<sql:query var="result" dataSource="${con}"
           sql="select * from ${contacts_table} where group_id = ? order by Name" >
    <sql:param  value="${param.group}" />
</sql:query>

<c:set var="proceed" value="no" />
<c:set value="${fn:substring(param.time,0,4)}" var="yyyy" />
<c:set value="${fn:substring(param.time,4,6)}" var="MM" />
<c:set value="${fn:substring(param.time,6,8)}" var="DD" />
<c:set value="${yyyy}-${MM}-${DD}" var="sent_date" />


<c:set var="proceed" value="no" />

<c:if test="${param.pin == 'OTP'}" >
    <c:set var="proceed" value="yes" />
</c:if>

<c:if test="${param.pin == initParam.pin}" >
    <c:set var="proceed" value="yes" />
</c:if>

<c:if test="${proceed == 'yes'}">

    <c:forEach items="${result.rows}" var="row">
        <c:import url="http://bulkpush.mytoday.com/BulkSms/SingleMsgApi"
                  var="result">
            <c:param name="feedid" value="364413" />
            <c:param name="senderid" value="STJKMS" />
            <c:param name="username" value="9869422666" />
            <c:param name="password" value="rkt@1401" />
            <c:param name="time" value="${param.time}" />
            <c:param name="To" value="${row.Number}" />
            <c:param name="Text"
                     value="Radhey Radhey ${row.Name} ${row.Adjective} ${param.inputmessage}" />
        </c:import>
    </c:forEach>

    <sql:update dataSource="${con}" sql="insert into campaigns(Message,sent_date) values(?,?)">
        <sql:param value="${param.inputmessage}" />
        <sql:param value="${sent_date}" />
    </sql:update>

    <div class="alert alert-success" role="alert">
        <button type="button" class="close" data-dismiss="alert"
                aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <strong>Success!</strong> Messages has been Submitted Successfully !!! 
    </div>

</c:if>

<c:if test="${param.pin != initParam.pin}" >
    <div class="alert alert-danger" role="alert">
        <button type="button" class="close" data-dismiss="alert"
                aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <strong>Failure!</strong> Messages has not been Submitted due to wrong PIN !!! 
    </div>

</c:if>



</html>

