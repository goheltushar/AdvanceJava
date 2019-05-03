<%@include file="../adminHeader.jsp" %>



<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                <div class="card card-signin my-5">
                    <div class="card-body">
                        <h5 class="card-title text-center">Add New Group</h5>
                        <form class="form-signin" name="insertContact" action="processAddGroup.jsp"
                              method="post">

                            <div class="form-label-group">
                                <input type="text" name="name" id="inputName"
                                       class="form-control" placeholder="Enter Group Name" required
                                       autofocus> <label for="inputName">Name :</label>
                            </div>

                            <div class="form-label-group">
                                <input type="text" name="remarks" id="inputRemarks"
                                       class="form-control" placeholder="Remarks" required> <label
                                       for="inputRemarks">Remarks :</label>
                            </div>



                            <button class="btn btn-lg btn-primary btn-block text-uppercase"
                                    type="submit">Add Group</button>
                            <hr class="my-4">



                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>