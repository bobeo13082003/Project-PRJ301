<%-- 
    Document   : login
    Created on : Feb 20, 2024, 2:23:14 PM
    Author     : TT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Food Shop</title>
    </head>
    <style>
        *{
            margin: 0 auto;
        }
        .table{
            background-color: #D2E2ED;
            width: 30%;
            height: 300px;
            text-align: center;
            margin-top: 100px;
            margin-bottom: 100px;
            border: solid 2px black;
            border-radius: 3px;
        }
        form{
            margin: 50px
        }

        .login{
            margin: 10px;
            padding: 5px 20px;

        }
        .in{
            margin: 10px;
        }
    </style>

    <body>
        <div class="table">
            <h1>Login</h1>

            <form action="login" method="post">
                <table >
                    <tr>
                        <td class="in">User Name: <input type="text" name="username"required></td>
                    </tr>
                    <tr>
                        <td class="in">Password: <input type="Password" name="password"required></td>
                    </tr>
                    <tr>
                        <td>
                            <input class="login" type="submit" value="Login">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Not a Menber?<a href="register">Register Hear</a>
                        </td>
                    </tr>
                    <tr>
                        <td> 
                            <br/>
                            <a href="home">Shop</a>
                        </td>
                    </tr>
                    <tr>
                        <td><p style="color: red">${requestScope.error}</p></td>
                    </tr>
                </table>
            </form>
            
        </div>
    </body>
</html>
