<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 26/09/2022
  Time: 10:15 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Currency Converter</title>
    <link rel="stylesheet" type ="text/css" href="css/style.css">
  </head>
  <body>
  <h2>Currency Converter</h2>
  <form action="">
    <label for="rate">Rate: </label><br/>
    <input type="text" id="rate" name="rate" placeholder="RATE" value="22000"/><br/>
    <label for="usd">USD: </label><br/>
    <input id="usd" type="text" name="usd" placeholder="USD" value="0"/><br/>
    <input type="submit" id="submit" value="Converter"/>
  </form>
  </body>
</html>
