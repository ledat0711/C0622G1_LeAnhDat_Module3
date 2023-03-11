<%--
  Created by IntelliJ IDEA.
  User: LAPTOP ACER
  Date: 06-10-2022
  Time: 08:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="../bootstrap-5.0.2-dist/css/bootstrap.css">
</head>
<body>
<div >
    <div class="row" style="background: #86b7fe " >
        <div class="col-3 header">
        <span>
            <a class="navbar-brand" href="#">
                <img src="../img/e7947460373ce7da7c22efc9c3dfc113.jpg" alt="" width="100" height="100">
            </a>
        </span>
        </div>
        <div class="col-5 header"></div>
        <div class="col-4 header position-relative">
            <span class="position-absolute top-50 start-50 translate-middle" style="color: #b02a37"> Lê Anh Đạt </span>
        </div>
    </div>
    <div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Home</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarEmployee" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Employee
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/employee">Display Employee List</a></li>
                                <li><a class="dropdown-item" href="/employee?action=add">Add New Employee(Modal)</a></li>
                                <li><a class="dropdown-item" href="/employee">Edit Employee(Modal)</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarCustomer" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Customer
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/customer">Display Customer</a></li>
                                <li><a class="dropdown-item" href="/customer?action=add">Add New Customer</a></li>
                                <li><a class="dropdown-item" href="/customer?action">Edit Customer</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarService" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Service
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Display Service List</a></li>
                                <li><a class="dropdown-item" href="#">Add New Service</a></li>
                                <li><a class="dropdown-item" href="#">Edit Service</a></li>
                                <li><a class="dropdown-item" href="#">Delete(modal)</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarContract" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Contract
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Display Contract List</a></li>
                                <li><a class="dropdown-item" href="#">Add New Contract</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
    </div>
    <div class="row" style="height: 450px">
        <div class="col-3 " >
            <div class="card " style="width: 18rem;">
                <ul class="list-group list-group-flush text-center">
                    <li class="list-group-item">An item</li>
                    <li class="list-group-item">A second item</li>
                    <li class="list-group-item">A third item</li>
                </ul>
            </div>
        </div>
        <div class="col-9 " ><img src="../img/khu-nghi-duong-furama.jpg" style="width: 100%;height: 100%"> </div>
    </div>
    <div class="row bg-dark" style="height:100px"></div>
</div>
<script src="../bootstrap-5.0.2-dist/js/bootstrap.js"></script>
</body>
</html>
