<%--
  Created by IntelliJ IDEA.
  User: TRUNG THIEN
  Date: 5/4/2023
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm user</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<body>
<div class="container-fluid">
  <div class="row">
    <h1>Thêm mới user</h1>
  </div>
  <div class="row">
    <div>
      <form method="post" action="/user?action=transaction">
        <label>User Name</label>
        <input class="form-control" type="text" name="name"><br>
        <label>User Email</label>
        <input class="form-control" type="text" name="email"><br>
        <label>Country</label>
        <input class="form-control" type="text" name="country"><br>
        <button class="btn btn-success">Create</button>
      </form>
      <button class="btn btn-success" onclick="window.location.href='/user'">Display list</button>
      <p style="color: blue;font-weight: bold;justify-content: center">${message}</p>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
