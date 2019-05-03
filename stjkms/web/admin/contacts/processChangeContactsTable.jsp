<%@include file="../adminHeader.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<c:set var="contacts_table" value="${param.table}" scope="session" />

<script type="text/javascript">

    $(document).ready(function(){

    $("#processChangeContactsTableModal").modal('show');

    });

</script>

<!-- processChangeContactsTable Modal-->
<div class="modal fade" id="processChangeContactsTableModal" tabindex="-1" role="dialog" aria-labelledby="processChangeContactsTableModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="processChangeContactsTableModalLabel" class="">Success</h5>

            </div>
            <div class="modal-body">

                <h4>Contacts Table Has Been Changed </h4>
                <br>
                <button type="button" class="btn btn-primary">
                    Current Table <span class="badge badge-light">${contacts_table}</span>
                </button>

            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal" onclick="window.location.href='${pageContext.request.contextPath}/admin/contacts/viewContacts.jsp';">Dismiss</button>

            </div>
        </div>
    </div>
</div>