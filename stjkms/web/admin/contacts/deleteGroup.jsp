
<%@include file="../adminHeader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	


<script type="text/javascript">

    $(document).ready(function(){

    $("#deleteGroupModal").modal('show');

    });

</script>

<!-- deleteGroup Modal-->
<div class="modal fade" id="deleteGroupModal" tabindex="-1" role="dialog" aria-labelledby="deleteGroupModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteGroupLabel" class="">Delete Group</h5>

            </div>
            <div class="modal-body">

                <h4>

                    <c:catch var="catchException">
                        <sql:update dataSource="${con}"
                                    sql="delete from groups where group_id = ?">
                            <sql:param value="${param.group_id}" />
                        </sql:update>

                        <sql:update dataSource="${con}"
                                    sql="delete from groups_contacts where group_id = ?">
                            <sql:param value="${param.group_id}" />
                        </sql:update>
                    </c:catch>

                    <c:if test="${catchException != null}">
                        <p>
                            The exception is : ${catchException} <br /> There is an exception:
                            ${catchException.message}
                        </p>
                    </c:if>

                    <c:if test="${catchException == null}">
                        <p>Group with id : ${param.group_id} Deleted Successfully.....</p>
                    </c:if>

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