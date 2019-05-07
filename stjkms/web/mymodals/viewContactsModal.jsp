

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

                
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>

