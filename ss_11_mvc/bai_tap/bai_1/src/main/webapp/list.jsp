<%--
  Created by IntelliJ IDEA.
  User: TRUNG THIEN
  Date: 4/28/2023
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Danh sách sản phẩm</title>
</head>
<style>
    h1 {
        text-align: center;
    }
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<body>
<div class="container-fluid ">
    <h1>Danh sách sản phẩm</h1>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Tên sản phẩm</th>
            <th>giá sản phẩm</th>
            <th>Mô tả</th>
            <th>Nhà sản xuất</th>
            <th>Thao tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${productList}">
            <tr>
                <td>${product.getId()}</td>
                <td>${product.getName()}</td>
                <td>${product.getPrice()}$</td>
                <td>${product.getDescription()}</td>
                <td>${product.getManufacturer()}</td>
                <td>
                    <button type="button" class="btn btn-danger"
                            onclick="window.location.href='/product?action=update&id=${product.id}'">
                        Sửa
                    </button>
                    <button type="button" class="btn btn-warning" data-bs-toggle="modal"
                            data-bs-target="#deleteModal${product.id}">
                        Xóa
                    </button>

                </td>
            </tr>
            <div class="modal fade" id="deleteModal${product.id}" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Xóa học sinh</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Bạn có muốn xóa học sinh có tên là ${product.name}
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                            <button type="button" class="btn btn-primary"
                                    onclick="window.location.href='/product?action=delete&idDelete=${product.getId()}'">
                                Có
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        </tbody>
    </table>
    <button class="btn btn-success" onclick="window.location.href='/product?action=create'">Thêm</button>
    <button type="button" class="btn btn-info" onclick="window.location.href='/find.jsp'">Search</button>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
