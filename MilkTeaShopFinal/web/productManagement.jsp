<%-- 
    Document   : productManagement
    Created on : Apr 16, 2023, 9:23:20 PM
    Author     : Admin
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Management</title>
    </head>
    
    <body>
        <h4> ${requestScope.status} </h4>
        <h1 style="text-align: center">List Product Management</h1>
        <form action="MainController" method="post">
            <h3>ADD PRODUCT:</h3>
            Product name: <input name="txt_pname" placeholder="Enter product name"/><br>
            Price       : <input name="txt_price" placeholder="Enter price"/><br>
            Image path  : <input name="txt_imagePath" placeholder="Enter image path"/><br>
            <button name="action" value="AddProduct"> ADD </button><br>
            <form action="MainController" method="post" style="text-align: center;margin: 20px">
                Search: <input name="txt_search" value="${param.txt_search}"/>
                <button name="action" value="AddProduct">Search</button>
            </form>



        </form>



        <table border="1">

            <tr>
                <th>ID PRODUCT</th>
                <th>PRODUCT NAME</th>
                <th> PRICE</th>
                <th>IMAGE PATH</th>
                <th>IMAGE</th>
                <th>STATUS</th>               
                <th>UPDATE</th>
                <th>DELETE</th>
            </tr>

            <c:forEach var="p" items="${requestScope.product_list}">
                <tr>
                <form action="MainController" method="post">

                    <td><input type="hidden" name="txt_id" value="${p.id}" />${p.id}</td>
                    
                    <td><input name="txt_pname" value="${p.pname}"/></td>
                    <td><input name="txt_price" value="${p.price},000 VND"/></td>
                    <td><input name="txt_imagePath" value="${p.imagePath}"/></td>
                    <td><img src="${p.imagePath}" style="width: 10vh; height: 8vw"></td>
                    <td>
                        <select name="txt_status" >
                            <option ${p.status == '1' ? 'selected' : ''} value="1">STOCKING</option>
                            <option ${p.status == '0' ? 'selected' : ''} value="0">SOLD OUT</option>
                        </select>
                    </td>
                    <td><button name="action" value="UpdateProduct">Update</button></td>
                    <td><button name="action" value="DeleteProduct">Delete</button></td>

                </form>
                    </tr>
               
                </c:forEach>
        </table>


        <form action="MainController" method="post">
            <button name="action" value ="index">HOME</button>
        </form>


    </body>
</html>
