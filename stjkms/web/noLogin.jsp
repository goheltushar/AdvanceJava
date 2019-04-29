<!DOCTYPE html>
<html>
    <head>
        <link
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            rel="stylesheet" id="bootstrap-css">
        <script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" crossorigin="anonymous"></script>

        <link rel="stylesheet"
              href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
        <meta name="viewport"
              content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">  


        <link href="${pageContext.request.contextPath}/admin/css/styles.css" rel="stylesheet">
        <meta charset="UTF-8">
        <title>SendSMS : STJKMS</title>
    </head>


    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card card-signin my-5">
                        <div class="card-body">
                            <h5 class="card-title text-center">Login Required !!!</h5>
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="error-template">
                                            <h2 class="card-title text-center">Oops!</h2>

                                            <div class="card-title text-center">
                                                Seems like you have not log in, Please Login First !!!
                                            </div>

                                            <a class="btn btn-lg btn-primary btn-block text-uppercase" href="${pageContext.request.contextPath}/login.jsp" role="button">Log In</a>
                                            <hr class="my-4">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>


