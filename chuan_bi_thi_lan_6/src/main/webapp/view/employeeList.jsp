ee<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--%khai báo dòng này để forrmat số :--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: LAPTOP ACER
  Date: 06-10-2022
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Employee List</title>
    <link rel="stylesheet" href="../bootstrap-5.0.2-dist/css/bootstrap.css">
</head>
<body>
<h3 style="color: #ffc107; text-align: center">EMPLOYEE LIST OF FURAMA RESORT</h3>
<a href="../employee?action=add">Add New Employee</a>

<form class="row g-3 d-fex justify-content-end" action="/employee" method="get">
    <input type="text" name="action" value="search" hidden>
    <div class="col-auto">
        <input type="text" name="searchName" class="form-control" placeholder="Name">
    </div>
    <div class="col-auto">
        <button type="submit" class="btn btn-outline-primary mb-3">Search</button>
    </div>
</form>

<table class="table table-striped" border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Date Of Birth</th>
        <th>Id Card</th>
        <th>Salary</th>
        <th>Phone Number</th>
        <th>Position</th>
        <th>Email</th>
        <th>Address</th>
<%--        <th>Position Id</th>--%>
<%--        <th>Education Degree Id</th>--%>
<%--        <th>Division Id</th>--%>
        <th>Username</th>
        <th>Delete</th>
        <th>Edit</th>
    </tr>
    <c:forEach var="employList" items="${employeeList}">
        <tr>
            <td>${employList.getId()}</td>
            <td>${employList.getName()}</td>
            <td>${employList.getDateOfBirth()}</td>
            <td>${employList.getIdCard()}</td>
            <td><fmt:formatNumber value="${employList.getSalary()}"/></td>
            <td>${employList.getPhoneNumber()}</td>
            <c:forEach var="positionList" items="${positionList}">
                <c:if test="${positionList.getId()==employList.getPositionId()}">
                    <td>${positionList.getName()}</td>
                </c:if>
            </c:forEach>
            <td>${employList.getEmail()}</td>
            <td>${employList.getAddress()}</td>
<%--            <td><c:out value="${employList.getPositionId()}"></c:out></td>--%>
<%--            <td><c:out value="${employList.getEducationDegreeId()}"></c:out></td>--%>
<%--            <td><c:out value="${employList.getDivisionId()}"></c:out></td>--%>
            <td>${employList.getUsername()}</td>
<%--            <td style="width: 10px"><a href="/employee?action=delete"><img src="../img/xoa.jpg" style="width: 50%"></a></td>--%>
            <td style="width: 20px">
                <!-- Button trigger modal -->
                <button type="button"  data-bs-toggle="modal" data-bs-target="#exampleModal${employList.getId()}">
                    <img src="../img/xoa.jpg" style="width: 50%">
                </button>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal${employList.getId()}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Delete Employee</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Are You Sure?
                            </div>
                            <div class="modal-footer">
                                <button type="button"  data-bs-dismiss="modal">  No</button>
                                <button type="button"><a href="/employee?action=delete&id=${employList.getId()}">Delete!</a></button>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
            <td ><a href="/employee?action=edit&id=${employList.getId()}"><img src="../img/edit.jpg" style="width: 30px"></a></td>
        </tr>
    </c:forEach>
</table>
<div>
    <a href="/view/home.jsp">Back Home!!!</a>
</div>
<script src="../bootstrap-5.0.2-dist/js/bootstrap.js"></script>
</body>
</html>
