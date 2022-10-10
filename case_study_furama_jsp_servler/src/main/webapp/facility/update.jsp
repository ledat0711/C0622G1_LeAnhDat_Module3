<%--
  Created by IntelliJ IDEA.
  User: Gia Nguyen Store
  Date: 8/4/2022
  Time: 11:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Service</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../style/bootstrap/normalize.css">
    <link rel="stylesheet" href="../style/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../style/datatables/css/dataTables.bootstrap4.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <link rel="stylesheet" href="../style/style.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"/>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body> <%@ include file="../include/header.jsp" %>
<div class="container">
    <form action="/facility?action=update" method="post">
        <div class="mb-3">
            <select onchange="choose()" id="select" name="chooseFacility" class="form-select">
                <option >Choose Update Service</option>
                <option value="villa">Villa</option>
                <option value="house">House</option>
                <option value="room">Room</option>
            </select>
        </div>
        <input type="hidden" name="id" value="${facility.id}">
        <div class="mb-3">
            <label for="name" class="form-label">Name :</label>
            <input type="text" class="form-control" id="name" name="name" value="${facility.name}" >
            <p style="color: red">${errors.get('nameErrors')}</p>
        </div>
        <div class="mb-3">
            <label for="area" class="form-label">Area :</label>
            <input type="text" class="form-control" id="area" name="area"value="${facility.area}" >
        </div>
        <div class="mb-3">
            <label for="cost" class="form-label">Cost</label>
            <input type="text" class="form-control" id="cost" name="cost" value="${facility.cost}">
        </div>
        <div class="mb-3">
            <label for="max" class="form-label"> Max people</label>
            <input type="text" class="form-control" id="max"  name="maxPeople" value="${facility.maxPeople}">
        </div>
        <div class="mb-3">
            <select id="rent_type" class="form-control" name="rentTypeId"value="${facility.rentTypeId}">
                <option selected disabled>Choose Rent Type</option>
                <c:forEach items="${rentTypeList}" var="rentType">
                    <option value="${rentType.id}">${rentType.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <select id="facility_type_id" class="form-control" name="facilityTypeId"value="${facility.facilityTypeId}">
                <option selected disabled>Choose Facility Type</option>
                <c:forEach items="${facilityTypeList}" var="facilityType">
                    <option value="${facilityType.id}">${facilityType.name}</option>
                </c:forEach>
            </select>

        </div>
        <div class="mb-3" id ="add" style="display: none">
            <label for="standard_room" class="form-label">Standard_room :</label>
            <input type="text" class="form-control" id="standard_room" name="standardRoom" value="${facility.standardRoom}" >
        </div>
        <div class="mb-3" id ="add1" style="display: none">
            <label for="convenience" class="form-label">Convenience :</label>
            <input type="text" class="form-control" id="convenience" name="descriptionOtherConvenience" value="${facility.descriptionOtherConvenience}">
        </div>
        <div class="mb-3" id="add2"style="display: none" >
            <label for="pool_area" class="form-label">Pool_area :</label>
            <input type="text" class="form-control" id="pool_area" name="poolArea" value="${facility.poolArea}" >
        </div>
        <div class="mb-3" id ="add3"style="display: none">
            <label for="floors" class="form-label">Number_of_floors :</label>
            <input type="text" class="form-control" id="floors"  name="numberOfFloors" value="${facility.numberOfFloors}">
            <p style="color: red">${errors.get('numberOfFloorsErrors')}</p>
        </div>
        <div class="mb-3" id="add4"style="display: none">
            <label for="facility" class="form-label">Facility_free :</label>
            <input type="text" class="form-control" id="facility" name="facilityFree"value="${facility.facilityFree}"  >
        </div>
        <div>
            <button class="btn btn-success" name="action" type="submit">Accept</button>
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
            </button>
        </div>

    </form>
</div>
<script>
    function choose(){
        let result = document.getElementById("select").value;
        switch (result) {
            case "room":
                document.getElementById("add").style.display = "none";
                document.getElementById("add1").style.display = "none";
                document.getElementById("add2").style.display = "none";
                document.getElementById("add3").style.display = "none";
                document.getElementById("add4").style.display = "block";
                break;
            case "house":
                document.getElementById("add").style.display = "block";
                document.getElementById("add1").style.display = "block";
                document.getElementById("add2").style.display = "none";
                document.getElementById("add3").style.display = "block";
                document.getElementById("add4").style.display = "none";
                break;
            case "villa":
                document.getElementById("add").style.display = "block";
                document.getElementById("add1").style.display = "block";
                document.getElementById("add2").style.display = "block";
                document.getElementById("add3").style.display = "block";
                document.getElementById("add4").style.display = "none";
                break;

        }
    }
</script>
<script src="../style/jquery/jquery-3.5.1.min.js"></script>
<script src="../style/datatables/js/jquery.dataTables.min.js"></script>
<script src="../style/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="../style/bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>
