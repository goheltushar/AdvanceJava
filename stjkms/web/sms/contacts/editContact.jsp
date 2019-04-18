<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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
<title>SendSMS-STJKMS Login</title>
</head>


<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h5 class="card-title text-center">Edit Selected Contact</h5>
						<form class="form-signin" name="insertContact" action="processEditContact.jsp"
							method="post">
							
							<div class="form-label-group">
								<input type="text" name="id" id="id"
									class="form-control" value="${param.id}" readonly> <label for="id">ID :</label>
							</div>
							
							<div class="form-label-group">
								<input type="text" name="name" id="inputName"
									class="form-control" placeholder="Enter Name" required
									autofocus value="${param.name}"> <label for="inputName">Name :</label>
							</div>

							<div class="form-label-group">
								<input type="text" name="adjective" id="inputAdjective"
									class="form-control" placeholder="Adjective" required value="${param.adjective}"> <label
									for="inputPassword">Adjective :</label>
							</div>

							
							<div class="form-label-group">
								<input type="text" name="surname" id="inputSurname"
									class="form-control" placeholder="Enter Surname" required
									autofocus value="${param.surname}"> <label for="inputName">Surname :</label>
							</div>

							<div class="form-label-group">
								<input type="number" name="number" id="inputNumber"
									class="form-control" placeholder="Mobile" required value="${param.number}"> <label
									for="inputPassword">Mobile :</label>
							</div>
							
							<button class="btn btn-lg btn-primary btn-block text-uppercase"
								type="submit">Edit Contact</button>
							<hr class="my-4">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>