
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
<div class="row w-100">
    <div class="col-lg-3">
        <a href="index.jsp">
        <img style="height: 100px; width: 100px" src="img/codegym.png">
        </a>
    </div>
    <div class="col-lg-5"></div>
    <div class="col-lg-4 d-flex text-center justify-content-center align-items-center">
        <div>
            <div class="row">
                <span style="font-family: 'Times New Roman',serif; font-size: 25px">Lê Anh Đạt</span>
            </div>
            <div class="row">
                <span style="font-family: 'Times New Roman',serif; font-size: 25px">C0622G1</span>
            </div>
        </div>
    </div>
</div>
<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item dropdown">
                    <a class="navbar-brand dropdown-toggle" href="#" id="navbarEmployee" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        Employee
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/employee">List Employee</a></li>
                    </ul>
                </li>  <li class="nav-item dropdown">
                    <a class="navbar-brand dropdown-toggle" href="#" id="navbarCustomer" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        Customer
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/customer">List Customer</a></li>
                        <li><a class="dropdown-item" href="/customer?action=create"> Create Customer</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="navbar-brand dropdown-toggle" href="#" id="navbarService" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        Facility
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/facility">List Facility</a></li>
                        <li><a class="dropdown-item" href="/facility?action=create"> Create Facility</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="navbar-brand dropdown-toggle" href="#" id="navbarContract" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        Contract
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/contract">List Contract</a></li>
                        <li><a class="dropdown-item" href="/contract?action=create"> Create Contract</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>
