<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="currentpwd"  value="${param.current}" />
<c:set var="newpwd"  value="${param.password}" />
<c:set var="confirmpwd"  value="${param.confirmPassword}" />

<c:if test="${currentpwd == password}">
    
    <c:if test="${newpwd == confirmpwd}">
    
        <sql:update dataSource="${con}"
                    sql="update users set password = ? where username = ?">
            <sql:param value="${newpwd}" />
            <sql:param value="${username}" />
        </sql:update>
        <c:set var="password" value="${newpwd}" scope="session" />
        Password Changed Successfully ....
    </c:if>
</c:if>
