<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Inbox</title>
    <style type="text/css">
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            padding: 15px;
            vertical-align: top;
        }
        th {
            text-align: left;
            background-color: lightgrey;
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp"/>

<h1>Inbox</h1>
<table>
    <thead>
    <tr>
        <th>Summary</th>
        <th>Created</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${empty messages}">
        <tr>
            <td colspan="3">No messages</td>
        </tr>
    </c:if>
    <c:forEach var="message" items="${messages}">
        <tr>
            <td><a href="/${message.id}">${message.summary}</a></td>
            <td><fmt:formatDate value="${message.created.time}" type="both"/></td>
            <td><form:form class="form-inline" form:action="/${message.id}" form:method="delete"><input
                    type="submit" value="Delete"/></form:form></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
