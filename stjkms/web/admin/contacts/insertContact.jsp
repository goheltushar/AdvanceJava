<%@include file="../adminHeader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                <div class="card card-signin my-5">
                    <div class="card-body">
                        <h5 class="card-title text-center">Insert New Contact</h5>
                        <form class="form-signin" name="insertContact" action="processInsertContact.jsp"
                              method="post">

                            <div class="form-label-group">
                                <input type="text" name="name" id="inputName"
                                       class="form-control" placeholder="Enter Name" required
                                       autofocus> <label for="inputName">Name :</label>
                            </div>

                            <div class="form-label-group">
                                <input type="text" name="adjective" id="inputAdjective"
                                       class="form-control" placeholder="Adjective" required> <label
                                       for="inputPassword">Adjective :</label>
                            </div>


                            <div class="form-label-group">
                                <input type="text" name="surname" id="inputSurname"
                                       class="form-control" placeholder="Enter Surname" required
                                       autofocus> <label for="inputName">Surname :</label>
                            </div>

                            <div class="form-label-group">
                                <input type="number" name="number" id="inputNumber"
                                       class="form-control" placeholder="Mobile" required> <label
                                       for="inputNumber">Mobile :</label>
                            </div>

                           
                            

                            <button class="btn btn-lg btn-primary btn-block text-uppercase"
                                    type="submit">Insert Contact</button>
                            <hr class="my-4">



                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>