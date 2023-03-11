<%--
  Created by IntelliJ IDEA.
  User: LAPTOP ACER
  Date: 07-10-2022
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Form Edit</title>
</head>
<body>
<h3 style="text-align: center">Edit Employee Form</h3>
<a href="/employee">Back Employee List!!!</a>
<form action="/employee?action=edit&id=${id}" method="post">
    <pre>Name:     <input type="text" name="name" value="${employee.getName()}"> </pre>
    <pre>Birthday: <input type="date" name="birthday" value="${employee.getDateOfBirth()}"> </pre>
    <pre>Id Card:    <input type="text" name="idCard" value="${employee.getIdCard()}"> </pre>
    <pre>Salary:  <input type="text" name="salary" value="${employee.getSalary()}"> </pre>
    <pre>Phone number:    <input type="text" name="phoneNumber" value="${employee.getPhoneNumber()}"> </pre>
    <pre>Email:  <input type="text" name="email" value="${employee.getEmail()}"> </pre>
    <pre>Address:  <input type="text" name="address" value="${employee.getAddress()}"> </pre>
    <pre>Position ID:  <input type="number" name="positionId" value="${employee.getPositionId()}"> </pre>
    <pre>Education Degree ID:  <input type="number" name="educationDegreeId" value="${employee.getEducationDegreeId()}"> </pre>
    <pre>Division ID:  <input type="number" name="divisionId" value="${employee.getDivisionId()}"> </pre>
    <pre>User Name ID:  <input type="text" name="userName" value="${employee.getUsername()}"> </pre>
    <pre><button type="submit">Save</button></pre>
</form>
</body>
</html>
