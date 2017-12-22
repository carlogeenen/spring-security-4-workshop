<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Message: ${message.summary}</title>
    <style type="text/css">
        dt {
            font-weight: bold;
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp"/>

<h1>Message: ${message.summary}</h1>
<dl>
    <dt>ID</dt>
    <dd id="id">${message.id}</dd>
    <dt>Date</dt>
    <dd id="created"><fmt:formatDate value="${message.created.time}" type="both"/></dd>
    <dt>Message</dt>
    <dd id="text">${message.text}</dd>
</dl>

</body>
</html>
