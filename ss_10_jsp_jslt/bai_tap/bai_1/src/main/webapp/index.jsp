<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <style>
        img{
            width: 100px;
            height: 130px;
        }
        table{
            border-collapse: collapse;
            margin: auto;
        }
    </style>
</head>
<body>
<h1>Danh Sách Khách Hàng</h1>
<a href="/customer-servlet" >Nhấn vào để hiển thị danh sách</a>
<div class="container">
    <table border="1">
        <tr>
            <th>Tên</th>
            <th>Ngày Sinh</th>
            <th>Địa chỉ</th>
            <th>Ảnh</th>
        </tr>
        <c:forEach var="customer" items="${customerList}">
            <tr>
                <td>${customer.getName()}</td>
                <td>${customer.getBirthOfDay()}</td>
                <td>${customer.getAddress()}</td>
                <td><img src="${customer.getImage()}" alt="logo"></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>