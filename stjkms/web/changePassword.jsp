<%@include file="admin/adminHeader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<script type="text/javascript">

    $(document).ready(function(){

    $("#processChangePasswordModal").modal('show');

    });

</script>

<!-- changePassword Modal-->
<div class="modal fade" id="processChangePasswordModal" tabindex="-1" role="dialog" aria-labelledby="processChangePasswordModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="processChangePasswordModalLabel" class="">Change Password</h5>

            </div>
            <div class="modal-body">

                <h2>
                    <c:set var="currentpwd"  value="${param.current}" />
                    <c:set var="newpwd"  value="${param.password}" />
                    <c:set var="confirmpwd"  value="${param.confirmPassword}" />

                    <c:if test="${currentpwd == password}">

                        <c:if test="${newpwd == confirmpwd}">

                            <sql:update dataSource="${con}"
                                        sql="update users set password = ? where username = ?">
                                <sql:param value="${newpwd}" />
                                <sql:param value="${username}" />
                            </sql:update>
                            <c:set var="password" value="${newpwd}" scope="session" />
                            Password Changed Successfully ....
                        </c:if>
                    </c:if>
                </h2>
                <br>


            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal" onclick="window.location.href='${pageContext.request.contextPath}/logout.jsp';">Login Again</button>

            </div>
        </div>
    </div>
</div>