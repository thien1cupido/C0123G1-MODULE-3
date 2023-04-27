<%--
  Created by IntelliJ IDEA.
  User: TRUNG THIEN
  Date: 4/27/2023
  Time: 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result</title>
</head>
<body>
<h1>Result</h1>
<c:if test="${secondNumber==0}">
    <p>Không thể chia cho 0</p>
</c:if>
<c:if test="${secondNumber!=0}">
    <p>${firstNumber}${operator}${secondNumber}=${result}</p>
</c:if>
</body>
</html>
