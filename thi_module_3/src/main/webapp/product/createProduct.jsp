<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Gia Nguyen Store
  Date: 8/5/2022
  Time: 4:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Customer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../style/bootstrap/normalize.css">
    <link rel="stylesheet" href="../style/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../style/datatables/css/dataTables.bootstrap4.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <link rel="stylesheet" href="../style/style.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"/>
</head>
<body>
<div class="container">
    <%@ include file="../include/header.jsp" %>
    <form action="../product?action=create" method="post">
        <div class="mb-3">
            <label for="name" class="form-label">Name Product:</label>
            <input type="text" class="form-control" id="name" name="productName" value="${product.productName}">
            <p style="color: red">${errors.get('nameErrors')}</p>
        </div>
        <div class="mb-3">
            <label for="Price" class="form-label">Price :</label>
            <input type="text" class="form-control" id="Price" name ="price" value="${product.price}">
            <p style="color: red">${errors.get('dateErrors')}</p>
        </div>
        <div class="mb-3">
            <label for="Quantity" class="form-label"> Quantity :</label>
            <input type="text" class="form-control" id="Quantity" name="quantity" value="${product.quantity}">
            <p style="color: red">${errors.get('idCardErrors')}</p>
        </div>
        <div class="mb-3">
            <label for="Color" class="form-label">Color :</label>
            <input type="text" class="form-control" id="Color" name = "color" value="${product.color}">
            <p style="color: red">${errors.get('phoneErrors')}</p>
        </div>
        <div class="mb-3">
            <label for="Category" class="form-label">Category :</label>
            <input type="text" class="form-control" id="Category" name="category" value="${product.category}">
            <p style="color: red">${errors.get('emailErrors')}</p>
        </div>
        <div>
            <button class="btn btn-success" type="submit">Accept</button>
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
            </button>
        </div>
    </form>
</div>
<%@include file="../include/footer.jsp" %>
<script src="../style/jquery/jquery-3.5.1.min.js"></script>
<script src="../style/datatables/js/jquery.dataTables.min.js"></script>
<script src="../style/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="../style/bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>
