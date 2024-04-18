<%-- 
    Document   : add
    Created on : Feb 29, 2024, 10:46:19 AM
    Author     : TT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>ADD Products</h1>
        <form action="add" method="post">
            <label for="name">Name Product:</label>
            <input type="text" id="name" name="name" required>

            <label for="images">Images(URL):</label>
            <input type="text" id="images" name="images" placeholder="imges/...(jpg,pgj,...)" required>

            <label for="describe">Describe:</label>
            <input type="text" id="describe" name="describe" required>

            <label for="price">Price:</label>
            <input type="text" id="price" name="price" required>

            <label for="categoryname">Categories:</label>

            <select id="categoryname" name="categoryname" required>
                <c:forEach items="${requestScope.listC}" var="c">
                    <option value="${c.id}">${c.name}</option>
                </c:forEach>
            </select>
            <br/>
            <button type="submit">ADD PRODUCT</button>
            <h5 style="color: #4AC4F1">${requestScope.succes}</h5>
            <h5 style="color: red">${requestScope.fail}</h5>
        </form>
        <button onclick="location.href='home'" type="submit">Home</button>
    </body>
    <style>

        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        form {
            max-width: 600px;
            margin: auto;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            display: inline-block;
            box-sizing: border-box;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 15px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        #categoryname{
            padding: 10px;
            padding-right: 20px;
            width: 180px;
            margin-bottom: 20px;
        }
    </style>
</html>
