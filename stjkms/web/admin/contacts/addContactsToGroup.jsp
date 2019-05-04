<%@include file="../adminHeader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">

    $(document).ready(function(){

    $("#addContactsToGroupModal").modal('show');

    });

</script>

<!-- deleteCampaigns Modal-->
<div class="modal fade" id="addContactsToGroupModal" tabindex="-1" role="dialog" aria-labelledby="addContactsToGroupModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addContactsToGroupModalLabel" class="">Success</h5>

            </div>
            <div class="modal-body">

                <h4>


                    <c:forEach items="${paramValues.contact}" var="contact_id">

                        <sql:query dataSource="${con}" sql="select * from groups_contacts where group_id = ? and contacts_id = ?" var="result" >
                            <sql:param value="${param.group_id}" />
                            <sql:param value="${contact_id}" />
                        </sql:query>


                        <c:if test="${result.rowCount == 0}">
                            <sql:update dataSource="${con}"
                                        sql="insert into groups_contacts(group_id,contacts_id) values(?,?)">
                                <sql:param value="${param.group_id}" />
                                <sql:param value="${contact_id}" />

                            </sql:update>
                            Contact ${contact_id} Added Successfully to Group ${param.group_id}....
                        </c:if>


                        <c:if test="${result.rowCount > 0}">
                            Contact ${contact_id} is Already present in the Group ${param.group_id}....
                        </c:if>

                        <br>
                    </c:forEach>
                </h4>
                <br>


            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal" onclick="window.location.href='${pageContext.request.contextPath}/admin/contacts/viewContacts.jsp';">Dismiss</button>

            </div>
        </div>
    </div>
</div>    

</html>









</html>