<%@include file="../adminHeader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>



<script type="text/javascript">

    $(document).ready(function(){

    $("#processInsertContactModal").modal('show');

    });

</script>

<!-- processInsertContact Modal-->
<div class="modal fade" id="processInsertContactModal" tabindex="-1" role="dialog" aria-labelledby="processInsertContactModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="processInsertContactModalLabel" class="">Insert Contact</h5>

            </div>
            <div class="modal-body">

                <h4>

                    <sql:update dataSource="${con}"
                                sql="insert into ${contacts_table}(Name,Adjective,Surname,Number) values(?,?,?,?)">

                        <sql:param value="${param.name}" />
                        <sql:param value="${param.adjective}" />
                        <sql:param value="${param.surname}" />
                        <sql:param value="${param.number}" />

                    </sql:update>


                    Contact Inserted Successfully.....

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