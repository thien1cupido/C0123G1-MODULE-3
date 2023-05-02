<%--
  Created by IntelliJ IDEA.
  User: TRUNG THIEN
  Date: 4/28/2023
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <title>Sửa sản phẩm</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<body>
<div class="container">
  <h1>Sửa thông sản phẩm</h1>
  <form method="post" action="/product?action=update">
    <label class="form-label">ID</label>
    <input class="form-control" type="hidden" name="id" value="${product.getId()}"><br>
    <label>Tên sản phẩm</label>
    <input class="form-control" type="text" name="name" value="${product.getName()}"><br>
    <label>Giá sản phẩm</label>
    <input class="form-control" type="number" name="price" value="${product.getPrice()}"><br>
    <label>Mô tả</label>
    <input class="form-control" type="text" name="description" value="${product.getDescription()}"><br>
    <label>Nhà sản xuất</label>
    <input class="form-control" type="text" name="manufacturer" value="${product.getManufacturer()}"><br>
    <button class="btn btn-success">Sửa</button>
  </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>

