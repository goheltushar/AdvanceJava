<%@include file="../adminHeader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	



<script type="text/javascript">

    $(document).ready(function(){

    $("#processEditContactModal").modal('show');

    });

</script>

<!-- processEditContact Modal-->
<div class="modal fade" id="processEditContactModal" tabindex="-1" role="dialog" aria-labelledby="processEditContactModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="processEditContactModalLabel" class="">Edit Contact</h5>

            </div>
            <div class="modal-body">

                <h4>

                    <c:catch var="catchException">
                        <sql:update dataSource="${con}"
                                    sql="update ${contacts_table} set Name = ?,Adjective = ?, Surname = ?, Number = ? where id = ?">
                            <sql:param value="${param.name}" />
                            <sql:param value="${param.adjective}" />
                            <sql:param value="${param.surname}" />
                            <sql:param value="${param.number}" />

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
                        <p>Contact Edited Successfully.....</p>
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