<%-- 
    Document   : cart
    Created on : Mar 4, 2024, 10:49:37 AM
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
        <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="styles.css">
            <title>Shopping Cart</title>
        </head>
        <body>
            <div class="cart-container">
                <a href="home" class="home-link">Home</a>
                <h3 style="color: #4AC4F1; text-align: center">${requestScope.success}</h3>
                <h2>Your Shopping Cart</h2>
                <c:set value="${requestScope.pcart}" var="p"/>
                <c:forEach items="${p.items}" var="i">
                    <div class="product">
                        <img src="${i.products.images}" alt="Product 1">
                        <div class="product-details">
                            <h3>${i.products.describe}</h3>
                            <p>Price: <fmt:formatNumber pattern="##.#" value="${i.price}" />$</p>

                            <p>Quantity: ${i.quantity}</p>
                            <p>Total: <fmt:formatNumber pattern="##.#" value="${i.price * i.quantity}" />$</p>
                            <form action="remove">
                                <input type="hidden" name="id" value="${i.products.id}">
                                <input type="submit" value="Remove">
                            </form>
                        </div>
                    </div>
                </c:forEach>

                <div class="total">
                    <p>Total Money:<fmt:formatNumber pattern="##.#" value="${p.getTotalMoney()}" />$</p>
                    <form method="post" action="checkout">
                        <c:set value="${requestScope.pcart}" var="p"/>
                        <c:set value="${c.items}" var="o" />
                            <input type="hidden" name="proId" value="${o.products.id}">
                        <input class="check-out" type="submit" value="Check Out">
                    </form>
                </div>
            </div>
        </body>
    </html>
</body>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }

    .cart-container {
        max-width: 800px;
        margin: 50px auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
    }

    .product {
        display: flex;
        margin-bottom: 20px;
    }

    .product img {
        width: 100px;
        height: 100px;
        object-fit: cover;
        margin-right: 20px;
        border-radius: 4px;
    }

    .product-details {
        flex-grow: 1;
    }

    .total {
        text-align: right;
        margin-top: 20px;
    }
    .home-link {
        display: block;
        text-align: center;
        margin-bottom: 20px;
        text-decoration: none;
        color: #333;
        font-weight: bold;
    }

    .home-link:hover {
        color: blue;
    }
    .check-out{
        text-decoration: none;
        border: solid green;
        color: white;
        background-color: green;
        padding: 10px;
        border-radius: 5px;
        margin: 10px;
    }
</style>
</html>
