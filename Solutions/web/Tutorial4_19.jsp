
 1. Session Read and Write
    <%
    session.setAttribute("name","XYZ");
    %>
    <%=session.getAttribute("name")%>
    <hr>
 
 
 2. URL rewriting sending and retrieving parameter(s)
  
 <a href="Next.jsp?name=xyz"> Click Here </a>
 
 <%
 request.getParameter("name");    
 %>
 
 <hr>

 3. URL Redirection
 
 <% //response.sendRedirect("Next.jsp"); %>
 
 <hr>

 4. Print Hello World as output
 
 <%out.println("Hello World");%>
 
 <hr>
 
 5. Include the other JSP file statically
 <%@include  file="Tutorial4_20.jsp" %>
 
 <hr>
 6. Expression to display date as output
 <%=new java.util.Date()%>
 
 <hr>
 
 7.Method of setting the JSP parameters to use in JSTL
 <c:set var="test" value="James" scope="session" />