<%@include file="../adminHeader.jsp" %>

<%@ page import="java.io.*,java.util.*,java.sql.*,java.net.*,java.util.zip.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
        
        <jsp:forward page="showStatus.jsp">
            <jsp:param name="file" value="${file}" />
        </jsp:forward>
        
    </c:if>
        
    <c:if test="${dtxnid == '0'}">
        <jsp:forward page="errorInStatus.jsp" />
    </c:if>


</body>
</html>