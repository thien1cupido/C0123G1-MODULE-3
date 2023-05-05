<%--
  Created by IntelliJ IDEA.
  User: TRUNG THIEN
  Date: 5/4/2023
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<body>
<div class="container-fluid">
    <div class="row">
        <h1>Danh sách user</h1>
    </div>
    <div class="row">
        <div class="col-auto d-flex">
            <form action="/user" class="d-flex">
                <input type="hidden" name="action" value="search">
                <input class="form-control me-2" type="text" placeholder="Search" aria-label="Search" name="search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
        <table class="table table-striped">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Country</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="user" items="${userList}">
                <tr>
                    <td><c:out value="${user.id}"/></td>
                    <td><c:out value="${user.name}"/></td>
                    <td><c:out value="${user.email}"/></td>
                    <td><c:out value="${user.country}"/></td>
                    <td>
                        <button class="btn btn-primary" onclick="window.location.href='/user?action=edit&id=${user.id}'">Edit</button>
                        <button class="btn btn-danger" type="button" data-bs-toggle="modal"
                                data-bs-target="#deleteModal${user.getId()}">Delete</button>
                    </td>
                </tr>
                <div class="modal fade" id="deleteModal${user.getId()}" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Xóa học sinh</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Bạn có muốn xóa học sinh có tên là ${user.getName()}
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                                <button type="button" class="btn btn-primary"
                                        onclick="window.location.href='/user?action=delete&id=${user.id}'">
                                    Có
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </table>
    </div>
    <button class="btn btn-success" onclick="window.location.href='/create.jsp'">Create</button>
    <button class="btn btn-success" onclick="window.location.href='/user?action=sort'">Sort</button>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
