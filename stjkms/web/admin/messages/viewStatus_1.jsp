<%@include file="../adminHeader.jsp" %>

<%@ page import="java.io.*,java.util.*,java.sql.*,java.net.*,java.util.zip.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:useBean class="mybeans.ShowStatus" id="showstatus" scope="page" />


<body>
    <c:import url="http://stats.mytoday.com/dlr_api"
              var="result_dtxnid">
        <c:param name="feedid" value="${initParam.feedid}" />
        <c:param name="date" value="${param.sent_date}" />
    </c:import>
    <c:out value="${result_dtxnid}" />
    <c:set var="result_dtxnid"
           value="${fn:substringAfter(result_dtxnid,'<RESULT>')}" />
    <c:set var="dtxnid"
           value="${fn:substringBefore(result_dtxnid,'</RESULT>')}" scope="session"/>

    <c:out value="${dtxnid}" />

    <c:if test="${dtxnid != '0'}">

        <%            String report_status = "FETCHING";
            while (!report_status.equals("DONE")) {
        %>

        <c:import url="http://stats.mytoday.com/dlr_api"
                  var="result_status">
            <c:param name="feedid" value="${initParam.feedid}" />
            <c:param name="dtxnid" value="${dtxnid}" />
            <c:param name="date" value="${param.sent_date}" />
        </c:import>

        <c:set var="result_status"
               value="${fn:substringAfter(result_status,'<RESULT>')}" />
        <c:set var="status"
               value="${fn:substringBefore(result_status,'</RESULT>')}" />


        <%
                report_status = (String) pageContext.getAttribute("status");
            }
        %>

        <c:import url="http://stats.mytoday.com/dlr_api" var="result_file">
            <c:param name="feedid" value="${initParam.feedid}" />
            <c:param name="dtxnid" value="${dtxnid}" />
            <c:param name="ack" value="1" />
            <c:param name="date" value="${param.sent_date}" />
        </c:import>
        <br>
        <c:out value="${result_file}" />

        <c:set var="result_file"
               value="${fn:substringAfter(result_file,'?')}" />
        <c:set var="file" value="${fn:substringBefore(result_file,'&')}" />
        <br>
        <c:out value="${file}" />

        <%
            showstatus.initializeDB(getServletContext().getInitParameter("url"), getServletContext().getInitParameter("user"), getServletContext().getInitParameter("password"));
            ArrayList campaignrequestids = showstatus.getCampaignRequestIds(Long.parseLong(request.getParameter("campaignid")));
            File targetDir = new File(getServletContext().getInitParameter("targetDir"));
            File zip = showstatus.getZipFile((String) pageContext.getAttribute("file"), targetDir);
            File csv = showstatus.getCSVFile(zip, targetDir);
            ArrayList delivery_status = showstatus.getDeliveryStatus(csv, (String) session.getAttribute("contacts_table"), campaignrequestids);
        %>


        <div class="container">
            <div class="row">
                <div class="card-body">
                    <div class="table-responsive">
                        <h5 class="card-title text-center">Report For the Date : ${param.sent_date}</h5>
                        <hr>
                        <h5 class="text-center">Message : ${param.Message}</h5>
                        <table class="table table-bordered" id="statusTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Status</th>
                                </tr>
                            </thead>

                            <tbody>

                                <% ArrayList temp = new ArrayList();
                                    for (int k = 0; k < delivery_status.size(); k++) {
                                        temp = (ArrayList) delivery_status.get(k);
                                        out.print("<tr>");
                                        out.print("<th scope=\"row\">" + k + "</th>");
                                        out.print("<td>" + temp.get(1) + "</td>");
                                        out.print("<td>" + temp.get(2) + "</td>");
                                        out.print("</tr>");
                                    }%>

                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>




    </c:if>

   
        
    <script src="${pageContext.request.contextPath}/admin/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/admin/js/demo/datatables-demo.js"></script>
    <link href="${pageContext.request.contextPath}/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <script>
        $(document).ready(function () {
        $('#statusTable').DataTable();
        });
    </script>

</body>
</html>