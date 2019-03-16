<%@page import="java.sql.*" %>

<%
    try {

        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//172.16.17.3:1521/orcl", "gtushar", "staff");
        Statement smt = con.createStatement();
        ResultSet rs = smt.executeQuery("select * from studentinfo where semester = 6");
        while (rs.next()) {
            out.println("<br>Semester : " + rs.getInt("semester"));
            out.println("<br>Name : " + rs.getInt("name"));
            out.println("<br>Enrollement No : " + rs.getInt("enrollmentno"));
            out.println("<br>Sub 1 : " + rs.getInt("sub1"));
            out.println("<br>Sub 2 : " + rs.getInt("sub2"));
            out.println("<br>Sub 3 : " + rs.getInt("sub3"));
            out.println("<br>Sub 4 : " + rs.getInt("sub4"));
        }
    } catch (Exception e) {
        out.println(e);
    }

%>