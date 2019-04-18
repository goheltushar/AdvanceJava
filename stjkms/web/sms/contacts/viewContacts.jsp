<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
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
        <link rel="stylesheet"
              href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
        <meta name="viewport"
              content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
        <link href="../../css/styles.css" rel="stylesheet">
        <meta charset="UTF-8">
        <title>SendSMS-STJKMS Login</title>
    </head>

    <sql:setDataSource var="con" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/stjkms"
                       user="root" password="Kripalu@1008" />

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
                                <tr>
                                    <th colspan="4">
                                        <a class="btn btn-lg btn-primary btn-block text-uppercase" href="../../main.html" role="button">Home</a>
                                    </th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</html>