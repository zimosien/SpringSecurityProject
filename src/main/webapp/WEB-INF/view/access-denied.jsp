<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: AmirHossein-Zahra
  Date: 1/14/2022
  Time: 11:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>
    <title>Access Denied</title>
</head>

<body>
<h2>Access Denied</h2>
<hr>

you are not authorized to access this page!
<br>
<br>

<a href="${pageContext.request.contextPath}/"> back to home page </a>
<br>
<br>

<form:form action="${pageContext.request.contextPath}/logout" method="post">
  <input type="submit" value="Logout"/>
</form:form>
</body>

</html>
