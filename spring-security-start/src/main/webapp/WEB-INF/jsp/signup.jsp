<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Sign up</title>
</head>
<body>

<jsp:include page="header.jsp"/>

<h1>Sign up</h1>

<form:form action="./signup" method="post" modelAttribute="user">
    <form:errors path="*" element="div" cssStyle="color: red;" />
    <br/><br/>
    <label for="firstName">First Name</label><br/>
    <form:input type="text" path="firstName" class="input-xxlarge" /><br/>
    <br/>
    <label for="lastName">Last Name</label><br/>
    <form:input type="text" path="lastName" class="input-xxlarge" /><br/>
    <br/>
    <label for="lastName">Email</label><br/>
    <form:input type="text" path="email" class="input-xxlarge" /><br/>
    <br/>
    <label for="password">Password</label><br/>
    <form:input type="password" path="password" class="input-xxlarge" /><br/>
    <br/>
    <input type="submit" value="Sign up" />
</form:form>

</body>
</html>
