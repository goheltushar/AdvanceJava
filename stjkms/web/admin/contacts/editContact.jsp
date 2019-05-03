<%@include file="../adminHeader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	

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


                            <sql:query var="result" dataSource="${con}" sql="select * from groups" />

                            <div class="form-label-group">

                                <select class="browser-default custom-select" name="group">
                                    <option selected value="0">Select Group</option>
                                    <c:forEach items="${result.rows}" var="row">
                                        <option value="${row.group_id}">${row.group_name}</option>
                                    </c:forEach>

                                </select>
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