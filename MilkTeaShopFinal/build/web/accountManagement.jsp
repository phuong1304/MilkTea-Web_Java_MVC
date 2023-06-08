<%-- 
    Document   : accountManagement
    Created on : Apr 14, 2023, 11:27:47 PM
    Author     : Admin
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Management</title>
    </head>
    <body>
        <h1 style="text-align: center"> LIST USER ACCOUNT</h1>
        <form action="MainController" method="post">
            <!--Tao search-->
            Search: <input name="txt_search" value="${param.txt_search}" /> 
            <button name="action" value="AccountManagement">Search</button>
        </form>

        <h4> ${requestScope.status} </h4>

        <table border="1">

            <tr>
                <th>ID</th>
                <th>USER NAME</th>
                <th> FULL NAME</th>
                <th>PHONE</th>
                <th>ADDRESS</th>
                <th>ROLE</th>
                <th>STATUS</th>
                <th>UPDATE</th>
                <th>DELETE</th>
            </tr>


            <c:forEach var="a" items="${requestScope.account_list}">
                <tr>
                <form action="MainController" method="post">
                    <input type="hidden" name="txt_id" value="${a.id}"/>
                    <td>${a.id}</td>
                    <td>${a.username}</td>
                    <td>${a.fullname}</td>
                    <td>${a.phone}</td>
                    <td>${a.address}</td>
                    <td>
                        <select name="txt_role">
                            <option ${a.role == 'AD' ? 'selected' : ''} value="AD">AD</option>
                            <option ${a.role == 'US' ? 'selected' : ''} value="US">US</option>
                        </select>
                    </td>
                    <td>                        
                        <select name="txt_status">
                            <option ${a.status == '1' ? 'selected' : ''} value="1">ACTIVE</option>
                            <option ${a.status == '0' ? 'selected' : ''} value="0">BANNED</option>
                        </select>
                    </td>
                    <td><button name="action" value="Update">Update</button></td>
                    <td><button name="action" value="DeleteAccount">Delete</button></td>
                    <td>
                </form>
            </tr>

        </c:forEach>
    </table>

    <form action="MainController" method="post">
        <button name="action" value ="index">HOME</button>
    </form>


</body>
</html>
