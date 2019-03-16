
<jsp:useBean id="studentbean" class="mybeans.StudentBean" scope="session" />

<jsp:setProperty name="studentbean" property="*" />

Name : <jsp:getProperty name="studentbean" property="name" /> <br>
Address : <jsp:getProperty name="studentbean" property="address" /> <br>
Enrollment : <jsp:getProperty name="studentbean" property="enrollment" /> <br>
cpi : <jsp:getProperty name="studentbean" property="cpi" />