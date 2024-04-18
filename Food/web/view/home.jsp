<%-- 
    Document   : home
    Created on : Feb 24, 2024, 12:56:41 PM
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
        <div class="header" style="display: flex;justify-content: space-between">
            <h1>Welcome Shop</h1>
            <div class="header_menu">
                <div class="header-menu__items">
                    <a href="home">Home</a>
                    <p style="font-size: 20px; color: white;margin-top: 0;"> / </p>
                    <a href="show">Cart</a>
                    <c:if test="${sessionScope.accounts == null}">
                        <p style="font-size: 20px; color: white;margin-top: 0;"> / </p>
                        <a href="login">Login</a>
                    </c:if>
                    <c:if test="${sessionScope.accounts != null}">
                        <p style="font-size: 20px; color: white;margin-top: 0;"> / </p>
                        <a href="logout">Logout</a>
                        <p style="font-size: 20px; color: white;margin-top: 0;"> / </p>
                        <c:set value="${sessionScope.accounts}" var="x" />
                        <a href="profile?proid=${x.id}">Profile</a>
                    </c:if >
                    <c:if test="${sessionScope.accounts.role == true}">
                        <p style="font-size: 20px; color: white;margin-top: 0;"> / </p>
                        <a href="managep">Management Products</a>
                    </c:if>

                </div>
                <c:if test="${sessionScope.accounts != null}">
                    <div class="account">
                        <h3> Hello ${sessionScope.accounts.firstname} ${sessionScope.accounts.lastname}</h3>
                    </div>
                </c:if>

            </div>
        </div>

        <div class="container">
            <div class="grid__row">
                <div class="grid__column-2">
                    <nav class="categori">
                        <div style="background-color: #822427; color: white; padding: 5px 20px;">
                            <h3 class="categori-heading">
                                Categories
                            </h3>
                        </div>
                        <form action="search" method="post">
                            <h3 class="search-text">Search</h3> <br>
                            <input class="in-search" type="text" name="search" placeholder="search"><br>
                            <input class="in-search" type="submit" value="Search">
                            <p style="color: red">${requestScope.notFound}</p>
                        </form>

                        <ul class="categori-list">
                            <c:forEach var="c" items="${requestScope.listC}">
                                <li class="categori-list-item categori-list-item-active">
                                    <a href="category?id=${c.id}" class="categori-item-link">${c.name}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </nav>
                </div>


                <div class="grid__column-10">
                    <ul class="list-product">
                        <c:forEach var="p" items="${requestScope.listP}">
                            <li class="li-product">
                                <a href="detail?pid=${p.id}">
                                    <img src="${p.images}" />
                                    <h3>${p.describe}</h3>
                                    <p style="text-decoration: line-through solid rgb(68, 68, 68);">
                                        Price:<fmt:formatNumber pattern="##.#" value="${p.price * 2}" />$
                                        <span class="old"></span> 
                                    </p>
                                    <p>Sale: ${p.price}$</p>
                                </a>
                                <div style="display: flex; justify-content: center; margin: 10px 10px;">
                                    <a href="cart?cid=${p.id}&quantity=${1}" class="cart-btn">ADD TO CART</a>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>


    </body>
    <style>
        .grid__row {
            display: flex;
            flex-wrap: nowrap;
            margin-left: -12px;
            margin-right: -12px;
        }

        .grid__column-2 {
            box-shadow: 2px 1px 4px 0px #af9d9d;
            padding-left: 12px;
            padding-right: 12px;
            width: 16.6667%;
            height: 490px;
        }

        .grid__column-10 {
            padding-left: 12px;
            padding-right: 12px;
            width: 83.3334%;
        }

        .categori-list a {
            text-decoration: none;
        }

        .categori-list {
            list-style: none;
            padding: 0;
        }

        .categori-list-item {
            margin: 20px;
        }

        .search-text {
            margin: 20px 20px;
        }

        .list-product {
            list-style: none;
            padding: 0;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .li-product {
            width: calc(33.3333% - 30px); /* Adjusted width to fit three items */
            text-align: center;
            margin: 15px;
            border: solid chocolate;
            border-radius: 10px;
            box-sizing: border-box;
        }

        .li-product img {
            width: 254px;
            height: 190px
        }

        .li-product a {
            text-decoration: none;
        }
        .li-product:hover{
            background-color: #FFA987;
        }
        .li-product .buy-btn,
        .li-product .cart-btn {
            display: inline-block;
            padding: 10px 15px;
            background-color: #3498db;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 10px;
            cursor: pointer;
        }

        .li-product .cart-btn {
            background-color: #e74c3c;
            margin-left: 10px;
        }
        p {
            margin: 5px;
            color: blue;
            font-size: 12px;
        }

        .old {
            text-decoration: line-through;
            color: orange;
        }

        .in-search{
            margin: 5px 5px;
            padding: 5px 15px;
        }
        .header_menu{
            display: flex;
            background-color: #822427;
            color: white;
            width: 800px;
            height: 46px;
            margin-top: 15px;
            justify-content: space-between;
        }
        .header_menu a{
            color: white;

        }
        .header-menu__items{
            display: flex;
            margin:10px;
        }
        .account{
            margin-right: 20px;
        }
        .account h3{
            font-family: "Arial Black", Gadget, sans-serif;
        }
    </style>
</html>
