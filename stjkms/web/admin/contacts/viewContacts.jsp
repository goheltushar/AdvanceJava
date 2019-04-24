<%@include file="../adminHeader.jsp" %>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:query var="result" dataSource="${con}"
           sql="select * from ${initParam.contacts_table} order by Name" />

<c:set var="i" value="1" />

<div class="container">
    <div class="row">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="contactsTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Name</th>
                            <th scope="col">Mobile</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>

                    <tbody>

                        <c:forEach items="${result.rows}" var="row">

                            <tr>
                                <th scope="row">${i}</th>
                                <td>${row.Name} ${row.Surname}</td>
                                <td>${row.Number}</td>
                                <td>
                                    <a href="editContact.jsp?name=${row.Name}&adjective=${row.Adjective}&surname=${row.Surname}&number=${row.Number}&id=${row.id}">E</a>
                                    <a href="deleteContact.jsp?id=${row.id}" onclick="return confirm('Are You Sure to delete this record?')"> D</a>
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