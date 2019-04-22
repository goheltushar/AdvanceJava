
<!DOCTYPE html>
<html>
    <%@include file="header.html" %>
    <body>

        <%
            String u = (String) session.getAttribute("username");
            if (null == u) {%>
        <jsp:forward page="index.html" />
        <%}
        %>


        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">STJKMS </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Welcome ${username} <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href=<%=getServletContext().getContextPath() + "/logout.jsp"%>>Logout<span class="sr-only">(current)</span></a>
                    </li>
            </div>
        </nav>

       
