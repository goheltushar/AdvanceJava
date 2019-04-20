<!DOCTYPE html>
<html>
    <%@include file="header.html" %>


    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card card-signin my-5">
                        <div class="card-body">
                            <h5 class="card-title text-center">Login Failed !!!</h5>
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="error-template">
                                            <h2 class="card-title text-center">Oops!</h2>

                                            <div class="card-title text-center">
                                                Seems like you have Entered Wrong Credentials, Please Try Again !!!
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


