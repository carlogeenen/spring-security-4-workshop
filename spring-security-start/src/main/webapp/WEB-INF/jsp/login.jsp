<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Our own Login Form</title>
</head>
<body>

<jsp:include page="header.jsp"/>

<h1>Our own Login Form</h1>

<form:form name="f" action="/login" method="post">
    <c:if test="${param.error != null}">
        <div style="color: red;">
            Failed to login.
            <c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
                Reason: <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
            </c:if>
        </div>
        <br/>
    </c:if>
    <c:if test="${param.logout != null}">
        <div style="color: green;">
            You have been logged out.
        </div>
        <br/>
    </c:if>
    <label for="username">Username</label><br/>
    <input type="text" id="username" name="username"/><br/>
    <br/>
    <label for="password">Password</label><br/>
    <input type="password" id="password" name="password"/><br/>
    <br/>
    <input type="submit" value="Login"/>
</form:form>

</body>
</html>
