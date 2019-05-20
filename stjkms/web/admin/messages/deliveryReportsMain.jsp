<%@include file="../adminHeader.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:query var="result" dataSource="${con}"
           sql="select * from campaigns order by sent_date" />

<c:set var="i" value="1"/>

<div class="container">
    <div class="row">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="campaignsTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Group ID</th>
                            <th scope="col">Sent Date</th>
                            <th scope="col">Campaign ID</th>
                            <th scope="col">Message</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>

                    <tbody>

                        <c:forEach items="${result.rows}" var="row">

                            <tr>
                                <th scope="row">${i}</th>
                                <td>${row.group_id}</td>
                                <td>${row.sent_date}</td>
                                <td>${row.campaignid}</td>
                                <td>${row.Message}</td>
                                <td>
                                    <a href="viewStatus_1.jsp?sent_date=${row.sent_date}&Message=${row.Message}&campaignid=${row.campaignid}" class="badge badge-primary">Report</a>
                                    &nbsp;
                                    <a href="deleteCampaigns.jsp?campaignid=${row.campaignid}" onclick="return confirm('Are You Sure to delete this campaign?')" class="badge badge-danger">Delete</a>
                                </td>
                            </tr>
                            <c:set var="i" value="${i + 1 }" />
                        </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>


<script src="${pageContext.request.contextPath}/admin/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="${pageContext.request.contextPath}/admin/js/demo/datatables-demo.js"></script>
<link href="${pageContext.request.contextPath}/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<script>
                                        $(document).ready(function () {
                                            $('#contactsTable').DataTable();
                                        });
</script>

</html>