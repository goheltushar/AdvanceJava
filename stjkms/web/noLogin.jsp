<!DOCTYPE html>
<html>
    <head>

        <link
            href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            rel="stylesheet" id="bootstrap-css">
        <script
        src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script
        src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet"
              href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
        <meta name="viewport"
              content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">

        <link rel="stylesheet"
              href="css/styles.css">

        <meta charset="UTF-8">
        <title>SendSMS-STJKMS Login</title>
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
                                            
                                             <a class="btn btn-lg btn-primary btn-block text-uppercase" href=<%=getServletContext().getContextPath() + "/index.html"%> role="button">Log In</a>
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


