<%@include file="messageHeader.jsp" %>

<sql:query var="result" dataSource="${con}"
           sql="select * from contacts order by Name" />

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

</html>