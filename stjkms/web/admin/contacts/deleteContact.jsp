
<%@include file="../adminHeader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	




<script type="text/javascript">

    $(document).ready(function(){

    $("#deleteContactModal").modal('show');

    });

</script>

<!-- deleteContact Modal-->
<div class="modal fade" id="deleteContactModal" tabindex="-1" role="dialog" aria-labelledby="deleteContactModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteContactModalLabel" class="">Delete Contact</h5>

            </div>
            <div class="modal-body">

                <h4>

                    <c:catch var="catchException">
                        <sql:update dataSource="${con}"
                                    sql="delete from ${contacts_table} where id = ?">
                            <sql:param value="${param.id}" />
                        </sql:update>
                        
                         <sql:update dataSource="${con}"
                                    sql="delete from groups_contacts where contacts_id = ?">
                            <sql:param value="${param.id}" />
                        </sql:update>
                    </c:catch>

                    <c:if test="${catchException != null}">
                        <p>
                            The exception is : ${catchException} <br /> There is an exception:
                            ${catchException.message}
                        </p>
                    </c:if>

                    <c:if test="${catchException == null}">
                        <p>Contact with id : ${param.id} is Deleted Successfully.....</p>
                    </c:if>

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

