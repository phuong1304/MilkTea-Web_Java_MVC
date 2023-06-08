<%-- 
    Document   : CreateUser
    Created on : Apr 12, 2023, 3:49:33 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 >Create New User: </h1>

        <form action ='CreateUserController' method="POST">

            User name: <input name='txt_username' type='text' placeholder="Enter user name"></br>
            Password : <input name='txt_password' type='password'values='Password'placeholder="Enter password"></br>
            Full name: <input name='txt_fullname' type='text' placeholder="Enter full name"></br>
            Phone    : <input name='txt_phone' type='number' placeholder="Enter phone"></br>
            Address  : <input name='txt_address' type='text' placeholder="Enter address"></br>
            <button>SIGN UP</button>
            <c:if test="${not empty requestScope.login_status}">
                <p>${requestScope.login_status}</p>
            </c:if>

        </form> 

    </body>
</html>
