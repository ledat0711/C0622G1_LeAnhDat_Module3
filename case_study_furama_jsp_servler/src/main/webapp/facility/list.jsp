<%--
  Created by IntelliJ IDEA.
  User: Gia Nguyen Store
  Date: 8/4/2022
  Time: 11:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Service</title>
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
<div class="container-fluid">
    <%@ include file="../include/header.jsp" %>
    <h1 class="text-center text-primary m-5">Facility List</h1>
    <div class="row">
        <div class="col-lg-4"><a href="/facility?action=create" class="btn btn-success">Create Facility</a></div>
        <div class="col-lg-8 align-items-lg-end">
                    <form action="/facility" class="d-flex justify-content-lg-end ">
                        <input class="form-control w-50" type="text" placeholder="SearchNameOfFacility"
                               name="keyWork" value="${keyWork}" aria-label="Search">
                        <button class="btn btn-success" name="action" value="search" type="submit">Search</button>
                    </form>
        </div>
    </div>
    <div class="table-responsive">
        <table class="table table-hover" id="myTable">
            <thead>
            <tr>
                <th>No.</th>
                <th>Name</th>
                <th>Area</th>
                <th>Cost</th>
                <th>Max_people</th>
                <th>Rent_type</th>
                <th>FacilityType</th>
                <th>StandardRoom</th>
                <th>DescriptionOtherConvenience</th>
                <th>PoolArea</th>
                <th>NumberOfFloors</th>
                <th>FacilityFree</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="facility" items="${facilityList}">
                <tr>
                    <td>${facility.id}</td>
                    <td>${facility.name}</td>
                    <td>${facility.area}</td>
                    <td>${facility.cost}</td>
                    <td>${facility.maxPeople}</td>
                    <td> <c:forEach items="${rentTypeList}" var="rentType">
                        <c:if test="${rentType.id == facility.rentTypeId}">
                            ${rentType.name}
                        </c:if>
                    </c:forEach>
                    </td>
                    <td>  <c:forEach items="${facilityTypeList}" var="facilityType">
                        <c:if test="${facilityType.id == facility.facilityTypeId}">
                            <span>${facilityType.name}</span>
                        </c:if>
                    </c:forEach>
                    </td>
                    <td>${facility. standardRoom}</td>
                    <td>${facility.descriptionOtherConvenience}</td>
                    <td>${facility.poolArea}</td>
                    <td>${facility.numberOfFloors}</td>
                    <td>${facility.facilityFree}</td>
                    <td><a href="/facility?action=update&id=${facility.id}" class="btn btn-warning">Update</a></td>
                    <td>
                        <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal"
                                onclick="showMe(${facility.id}, '${facility.name}')">
                            Delete
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <form action="/facility?action=delete" method="get">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title text-danger" id="exampleModalLabel">Facility</h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <b>ID Facility :</b>
                        <input type="text" readonly name="id" id="deleteId" class="form-control"><br>
                        <b>Facility Name</b>
                        <input type="text" readonly name="name" id="deleteName"class="form-control" ><br>
                        <h3 class="text-danger">Are you sure want delete </h3>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" name="action" value="delete">Yes</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="../style/jquery/jquery-3.5.1.min.js"></script>
<script src="../style/datatables/js/jquery.dataTables.min.js"></script>
<script src="../style/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="../style/bootstrap/bootstrap.bundle.min.js"></script>

<script>
    function showMe(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").value = name;
    }

</script>
<%@include file="../include/footer.jsp" %>
<script>
    $(document).ready(function () {
        $('#myTable').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 4
        });
    });
</script>

</body>
</html>
