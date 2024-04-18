<%-- 
    Document   : managep
    Created on : Feb 27, 2024, 10:44:39 PM
    Author     : TT
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #f5f5f5;
            }
            .action-buttons {
                display: flex;
                justify-content: space-around;
            }
            .action-buttons .action-edit,
            .action-buttons .action-delete{
                display: inline-block;
                padding: 10px 15px;
                background-color: #3498db;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                margin-top: 10px;
                cursor: pointer;
            }
            .action-buttons .action-delete{
                background-color: #e74c3c;
                margin-left: 10px;
            }
            .action-create{
                display: inline-block;
                padding: 10px 20px;
                background-color: orange;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                margin-top: 10px;
                cursor: pointer;
                height: 20px;
            }
        </style>
    </head>
<body>

    <div style="background-color: #2196F2; color: white; padding: 10px; display: flex; justify-content: space-between">
        <h2>Product Management</h2>
        <a class="action-create" href="home">Home</a>
        <a class="action-create" href="add">Create Product</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Images</th>
                <th>Describe</th>
                <th>Price</th>
                <th>Sale</th>
                <th>Category Name</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${requestScope.listP}" var="p">
                <tr>
                    <td>${p.id}</td>
                    <td>${p.name}</td>
                    <td><img style="width: 354px; height: 290px" src="${p.images}" alt="Products"/></td>
                    <td>${p.describe}</td>
                    <td><fmt:formatNumber pattern="##.#" value="${p.price * 2}" />$</td>
                    <td><fmt:formatNumber pattern="##.#" value="${p.price}" />$</td>
                    <td>${p.categories.name}</td>
                    <td class="action-buttons">
                        <a class="action-edit" href="update?uid=${p.id}">Edit</a> <br>
                        <a  class="action-delete" href="#" onclick="doDelete('${p.id}')">DELETE</a>
                    </td>
                </tr>
            </c:forEach>
            <!-- Add more rows as needed -->
        </tbody>
    </table>
</body>

<script>
    function doDelete(id) {
        if (confirm("Bạn có chắc chắn muốn xóa sản phẩm" + id)) {
            window.location = "delete?id=" + id;
        }
    }
</script>
</html>
