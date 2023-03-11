<%--
  Created by IntelliJ IDEA.
  User: LAPTOP ACER
  Date: 06-10-2022
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3 style="text-align: center">Add Employee Form</h3>
<c:if test="${mess!=null}">
    <span style="color: red">${mess}</span>
</c:if>
<a href="/employee">Back Employee List!!!</a>
<form action="/employee?action=add" method="post">
    <pre>Name:     <input type="text" name="name"> </pre>
    <pre>Birthday: <input type="date" name="birthday"> </pre>
    <pre>Id Card:    <input type="text" name="idCard"> </pre>
    <pre>Salary:  <input type="text" name="salary"> </pre>
    <pre>Phone number:    <input type="text" name="phoneNumber"> </pre>
    <pre>Email:  <input type="text" name="email"> </pre>
    <pre>Address:  <input type="text" name="address"> </pre>
    <pre>Position ID:  <input type="number" name="positionId"> </pre>
    <pre>Education Degree ID:  <input type="number" name="educationDegreeId"> </pre>
    <pre>Division ID:  <input type="number" name="divisionId"> </pre>
    <pre>User Name ID:  <input type="text" name="userName"> </pre>

    <%--    <pre>ClassId:  <select name="classId">--%>
    <%--                    <option value="1">C12</option>--%>
    <%--                    <option value="2">C11</option>--%>
    <%--                    <option value="3">C10</option>--%>
    <%--                    </select></pre>--%>
    <pre>           <button type="submit">Save</button></pre>
</form>
</body>
</html>
