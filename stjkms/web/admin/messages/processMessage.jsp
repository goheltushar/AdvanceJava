<%@include file="../adminHeader.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	


<c:if test="${param.pin == initParam.pin}" >
    

<sql:query var="result" dataSource="${con}"
           sql="select * from ${initParam.contacts_table} order by Name" />



<c:forEach items="${result.rows}" var="row">
    <c:import url="http://bulkpush.mytoday.com/BulkSms/SingleMsgApi"
              var="result">
        <c:param name="feedid" value="364413" />
        <c:param name="senderid" value="STJKMS" />
        <c:param name="username" value="9869422666" />
        <c:param name="password" value="rkt@1401" />
        <c:param name="To" value="${row.Number}" />
        <c:param name="Text"
                 value="Radhey Radhey ${row.Name} ${row.Adjective} ${param.inputmessage}" />
    </c:import>
</c:forEach>



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