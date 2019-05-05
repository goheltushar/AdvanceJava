<%@include file="../adminHeader.jsp" %>

<%@ page import="java.io.*,java.util.*, javax.servlet.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>File Upload</title>
    </head>
    <body>
        <%
            File file;
            int maxFileSize = 5000 * 1024;
            int maxMemSize = 5000 * 1024;
            String filePath = "";
            if(request.getRequestURL().toString().contains("localhost"))
                filePath = "/home/tushar/test/";
            else
                filePath = "/tmp/stjkms-reports/";

            String contentType = request.getContentType();
            if ((contentType.indexOf("multipart/form-data") >= 0)) {

                DiskFileItemFactory factory = new DiskFileItemFactory();
                factory.setSizeThreshold(maxMemSize);
                factory.setRepository(new File(filePath));
                ServletFileUpload upload = new ServletFileUpload(factory);
                upload.setSizeMax(maxFileSize);
                try {
                    List fileItems = upload.parseRequest(request);
                    Iterator i = fileItems.iterator();
                    out.println("<html>");
                    out.println("<body>");
                    while (i.hasNext()) {
                        FileItem fi = (FileItem) i.next();
                        if (!fi.isFormField()) {
                            String fieldName = fi.getFieldName();
                            String fileName = fi.getName();
                            boolean isInMemory = fi.isInMemory();
                            long sizeInBytes = fi.getSize();
                            if (fileName.endsWith(".csv")) {
                                file = new File(filePath + fileName);
                                fi.write(file);
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection(
                                        getServletContext().getInitParameter("url"), getServletContext().getInitParameter("user"),
                                        getServletContext().getInitParameter("password"));
                                PreparedStatement psmt_contacts = con.prepareStatement("insert into contacts(Name,Adjective,Surname,Number) values(?,?,?,?)");

                                //out.println("Uploaded Filename: " + filePath + fileName + "<br>");
                                BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file)));
                                String str = "";
                                StringTokenizer st = null;
                                StringBuffer sb = null;
                                String token = "";
                                int rowIndex = 0;
                                while ((str = br.readLine()) != null) {
                                    out.println(str + "<br>");
                                    rowIndex++;
                                    if (rowIndex == 1) {
                                        continue;
                                    }
                                    st = new StringTokenizer(str, ",");
                                    psmt_contacts.setString(1, st.nextToken());
                                    psmt_contacts.setString(2, st.nextToken());
                                    psmt_contacts.setString(3, st.nextToken());
                                    psmt_contacts.setString(4, st.nextToken());
                                    psmt_contacts.executeUpdate();
                                    out.println("Contact Added Successfully ....<br>");
                                }
                                br.close();
                                ResultSet rs = null;
                                br = new BufferedReader(new InputStreamReader(new FileInputStream(file)));
                                psmt_contacts = con.prepareStatement("select * from contacts where Number = ?");
                                while ((str = br.readLine()) != null) {
                                    rowIndex++;
                                    if (rowIndex == 1) {
                                        continue;
                                    }
                                    st = new StringTokenizer(str, ",");
                                    st.nextToken();
                                    st.nextToken();
                                    st.nextToken();
                                    psmt_contacts.setString(1, st.nextToken());
                                    rs = psmt_contacts.executeQuery();
                                    PreparedStatement psmt_groups_contacts = con.prepareStatement("insert into groups_contacts(group_id,contacts_id) values(?,?)");
                                                                        
                                    if(rs.next()){
                                        
                                        psmt_groups_contacts.setInt(1, Integer.parseInt(st.nextToken()));
                                        psmt_groups_contacts.setInt(2, rs.getInt("id"));
                                        psmt_groups_contacts.executeUpdate();
                                        out.println("Contact Added to Group Successfully ....<br>");
                                    }
                                    rs.close();
                                    
                                }

                            } else {
                                out.println("File is not Uploaded as it is not a csv file<br>");
                            }

                        }
                    }
                    out.println("</body>");
                    out.println("</html>");
                } catch (Exception ex) {
                    out.println(ex);
                }
            } else {
                out.println("<html>");
                out.println("<body>");
                out.println("<p>No file uploaded</p>");
                out.println("</body>");
                out.println("</html>");
            }
        %>
    </body>
</html>