<%@page import="Model.Account"%>
<%@page import="Model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title> MILK TEA SHOP</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!" style="color: brown">PUTA MILK TEA</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!" style="color: brown">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!" style="color: brown">About</a></li>
                        <li class="nav-item dropdown">

                            <!--Tao nut show Order List cho User-->
                            <c:if test="${sessionScope.login_user.role == 'US'}">
                                <form action="MainController" method="post">
                                    <li><input type="hidden" name="list" value="${sessionScope.login_user.id}"/></li>
                                    <button name="action" value="ShowOrder" class="nav-link active" aria-current="page"  style="color: brown"> Oder History List</button>
                                </form>

                            </c:if>


                            <!--Tao quan lý User/San pham-->

                            <c:if test="${sessionScope.login_user.role =='AD'}">
                                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: brown"> Management</a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">

                                    <form action="MainController" method="post">
                                        <li><button name="action" value="AccountManagement" class="dropdown-item" style="color: brown">User Management</button></li> 
                                    </form>
                                    <form action="MainController" method="post">
                                        <li><button name="action" value="Product" class="dropdown-item" style="color: brown">Milk Tea Management</button></li>
                                    </form>
                                    <form action="MainController" method="post">
                                        <li><input type="hidden" name="list" value="ADMIN"/></li>
                                        <li><button name="action" value="ShowOrder" class="dropdown-item" style="color: brown"> Order History List Management</button></li>
                                </form>
                                </ul> 
                            </c:if>
                        </li>
                    </ul>
                    <form action="MainController" method="post" class="d-flex" >
                        <c:if test="${sessionScope.login_user == null or sessionScope.login_user.role =='US'}" >
                            <button name="action" value="ShowCart" class="btn btn-outline-dark" type="submit" style="color: brown">
                                <i class="bi-cart-fill me-1"></i>
                                Cart
                                <!--Tao session so luong add to cart hien tren gio hang-->
                                <span class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.cart.getSize()}</span>
                            </button>
                        </c:if>                      
                        <!--Tao Login-->
                        <!--Implcit : Giong nhau hay khong-->
                        <c:if test="${empty sessionScope.login_user}">
                            <a href="login.jsp" style="font-weight: bold; margin-left: 40px; text-align: center;color: brown">LOG IN</a>
                            <a href="createUser.jsp" style="font-weight: bold; margin-left: 20px; text-align: center ;color: brown">SIGN IN</a>

                            <c:if test="${not empty requestScope.login_status}">
                                <p>${requestScope.login_status}</p>
                            </c:if>
                        </c:if>
                        <c:if test="${not empty sessionScope.login_user}">
                            <p style="font-weight: 400; margin-left: 20px; text-align: center ;color: brown">Welcome ${sessionScope.login_user.fullname}</p>
                            <div>
                                <a href="LogoutController" style="font-weight: 700; margin-left: 20px; text-align: center ;color: brown">LOG OUT</a>
                            </div>
                        </c:if>

                    </form>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header  class="py-5" style="text-align: center" >
            <img src="imagePath/Banner/item.jpg" width="1200" height="400" >        
        </header>
        <!--Title-->
        <h2 style="margin: 20px; text-align: center; color: brown; font-weight: bolder">Best Seller:</h3>

        <!--SHOW SAN PHAM-->
        <!-- Section-->

        <section class="py-5">
            <div class="container px-4 px-lg-10 mt-5" >
                <div class="row gx-4 gx-lg-10 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

                    <% request.setAttribute("product_list", DAOProduct.ToolProduct.getAllProduct());%>


                    <c:forEach begin="0" end="10" var="p" items="${requestScope.product_list}">
                        <c:if test="${p.status == '1'}">

                            <div class="col mb-5">
                                <div class="card h-100">
                                    <!-- Sale badge-->

                                    <!-- Product image-->
                                    <img style="width: 100%; height: 50vh" src="${p.imagePath}" alt="..." />
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder">${p.pname}</h5>
                                            <!-- Product reviews-->
                                            <div class="d-flex justify-content-center small text-warning mb-2">
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                            </div>
                                            <!-- Product price-->
                                            ${p.price},000 VND
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent text-center">
                                        <form action="MainController" method="post">
                                            <input type="hidden" name="txt_id" value="${p.id}"/>

                                            <button name="action" value="AddToCart" class="text-center">Add to cart</button>


                                        </form>

                                    </div>
                                </div>
                            </div>
                        </c:if>         
                    </c:forEach>


                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5" style="background-color: #993300">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
</body>
</html>