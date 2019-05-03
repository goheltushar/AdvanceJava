<%@include file="../adminHeader.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>



<sql:update dataSource="${con}" sql="delete from campaigns_status where campaignid = ?">
    <sql:param value="${param.campaignid}" />
</sql:update>

<sql:update dataSource="${con}" sql="delete from campaigns where campaignid = ?">
    <sql:param value="${param.campaignid}" />
</sql:update>

<script type="text/javascript">

    $(document).ready(function(){

    $("#deleteCampaignsModal").modal('show');

    });

</script>

<!-- deleteCampaigns Modal-->
<div class="modal fade" id="deleteCampaignsModal" tabindex="-1" role="dialog" aria-labelledby="deleteCampaignsModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteCampaignsModalLabel" class="">Success</h5>

            </div>
            <div class="modal-body">

                <h4>Campaign with campaignid : ${param.campaignid} is deleted succesfully...</h4>
                <br>
                

            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal" onclick="window.location.href='${pageContext.request.contextPath}/admin/messages/deliveryReportsMain.jsp';">Dismiss</button>

            </div>
        </div>
    </div>
</div>