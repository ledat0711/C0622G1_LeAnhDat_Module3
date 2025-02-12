<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer Update</title>
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
<%@ include file="../include/header.jsp" %>
<div class="container">
    <form action="/customer?action=update" method="post">
        <input type="hidden" id="id" name="id" value="${customer.id}">
        <div class="mb-3">
            <label for="name" class="form-label">Customer Name</label>
            <input type="text" class="form-control" id="name" name="name" value="${customer.name}">
            <p style="color: red">${errors.get('nameErrors')}</p>
        </div>
        <div class="mb-3">
            <label for="birthday" class="form-label">Birthday</label>
            <input type="date" class="form-control" id="birthday" name="dateOfBirth" value="${customer.dateOfBirth}">
            <p style="color: red">${errors.get('dateErrors')}</p>
        </div>

        <div class="mb-3">
            <label for="gender" class="form-label">Gender</label>
            <select id="gender" class="form-select" name="gender">
                <c:if test="${customer.gender==1}">
                    <option value="1" selected>Male</option>
                    <option value="0">FeMale</option>
                </c:if>
                <c:if test="${customer.gender==0}">
                    <option value="0" selected>FeMale</option>
                    <option value="1">Male</option>
                </c:if>
            </select>
        </div>

        <div class="mb-3">
            <label for="id_card" class="form-label"> Id_card</label>
            <input type="text" class="form-control" name="idCard" id="id_card" value="${customer.idCard}">
            <p style="color: red">${errors.get('idCardErrors')}</p>
        </div>
        <div class="mb-3">
            <label for="phone" class="form-label">Phone</label>
            <input type="text" class="form-control" id="phone" name="phoneNumber" value="${customer.phoneNumber}">
            <p style="color: red">${errors.get('phoneErrors')}</p>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">email</label>
            <input type="text" class="form-control" id="email" name="email" value="${customer.email}">
            <p style="color: red">${errors.get('emailErrors')}</p>
        </div>
        <div class="mb-3">
            <label for="customer_type" class="form-label">Customer Type :</label>
            <select id="customer_type" class="form-select" name="customerTypeId">
                <c:forEach items="${customerTypeList}" var="customerType">
                    <c:choose>
                        <c:when test="${customerType.id == customer.customerTypeId}">
                            <option value="${customerType.id}" selected>${customerType.nameCustomerType}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${customerType.id}">${customerType.nameCustomerType}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label for="address" class="form-label">Address</label>
            <input type="text" class="form-control" id="address" name="address" value="${customer.address}">
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
