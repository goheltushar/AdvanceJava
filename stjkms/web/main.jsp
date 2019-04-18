
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
<link href="css/styles.css" rel="stylesheet">
<meta charset="UTF-8">
<title>SendSMS-STJKMS Login</title>



</head>
<body>
    
     <%
    String email = (String) session.getAttribute("email");
    if (null != email) { %>
    
    <jsp:include page="titleBar.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						
                                                <a class="btn btn-lg btn-primary btn-block text-uppercase" href="sms/contacts/insertContact.html" role="button">Insert Contact</a>
						<hr class="my-4">

                                                <a class="btn btn-lg btn-primary btn-block text-uppercase" href="sms/contacts/viewContacts.jsp" role="button">View Contacts</a>
						<hr class="my-4">

                                                <a class="btn btn-lg btn-primary btn-block text-uppercase" href="sms/message/enterMessage.html" role="button">Send Message</a>
						<hr class="my-4">
						
                                                <a class="btn btn-lg btn-primary btn-block text-uppercase" href="sms/reports/viewStatus.jsp" role="button">View Status</a>
						<hr class="my-4">

                                             						<hr class="my-4">
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<%        } else { %>
    <a class="btn btn-lg btn-primary btn-block text-uppercase" href="logout.jsp" role="button"> Please Login First ...</a>
    <%}
    %>
</html>