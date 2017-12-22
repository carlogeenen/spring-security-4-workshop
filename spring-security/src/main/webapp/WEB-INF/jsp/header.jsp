<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<form:form action="/logout" method="post">
    <a href="/">Inbox</a> | <a href="/?form">Compose</a> | <a href="/database">Database</a> |
    <c:set var="authentication" value="${pageContext.request.userPrincipal}"/>
    <c:choose>
        <c:when test="${authentication != null}">
            <c:set var="currentUser" value="${authentication.principal}"/>
            <b><c:out value="${currentUser.firstName}"/> <c:out value="${currentUser.lastName}"/></b>
            <input type="submit" value="Logout" />
        </c:when>
        <c:otherwise>
            <a href="/signup">Sign up</a>
        </c:otherwise>
    </c:choose>
</form:form>

<c:if test="${globalMessage != null}">
    <p style="color: green;"><c:out value="${globalMessage}" /></p>
</c:if>
