<%-- 
    Document   : detail
    Created on : Feb 28, 2024, 11:18:44 PM
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

        <div class="container">
            <div id="product-details">
                <div id="image-detail">
                    <img src="${pDetail.products.images}" alt="Product Image">
                </div>
                <h2>${pDetail.products.describe}</h2>
                <p class="description">${pDetail.description}</p>
                Price:<p class="price">
                    <fmt:formatNumber pattern="##.#" value="${pDetail.products.price * 2}" />$
                </p>
                Sale:<p class="price">
                    <fmt:formatNumber pattern="##.#" value="${pDetail.products.price}" />$
                </p>
                <form action="cart">
                    Enter Quantities:
                    <input type="text" name="quantity" required="">
                    <br/>
                    <input type="hidden" name="cid" value="${pDetail.products.id}">
                    <input type="submit" class="buy-btn" value="+ ADD TO CART">
                </form>


                <a href="home" class="cart-btn">Back to home</a>
            </div>
        </div>
    </body>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }

        #product-details {
            background-color: #fff;
            padding: 20px;
            margin-top: 60px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        #product-details img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        #product-details h2 {
            color: #333;
        }

        #product-details p {
            color: #666;
        }

        #product-details .price {
            color: #c0392b;
            font-size: 1.5em;
            font-weight: bold;
            margin-top: 10px;
        }

        #product-details .buy-btn,
        #product-details .cart-btn {
            display: inline-block;
            padding: 10px 15px;
            background-color: #3498db;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 10px;
            cursor: pointer;
        }

        #product-details .cart-btn {
            background-color: #e74c3c;
            margin-left: 10px;
        }
    </style>
</html>
