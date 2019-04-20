<%@include file="contactsHeader.jsp" %>



<sql:query var="result" dataSource="${con}"
           sql="select * from contacts order by Name" />

<c:set var="i" value="1" />

<div class="container">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
                <div class="card-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Name</th>
                                <th scope="col">Mobile</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>

                        <tbody>

                        <c:forEach items="${result.rows}" var="row">

                            <tr>
                                <th scope="row">${i}</th>
                                <td>${row.Name} ${row.Surname}</td>
                                <td>${row.Number}</td>
                                <td>
                                    <a href="editContact.jsp?name=${row.Name}&adjective=${row.Adjective}&surname=${row.Surname}&number=${row.Number}&id=${row.id}">E</a>
                                    <a href="deleteContact.jsp?id=${row.id}" onclick="return confirm('Are You Sure to delete this record?')"> D</a>
                                </td>
                            </tr>
                            <c:set var="i" value="${i + 1 }" />
                        </c:forEach>
                       
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


</html>