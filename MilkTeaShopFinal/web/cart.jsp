<%-- 
    Document   : cart
    Created on : Apr 19, 2023, 1:34:16 AM
    Author     : Admin
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CART</title>
    </head>
    <body>
        <h2>Your Cart: </h2>
        <p style="color: brown; font-weight: bolder"> ${requestScope.status} </p>
        <c:if test="${requestScope.status != 'BUY SUCCESSFULLY'}">
        <table border="1">
            <tr>
                <th>NAME PRODUCT</th>
                <th>IMAGE</th>
                <th>PRICE</th>
                <th>QUANTITY</th>
<!--                <th>SUM PRICE</th>-->
                <th>UPDATE</th>
                <th>DELETE</th>
            </tr>
            <c:set var="cart" value="${sessionScope.cart}"/>
            <!--Lay product_list tu ShowCartController-->
            <c:forEach var="p" items="${requestScope.product_list}">
                <tr>
                    <!--Tao total lay tu cac id san pham da chon-->
                    <c:set var="total" value="${total+ p.price* cart.getQuantity(p.id)}"/>
                <form action="MainController" method="post"> 
                    <td>${p.pname}</td>
                    <td><img style="width: 6vw; height: 20vh" src="${p.imagePath}" ></td>
                    <td>${p.price},000 VND</td>
                    <td><input type="number" min="1" max="20" value="${cart.getQuantity(p.id)}" name="txt_quantity"/> </td>
                    <input type="hidden" name="txt_id" value="${p.id}"/>
                    <td><button name="action" value="UpdateCart" >Update</button></td>
                    <td><button name="action" value="DeleteCart">Delete</button></td>
                </form>

                </tr>
            </c:forEach>
        </table>
            <h3>Total: ${total},000 VND</h3>
        <form action="MainController" method="post">
            <!--Khi an nut Order/Buy don hang + total se di theo va lam moi Cart-->
            <input type="hidden" name="txt_total" value="${total}"/> 
            <input type="hidden" name="txt_username" value="${sessionScope.login_user}"/>
            <button name="action" value="Buy" style="font-weight: bold"> ORDER/BUY</button>
        </form>            
        </c:if>

        
        <form action="MainController" method="post">
            <button name="action" value ="index" style="margin: 20px">HOME</button>
        </form>
    </body>
</html>
