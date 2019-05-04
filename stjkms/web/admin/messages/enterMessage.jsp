<%@include file="../adminHeader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body>

    <div class="container">
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                <div class="card card-signin my-5">
                    <div class="card-body">
                        <h5 class="card-title text-center">Enter Message</h5>
                        <form class="form-signin" name="enterMessage"
                              action="processMessage.jsp" method="post"
                              id="myFormEnterMessage">


                            <sql:query var="result" dataSource="${con}" sql="select * from groups" />

                            <div class="form-label-group">

                                <select class="browser-default custom-select" name="group_id" required>
                                    <option disabled value="0">Select Group</option>
                                    <c:forEach items="${result.rows}" var="row">
                                        <option value="${row.group_id}">${row.group_name}</option>
                                    </c:forEach>

                                </select>
                            </div>
                                    <br>

                            <div class="form-label-group">
                                <textarea name="inputmessage" id="inputMessage"
                                          class="form-control" required rows="5" autofocus="autofocus"></textarea>
                            </div>

                            <div class="form-label-group">
                                <div class="multiselect">

                                    <div id="checkboxes">
                                        <label for="one"> <input type="checkbox" id="one" />Thursday
                                        </label> <label for="two"> <input type="checkbox" id="two" />Sunday
                                        </label> <label for="three"> <input type="checkbox" id="three" />Ekadashi
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <input type="hidden" name="pin" id="myPin" value="PIN"/> 
                        </form>

                        <button class="btn btn-lg btn-primary btn-block text-uppercase"
                                id="myBtnPSO">Preview & Send OTP</button>
                        <hr class="my-4">

                    </div>
                </div>
            </div>
        </div>
    </div>




    <!-- .modal -->
    <div class="modal fade" id="myBtnPSOModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Preview</h4>                                                             
                </div> 
                <div class="modal-body">
                    <div id="messageDiv"></div>
                    <hr>
                    <button type="button" class="btn btn-success" id="myBtnSendOtp">Send OTP</button>
                    <button type="button" class="btn btn-primary" id="myBtnEnterPin">Enter Pin</button>
                </div>   
                <div class="modal-footer">
                    <button type="button" class="btn btn-info"  data-dismiss="modal">Close</button>                               
                </div>
            </div>                                                                       
        </div>                                          
    </div>

</body>

<script type="text/javascript">


    $(document)
    .ready(
    function () {

    $('#myBtnEnterPin').click(function () {
    var inputpin = prompt("Please enter PIN");
    if(inputpin != ''){
    $('#myPin').val(inputpin)
    $("#myFormEnterMessage").submit(); 
    }

    });


    $('#myBtnSendOtp').click(function () {
    var otp = Math.floor((Math.random() * 10000) + 1);
    var xhr = new XMLHttpRequest();
    xhr
    .open(
    'GET',
    'http://bulkpush.mytoday.com/BulkSms/SingleMsgApi?feedid=364413&username=9869422666&password=rkt@1401&To=9979485474&Text=Radhey Radhey '
    + otp, true);
    xhr.send();

    var i;
    var validOTP = false;
    for (i = 1; i <= 3; i++) {
    var inputotp = prompt("Please enter OTP : Attempt (" + i + ")",
    "OTP");
    //alert(otp);
    if (inputotp != otp) {
    alert('OTP is Not Valid...')
    } else {
    validOTP = true;
    $('#myPin').val("OTP")
    $("#myFormEnterMessage").submit();
    break;
    }
    }

    if (validOTP == false){
    alert('You have Entered Invalid OTP For Three Times...')
    window.location.replace("../../logout.jsp");
    return false;
    }
    });

    $('#myBtnPSO').click(function () {
    if ($('#inputMessage').val() != '') {
    $('#messageDiv').text($('#inputMessage').val())
    $('#myBtnPSOModal').modal('show')
    }
    });

    $('#one')
    .change(
    function () {
    $("#inputMessage")
    .val(
    'Aaj Thursday Ka Regular Kirtan Hasmukhbhai Ke Ghar Sham 7pm se 9pm tak hoga.');
    });

    $('#two')
    .change(
    function () {
    $("#inputMessage")
    .val(
    'Kal Sunday Ka Regular Kirtan Meera Mandir Me Subah 9am se 12:15pm tak hoga.');
    });

    $('#three')
    .change(
    function () {
    $("#inputMessage")
    .val(
    'Aaj Ekadashi Ka Kirtan Anuragbhai Ke Ghar Sham 7pm se 10pm tak hoga.');
    });

    });
</script>


</html>