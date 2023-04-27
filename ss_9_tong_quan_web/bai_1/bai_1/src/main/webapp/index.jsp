<%--
  Created by IntelliJ IDEA.
  User: TRUNG THIEN
  Date: 4/26/2023
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ung dung Product Discount Calculator</title>
    <style>
        form{
            margin: auto;
        }
    </style>
</head>
<body>
<h1>Ung dung Product Discount Calculator</h1>
<div class="container">
    <form action="/display-discount" method="post">
        <input type="text" name="ten-san-pham" placeholder="tên sản phẩm">Tên sản phẩm<br>
        <select name="mau" >
            <option value="vang">Vàng</option>
            <option value="do">Đỏ</option>
            <option value="xanh">Xanh</option>
        </select>Màu sắc<br>
        <input type="number" name="list-price">Giá niêm yết<br>
        <input type="number" name="discount-percent">Tỷ lệ chiết khấu<br>
        <button>Tính</button>
    </form>
</div>
</body>
</html>
