<%@include file="../adminHeader.jsp" %>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:query var="result" dataSource="${con}"
           sql="select * from ${contacts_table} order by Name" />



<c:set var="i" value="1" />

<div class="container">
    <div class="row">

    </div>
    <div class="row">
        <div class="card-body">
            <div class="table-responsive">
                <form method="post" action="addContactsToGroup.jsp" name="addContactsToGroup" id="addContactsToGroup">
                    <table class="table table-bordered" id="contactsTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th scope="col"><input type="checkbox" id="checkboxSelectAll"></th>
                                <th scope="col">#</th>
                                <th scope="col">Name</th>
                                <th scope="col">Mobile</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>

                        <tbody>




                            <c:forEach items="${result.rows}" var="row">
                                <tr>
                                    <td><input type="checkbox" id="contact" name="contact" value="${row.id}"></td>
                                    <th scope="row">${i}</th>
                                    <td>${row.Name} ${row.Surname}</td>
                                    <td>${row.Number}</td>
                                    <td>
                                        <a href="editContact.jsp?name=${row.Name}&adjective=${row.Adjective}&surname=${row.Surname}&number=${row.Number}&id=${row.id}" class="badge badge-primary">Edit</a>
                                        &nbsp;
                                        <a href="deleteContact.jsp?id=${row.id}" onclick="return confirm('Are You Sure to delete this record?')" class="badge badge-danger">Delete</a>
                                    </td>
                                </tr>
                                <c:set var="i" value="${i + 1 }" />
                            </c:forEach>


                        </tbody>
                    </table>

                    <hr>
                    <div class="row">
                        &nbsp;&nbsp;&nbsp;
                        <sql:query var="result" dataSource="${con}" sql="select * from groups" />

                        <div class="mx-auto" style="width: 300px;">
                            <select class="groups" name="group_id" id="dropdownSelectGroup">
                                <option selected value="0" disabled>Add Selected Contacts to Group</option>
                                <c:forEach items="${result.rows}" var="row">
                                    <option value="${row.group_id}">${row.group_name}</option>
                                </c:forEach>
                            </select>
                        </div>



                    </div>
                </form> 
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

    $("#checkboxSelectAll").click(function(){
    $('input:checkbox').not(this).prop('checked', this.checked);
    });

    $("select.groups").change(function(){

    var r = confirm("Are you Sure to Add these contacts to the group?");
    if (r == true) {
    $("#addContactsToGroup").submit(); 
    } 
    });

    });
</script>

</html>