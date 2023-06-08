<%-- 
    Document   : orderList
    Created on : Apr 19, 2023, 4:44:05 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Order</title>
    </head>
    <body>
        <h1>ORDER HISTORY LIST</h1>
        <table border="1">
            <tr>
                <th>STT</th>
                <th>ID USER</th>
                <th>ORDER</th>
                <th>ORDER DETAILS</th>
                <th>TOTAL</th>
            </tr>
            <c:forEach varStatus="counter" var="o" items="${requestScope.order_list}">
                <tr>
                <form action="MainController" method="post">
                    <td>${counter.count}</td>
                    <td><input type="hidden" name="userID"> ${o.aid}</td>
                    <td>
                        <input type="hidden" name="orderID" value="${o.id}">
                        <input type="text" name="action" value="${o.createDate}"/>
                    </td>
                    <td>
                        <input type="hidden" name="orderDescription" value="${o.id}">
                        <input name="action" value="${o.description}"/>
                    </td>
                     <td>
                        <input type="hidden" name="orderTotal" value="${o.id}">
                        <input  name="action" value="${o.total},000 VND"/>
                    </td>

                </form>
                </tr>
            </c:forEach>
        </table>
        <form action="MainController" method="post">
        <button name="action" value ="index">HOME</button>
    </form>
        
    </body>
</html>
