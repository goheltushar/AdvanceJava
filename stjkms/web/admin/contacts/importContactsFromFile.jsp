<%@include file="../adminHeader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	



<script type="text/javascript">

    $(document).ready(function(){

    $("#importContactsFromFileModal").modal('show');

    });

</script>

<!-- deleteCampaigns Modal-->
<div class="modal fade" id="importContactsFromFileModal" tabindex="-1" role="dialog" aria-labelledby="importContactsFromFileModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="importContactsFromFileModalLabel" class="">Upload File</h5>

            </div>
            <div class="modal-body">

                <h3>


                    
                    Select a CSV file: <br /><br/ >
                        <form action="processImportContactsFromFile.jsp" method="post"
                          enctype="multipart/form-data">
                        <input type="file" name="file" size="50" required/>
                        <br />
                        <br />
                        <input type="submit" value="Upload File" />
                    </form>
                </h3>
                <br>


            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Dismiss</button>

            </div>
        </div>
    </div>
</div>    


</html>