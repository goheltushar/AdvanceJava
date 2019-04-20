<jsp:include page="messageHeader.jsp" />

<body>

    <div class="alert alert-success" role="alert">
        <button type="button" class="close" data-dismiss="alert"
                aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <strong>Success!</strong> Messages has been send Successfully !!! Soon
        You will be automatically Log Out!!!
    </div>
</body>
<script>
    window.onload = function () {
        setTimeout(loadAfterTime, 5000)
    };

    function loadAfterTime() {
        window.location.replace("../../logout.jsp");
    }
</script>
</html>