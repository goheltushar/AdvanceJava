<%@include file="../adminHeader.jsp" %>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:query var="result" dataSource="${con}"
           sql="select * from groups" />


<div class="container">
    <div class="row">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="groupsTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th scope="col">Group ID</th>
                            <th scope="col">Name</th>
                            <th scope="col">Remarks</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>

                    <tbody>

                        <c:forEach items="${result.rows}" var="row">

                            <tr>
                                <th scope="row">${row.group_id}</th>
                                <td>${row.group_name}</td>
                                <td>${row.remarks}</td>
                                <td>
                                    <a href="deleteGroup.jsp?group_id=${row.group_id}" onclick="return confirm('Are You Sure to delete this record?')" class="badge badge-danger">Delete</a>
                                </td>
                            </tr>
                           
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
    $('#groupsTable').DataTable();
    });
</script>

</html>