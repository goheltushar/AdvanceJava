<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
        <link href="../../css/styles.css" rel="stylesheet">
        <meta charset="UTF-8">
        <title>successLogin</title>

        <script>
            window.onload = function () {
                setTimeout(loadAfterTime, 5000)
            };

            function loadAfterTime() {
                window.location.replace("../../logout.jsp");
            }
        </script>

    </head>
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
</html>