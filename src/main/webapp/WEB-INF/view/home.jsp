<%--
  Created by IntelliJ IDEA.
  User: AmirHossein-Zahra
  Date: 1/14/2022
  Time: 11:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>

<head>
    <title>Company Home Page</title>
</head>

<body>
<h2>Company Home Page</h2>
<hr>

Welcome to the company home page!
<br>
<%-- user and its roles display--%>
User: <security:authentication property="principal.username"/>
<br>
Role: <security:authentication property="principal.authorities"/>
<br>
<br>

<security:authorize access="hasRole('MANAGER')">
    <a href="${pageContext.request.contextPath}/manager"> Managers special treat </a> (only for managers)
</security:authorize>

<br>
<security:authorize access="hasRole('ADMIN')">
    <a href="${pageContext.request.contextPath}/admin">Administrators special gathering</a>(admins only)
</security:authorize>

<br>

<form:form action="${pageContext.request.contextPath}/logout" method="post">
  <input type="submit" value="Logout"/>
</form:form>
</body>

</html>
