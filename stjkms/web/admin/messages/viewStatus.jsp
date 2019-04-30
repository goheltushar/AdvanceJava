<%@include file="../adminHeader.jsp" %>

<%@ page import="java.io.*,java.util.*,java.sql.*,java.net.*,java.util.zip.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%!void copyInputStream(InputStream in, OutputStream out) throws IOException {
        byte[] buffer = new byte[1024];
        int len = in.read(buffer);
        while (len >= 0) {
            out.write(buffer, 0, len);
            len = in.read(buffer);
        }
        in.close();
        out.close();
    }%>




<body>


    <c:import url="http://stats.mytoday.com/dlr_api"
              var="result_dtxnid">
        <c:param name="feedid" value="364413" />
        <c:param name="date" value="${param.sent_date}" />
    </c:import>
    <c:set var="result_dtxnid"
           value="${fn:substringAfter(result_dtxnid,'<RESULT>')}" />
    <c:set var="dtxnid"
           value="${fn:substringBefore(result_dtxnid,'</RESULT>')}" />
    
    <br>
    <%                            //out.println(request.getLo);
        String txnid = (String) pageContext.getAttribute("dtxnid");
        int count = 1;
        if (txnid.length() > 2) {
            String report_status = "FETCHING";
            while (report_status.equals("FETCHING")) {
    %>
    <c:import url="http://stats.mytoday.com/dlr_api"
              var="result_status">
        <c:param name="feedid" value="364413" />
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

        if (report_status.equals("DONE")) {
    %>
    <c:import url="http://stats.mytoday.com/dlr_api" var="result_file">
        <c:param name="feedid" value="364413" />
        <c:param name="dtxnid" value="${dtxnid}" />
        <c:param name="ack" value="1" />
        <c:param name="date" value="${param.sent_date}" />
    </c:import>


    <c:set var="result_file"
           value="${fn:substringAfter(result_file,'?')}" />
    <c:set var="file" value="${fn:substringBefore(result_file,'&')}" />

    <br>
    <%
            }
        }
    %>

    <%
        try {
            if (txnid.length() > 2) {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                        getServletContext().getInitParameter("url"), getServletContext().getInitParameter("user"),
                        getServletContext().getInitParameter("password"));
                PreparedStatement psmt = con.prepareStatement("select * from " + getServletContext().getInitParameter("contacts_table") + " where Number = ?");
                ResultSet rs = null;

                URL url = new URL("http://stats.mytoday.com/estatsbin/dlr_download?"
                        + (String) pageContext.getAttribute("file") + "&feedid=364413");
                InputStream in = new BufferedInputStream(url.openStream(), 1024);
                // make sure we get the actual file
                                    
                File targetDir = new File(getServletContext().getInitParameter("targetDir"));
                File zip = File.createTempFile("arc", ".zip", targetDir);
                OutputStream fout = new BufferedOutputStream(new FileOutputStream(zip));

                copyInputStream(in, fout);

                ZipFile zipFile = new ZipFile(zip);
                File file = null;
                for (Enumeration entries = zipFile.entries(); entries.hasMoreElements();) {
                    ZipEntry entry = (ZipEntry) entries.nextElement();
                    file = new File(targetDir, entry.getName());
                    copyInputStream(zipFile.getInputStream(entry),
                            new BufferedOutputStream(new FileOutputStream(file)));
                }
                zipFile.close();

                if (file != null) {

                    BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file)));
                    String str = "";
                    int i = 1;
                    int j = 1;
                    count = 1;
                    StringTokenizer st = null;
                    StringBuffer sb = null;
                    String token = "";

                    ArrayList delivery_status = new ArrayList();
                    ArrayList delivery_status_element = null;

                    while ((str = br.readLine()) != null) {
                        if (i++ == 1) {
                            continue;
                        }
                        /*if (str.contains("Delivered")) {
                            continue;
                        }*/
                        st = new StringTokenizer(str, ",");
                        j = 0;
                        delivery_status_element = new ArrayList();
                        while (st.hasMoreTokens()) {
                            j++;
                            token = st.nextToken();
                            if (j == 2 || j == 3) {
                                token = token.substring(token.indexOf('"') + 1, token.lastIndexOf('"'));
                                if (j == 2) {
                                    token = token.substring(2);
                                    delivery_status_element.add(token);
                                    psmt.setString(1, token);
                                    rs = psmt.executeQuery();
                                    if (rs.next()) {
                                        delivery_status_element.add(rs.getString("Name") + " " + rs.getString("Surname") + "(" + token + ")");
                                    } else {
                                        delivery_status_element.add("Unknown Name" + "(" + token + ")");
                                    }
                                    rs.close();
                                } else {
                                    delivery_status_element.add(token);
                                }
                            }
                        }
                        delivery_status.add(delivery_status_element);
                        count++;
                        //out.print("<br> <br>");
                    }
                    br.close();
                                        
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
                         out.print("<td>" + temp.get(2)  + "</td>");
                         out.print("</tr>");
                         }%>

                            

                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>


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

    <% }
 } else {
     out.println(txnid);
 }

} catch (Exception e) {
 out.println(e.toString());
}
    %>






</body>
</html>