<%@include file="../adminHeader.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var = "now" value="<%= new java.util.Date()%>" />
<c:set var = "campaignid" value="<%= new java.util.Date().getTime()%>" />

<sql:query var="result" dataSource="${con}"
           sql="select * from ${contacts_table} as c,groups_contacts as g where c.id=g.contacts_id and g.group_id = ?">
    <sql:param value="${param.group_id}" />
</sql:query>

<c:set var="proceed" value="no" />

<c:if test="${param.pin == 'OTP'}" >
    <c:set var="proceed" value="yes" />
</c:if>

<c:if test="${param.pin == initParam.pin}" >
    <c:set var="proceed" value="yes" />
</c:if>

<c:if test="${proceed == 'yes'}">
    <sql:update dataSource="${con}" sql="insert into campaigns(campaignid,Message,sent_date,group_id) values(?,?,?,?)">
        <sql:param value="${campaignid}" />
        <sql:param value="${param.inputmessage}" />
        <sql:param>
            <fmt:formatDate pattern="yyyy-MM-dd" value="${now}"/>
        </sql:param>
        <sql:param  value="${param.group_id}" />
    </sql:update>

    <c:set var="after" value="='" />
    <c:set var="before" value="'>" />

    <c:if test="${param.anonymous == 'anonymous'}">
        <c:forEach items="${result.rows}" var="row">
            <c:import url="http://bulkpush.mytoday.com/BulkSms/SingleMsgApi"
                      var="result">
                <c:param name="feedid" value="${initParam.feedid}" />
                <c:param name="senderid" value="${initParam.senderid}" />
                <c:param name="username" value="${initParam.apiusername}" />
                <c:param name="password" value="${initParam.apipassword}" />
                <c:param name="To" value="${row.Number}" />
                <c:param name="Text"
                         value="Radhey Radhey ${param.inputmessage}" />
            </c:import>

            <c:set var="result"
                   value="${fn:substringAfter(result,after)}" />
            <c:set var="result"
                   value="${fn:substringBefore(result,before)}" />

            <sql:update dataSource="${con}" sql="insert into campaigns_status(campaignid,requestid) values(?,?)" >
                <sql:param value="${campaignid}" />
                <sql:param value="${result}" />
            </sql:update>


        </c:forEach>
    </c:if>

    <c:if test="${param.anonymous == 'withnames'}">
        <c:forEach items="${result.rows}" var="row">
            <c:import url="http://bulkpush.mytoday.com/BulkSms/SingleMsgApi"
                      var="result">
                <c:param name="feedid" value="${initParam.feedid}" />
                <c:param name="senderid" value="${initParam.senderid}" />
                <c:param name="username" value="${initParam.apiusername}" />
                <c:param name="password" value="${initParam.apipassword}" />
                <c:param name="To" value="${row.Number}" />
                <c:param name="Text"
                         value="Radhey Radhey ${row.Name} ${row.Adjective} ${param.inputmessage}" />
            </c:import>

            <c:set var="result"
                   value="${fn:substringAfter(result,after)}" />
            <c:set var="result"
                   value="${fn:substringBefore(result,before)}" />

            <sql:update dataSource="${con}" sql="insert into campaigns_status(campaignid,requestid) values(?,?)" >
                <sql:param value="${campaignid}" />
                <sql:param value="${result}" />
            </sql:update>


        </c:forEach>
    </c:if>



    <div class="alert alert-success" role="alert">
        <button type="button" class="close" data-dismiss="alert"
                aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <strong>Success!</strong> Messages has been Submitted Successfully !!! 
    </div>

</c:if>

<c:if test="${proceed == 'no'}">
    <div class="alert alert-danger" role="alert">
        <button type="button" class="close" data-dismiss="alert"
                aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <strong>Failure!</strong> Messages has not been Submitted!!! 
    </div>

</c:if>



</html>