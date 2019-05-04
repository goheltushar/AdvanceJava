<%@include file="../adminHeader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>



<script type="text/javascript">

    $(document).ready(function(){

    $("#processAddGroupModal").modal('show');

    });

</script>

<!-- processAddGroup Modal-->
<div class="modal fade" id="processAddGroupModal" tabindex="-1" role="dialog" aria-labelledby="processAddGroupModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="processAddGroupModalLabel" class="">Add Group</h5>

            </div>
            <div class="modal-body">

                <h4>

                    <sql:update dataSource="${con}"
                                sql="insert into groups(group_name,remarks) values(?,?)">
                        <sql:param value="${param.name}" />
                        <sql:param value="${param.remarks}" />

                    </sql:update>


                    Group ${param.name} Added Successfully....

                </h4>
                <br>


            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal" onclick="window.location.href='${pageContext.request.contextPath}/admin/contacts/manageGroups.jsp';">Dismiss</button>

            </div>
        </div>
    </div>
</div>    

</html>