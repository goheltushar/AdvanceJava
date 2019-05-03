

<%@include file="../admin/adminHeader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<script type="text/javascript">

    $(document).ready(function(){

    $("#viewContactsModal").modal('show');

    });

</script>

<div class="modal fade" id="viewContactsModal" tabindex="-1" role="dialog" aria-labelledby="viewContactsModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="viewContactsModalLabel">Select Group</h5>

            </div>
            <div class="modal-body">

                <form id="viewContacts" class="form-horizontal" action="${pageContext.request.contextPath}/admin/contacts/viewContacts.jsp" method="post">

                    <sql:query var="result" dataSource="${con}" sql="select * from groups" />

                    <div class="form-label-group">

                        <select class="browser-default custom-select" name="group">
                            <option selected value="0">Select Group</option>
                            <c:forEach items="${result.rows}" var="row">
                                <option value="${row.group_id}">${row.group_name}</option>
                            </c:forEach>

                        </select>
                    </div>

                    <div class="form-group">

                        <div class="col-sm-10">
                            <input type="submit" class="form-control" 
                                   id="submit" name ="submit" value="View Contacts" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>

