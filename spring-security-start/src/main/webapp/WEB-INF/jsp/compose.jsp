<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Compose</title>
</head>
<body>

<jsp:include page="header.jsp"/>

<h1>Create message</h1>

<form:form action="./" method="post" modelAttribute="messageForm">
    <form:errors path="*" element="div" cssStyle="color: red;" />
    <br/><br/>
    <label for="toEmail">To</label><br/>
    <form:input type="text" path="toEmail" /><br/>
    <br/>
    <label for="summary">Summary</label><br/>
    <form:input type="text" path="summary" /><br/>
    <br/>
    <label for="text">Message</label><br/>
    <form:textarea path="text" /><br/>
    <br/>
    <input type="submit" value="Create" />
</form:form>

</body>
</html>
