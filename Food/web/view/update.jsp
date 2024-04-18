<%-- 
    Document   : update
    Created on : Feb 29, 2024, 1:26:08 PM
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
        <h1>Edit Product</h1>
        <c:set var="p" value="${requestScope.product}" />
        <form method="post">

            <label for="name">Name Product:</label>
            <input type="text" id="name" name="name" value="${p.name}" required>

            <label for="images">Images(URL):</label>
            <input type="text" id="images" name="images" value="${p.images}" placeholder="(jpg,pgj,...)" required>

            <label for="describe">Describe:</label>
            <input type="text" id="describe" name="describe" value="${p.describe}" required>

            <label for="price">Price:</label>
            <input type="text" id="price" value="${p.price}" name="price" required>

            <label for="categoryname">Categories(1.Beef,2.Pork,3.Lamb,4.Poultry,5.Seafood,6.Sausage):</label>
            <input type="text" name="categoryname" value="${p.categories.id}">

            <button type="submit">EDIT PRODUCT</button>

        </form>
        <button onclick="location.href = 'managep'" type="submit">Home</button>
        <h5 style="color: #4AC4F1">${requestScope.succes}</h5>
        <h5 style="color: red">${requestScope.fail}</h5>
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
