<%-- 
    Document   : Login
    Created on : Apr 12, 2023, 1:28:32 PM
    Author     : Admin
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Milk Tea</title>
    </head>
    <body>
        <h1> Welcome Back! Log in to continue. </h1>
        <c:if test="${requestScope.message != null}">
            <h1 style="color: red; text-align: center">${requestScope.message}</h1>
        </c:if>
        <form action="LoginController" method="POST"  style= "font-weight: bold; margin: 20px " >

            User Name: <input name="txt_username" placeholder="ENTER USERNAME" style="margin: 5px"/><br>
            Password:  <input type="password" name="txt_password" placeholder="ENTER PASSWORD" style="margin-bottom: 10px" /><br>

            <button> LOG IN </button>
            <a href="createUser.jsp" ><button>SIGN IN</button> </a>
        </form>
            

    <c:if test="${not empty requestScope.login_status}">
        <p>${requestScope.login_status}</p>
    </c:if>

</body>
</html>
