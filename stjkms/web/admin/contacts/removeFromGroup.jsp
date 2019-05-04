
<%@include file="../adminHeader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	


    <sql:update dataSource="${con}"
                sql="delete from groups_contacts where group_id = ? and contacts_id = ?">
        <sql:param value="${param.group_id}" />
        <sql:param value="${param.contacts_id}" />
    </sql:update>





<script type="text/javascript">

    $(document).ready(function(){

    $("#removeFromGroupModal").modal('show');

    });

</script>

<!-- deleteCampaigns Modal-->
<div class="modal fade" id="removeFromGroupModal" tabindex="-1" role="dialog" aria-labelledby="removeFromGroupModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="removeFromGroupModalLabel" class="">Success</h5>

            </div>
            <div class="modal-body">

                <h4>
                                       
                   
                        <p>Contact ${param.contacts_id} Removed Successfully from Group ${param.group_name}.....</p>
                 </h4>
                <br>


            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal" onclick="window.location.href='${pageContext.request.contextPath}/admin/contacts/manageGroupContacts.jsp?group_id=${param.group_id}&group_name=${param.group_name}';">Dismiss</button>

            </div>
        </div>
    </div>
</div>    

</html>