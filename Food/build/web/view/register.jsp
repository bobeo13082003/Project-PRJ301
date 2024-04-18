<%-- 
    Document   : register
    Created on : Feb 23, 2024, 9:09:07 PM
    Author     : TT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Signup</title>
    </head>
    <style>
        *{
            margin: 0 auto;
        }
        .table{
            background-color: #D2E2ED;
            width: 50%;
            height: 350px;
            text-align: center;
            margin-top: 100px;
            margin-bottom: 100px;
            border: solid 2px black;
            border-radius: 3px;
        }
        form{
            margin: 50px
        }
        .register{
            padding: 5px 20px;
        }
        .in{
            margin: 10px;
        }
    </style>
    <body>
        <div class="table">
            <h1>Signup</h1>

            <form action="register" method="post">
                <table >
                    <tr>
                        <td class="in">User Name: <input type="text" name="username" required=""></td>
                    </tr>
                    <tr>
                        <td class="in">Password: <input type="Password" name="password" required></td>
                    </tr>
                    <tr>
                        <td class="in">First Name: <input type="text" name="firstname" required></td>
                    </tr>
                    <tr>
                        <td class="in">Last Name: <input type="text" name="lastname" required></td>
                    </tr>
                    <tr>
                        <td class="in">Phone: <input type="text" name="phone" required></td>
                    </tr>
                    <tr>
                        <td class="in">Address: <input type="text" name="address" required></td>
                    </tr>
                    <tr>
                        <td>
                            <input class="register" type="submit" value="Register">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Is a Menber?<a href="login">Login</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p style="color: red;"> ${requestScope.error} </p>
                            <p style="color: #4AC4F1;"> ${requestScope.success} </p>
                        </td>
                    </tr>
                </table>
            </form>

        </div>
    </body>
</html>
