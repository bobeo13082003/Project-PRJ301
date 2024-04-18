<%-- 
    Document   : profile
    Created on : Mar 12, 2024, 10:53:35 PM
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
        <div class="profile-container">
            <img style="width: 100px" src="images/profile.jpg" alt="Profile"/>
            <div>
                <form action="profile" method="post">
                    <table>
                        <c:set value="${requestScope.accPro}" var="a"/>
                        <tbody>
                            <tr>
                                <td><h1>${a.username}</h1></td>
                            </tr>
                            <tr>
                                <td>Password:</td>
                                <td><input type="password" name="password" value="${a.password}"></td>
                            </tr>
                            <tr>
                                <td>First Name:</td>
                                <td><input type="text" name="firstname" value="${a.firstname}"></td>
                            </tr>
                            <tr>
                                <td>LastName:</td>
                                <td><input type="text" name="lastname" value="${a.lastname}"></td>
                            </tr>
                            <tr>
                                <td>Phone:</td>
                                <td><input type="text" name="phone" placeholder="+84 " value="${a.phone}"></td>
                            </tr>
                            <tr>
                                <td>Address:</td>
                                <td><input type="text" name="address"value="${a.address}"></td>
                            </tr>
                            <tr>
                                <td><input type="hidden" name="id"value="${a.id}"></td>
                            </tr>
                            <tr>
                                <td>
                                    <input id="sub" type="submit" value="Save">
                                    <p style="color: #3498db">${requestScope.succes}</p>
                                    <p style="color: red">${requestScope.error}</p>
                                </td>
                            </tr>
                            <tr>
                                <td><a id="home" href="home">Home</a></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>

        </div>



    </body>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        .profile-container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        table {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            margin: auto;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        #sub{
            width: 96px;
            height: 36px;
            background-color: green;
            color: white;
            border: green;
            border-radius: 4px;
        }
        #home{
            text-decoration: none;
            padding: 10px;
            background-color: black;
            color: white;
            border-radius: 3px;
        }
    </style>
</html>
