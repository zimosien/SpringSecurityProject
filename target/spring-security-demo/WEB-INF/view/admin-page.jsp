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
    <title>Company Admin Page</title>
</head>

<body>
<h2>Company Admin Page</h2>
<hr>

Welcome to the company Admin page!
<br>
<br>
Role: <security:authentication property="principal.authorities"/>
<br>
It is our senior admin's birthday party.
<br>

<a href="${pageContext.request.contextPath}/"> back to home page </a>
<br>
<br>

<form:form action="${pageContext.request.contextPath}/logout" method="post">
  <input type="submit" value="Logout"/>
</form:form>
</body>

</html>
