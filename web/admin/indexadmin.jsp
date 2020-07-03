<%-- 
    Document   : indexadmin
    Created on : Oct 7, 2019, 7:41:30 AM
    Author     : root
--%>

<%@page import="com.poly.DAO.productDAO"%>
<%@page import="com.poly.DAO.contactDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.poly.model.contact"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Store DEMO</title>
        <link rel="stylesheet" href="../css/styleadmin.css">
        <link href='../image/fpt.ico' rel='icon' />
        <script src="../script/script.js"></script>
    </head>
    <body>
        <%
            pageContext.setAttribute("contact DAO", new contactDAO());
            pageContext.setAttribute("product DAO", new productDAO());
        %>
        <table border="0" class="menu-chinh">
            <tr>
                <th>
                    <nav class="menu">
                        <ul class="control-menu">
                            <li> <a href="../index.jsp"> TRANG CHỦ </a> </li>
                            <li> <a href="1.html"> GIỚI THIỆU </a> </li>
                            <li>
                                <a href="2.html"> LIÊN HỆ </a>
                                <ul>
                                    <li><a href="#">SĐT: 0123456789</a></li>
                                    <li><a href="#">Email: thptbinhan@edu.vn</a></li>
                                </ul>
                            </li>
                            <li> <a href="3.html"> GÓP Ý </a> </li>
                            <li> <a href="#4"> HỎI ĐÁP </a> </li>
                            <a href="login.jsp" class="login">Đăng Nhập /</a>
                            <a href="indexadmin.jsp" class="register">Đăng Ký</a>
                        </ul>
                    </nav>
                </th>
            </tr>
        </table>
        <table>
            <tr>
                <th>
                    <nav class="menu_1">
                        <ul>
                            <li>
                                <a href="#" onclick="openSearch()"> Search</a>
                            </li>
                            <li>
                                <a href="#" onclick="openAdd()">Add Users</a>
                            </li>
                            <li>
                                <a href="#" onclick="openProduct()" >Add Product</a>
                            </li>
                        </ul>                         
                    </nav>
                </th>
            </tr>
        </table>        
        <div class="row">
            <table class="tableuser">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Username</th>
                        <th scope="col">Edit</th>
                        <th scope="col">Delete</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dong" items="${contactDAO().fillAll()}">
                        <tr>
                            <td>${dong.id}</td>
                            <td>${dong.username}</td>
                            <td>
                                <input type="hidden" name="idl" value="${dong.id}"/>
                                <button class="btn-action" onclick="openEdit()">Edit</button>

                            </td>
                            <td>
                                <form action="control_contact" method="POST">
                                    <input type="hidden" name="id" value="${dong.id}"/>
                                    <button type="submit" class="btn-action" name="action" value="delete">Delete</button>
                                </form>
                            </td>
                            <td></td>
                        </tr> 
                    </c:forEach>
                </tbody>
            </table>
        </div>


        <div class="product">
            <table class="tableproduct">
                <thead>
                    <tr>
                        <th scope="colp">ID</th>
                        <th scope="colp">Name Flower</th>
                        <th scope="colp">Price</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dong" items="${productDAO().fillProduct()}">
                        <tr>
                            <td>${dong.idp}</td>
                            <td>${dong.name}</td>
                            <td id="price">${dongp.price}</td>
                            <td> <img style="height: 50px ; width: 50px;" class="product" src="../image/${dong.image}"/></td>
                            <td>
                                <form action="control_product" method="get">
                                    <input type="hidden" name="idp" value="${dongp.id1}"/>
                                    <button type="submit" class="btn-action" name="action" value="Edit Product">Edit</button>
                                </form>
                            </td>
                            <td>
                                <form action="control_product" method="get">
                                    <input type="hidden" name="idp" value="${dongp.id1}"/>
                                    <button type="submit" class="btn-action" name="action" value="delete product">Delete</button>
                                </form>
                            </td>

                        </tr> 
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="form-popup" id="search">
            <form action="../control_contact" method="POST" class="form-container">
                <input type="text" class="form-control" name="txtid" value="" placeholder="ID"/>
                <input type="text" class="form-control" name="txtuser" value="" placeholder="Username"/>
                <input type="submit" class="btn-action" name="action" value="Search" onclick="closeSearch()"/>            
            </form>
            <button class="btn" onclick="closeSearch()">X</button>
        </div>
        <div class="form-popup" id="add">
            <form action="../control_contact" method="get" class="form-container">
                <input type="text" class="form-control" name="txtuser" value="" placeholder="Username"/>
                <input type="text" class="form-control" name="txtpass" value="" placeholder="Password"/>
                <input type="text" class="form-control" name="txtrepass" value="" placeholder="Repassword"/><br>
                <input type="radio" class="form-radio" name="radio" value="1"/><em class="form-control">Admin</em>
                <input type="radio" class="form-radio" name="radio" value="0"/><em class="form-control">User</em>
                <input type="submit" class="btn-action" name="action" value="Add" onclick="return check();closeAdd()"/>            
            </form>
            <button class="btn1" onclick="closeAdd()">X</button>
        </div>

        <div class="form-popup" id="edit">
            <form action="control_contact" method="get" class="form-container">
                <input type="unhidden" class="form-control" name="id" value="" placeholder="ID"/>
                <input type="text" class="form-control" name="txtuser" value="" placeholder="Username"/>
                <input type="text" class="form-control" name="txtpass" value="" placeholder="Password"/>
                <input type="text" class="form-control" name="txtrepass" value="" placeholder="Repassword"/><br>
                <input type="radio" class="form-radio" name="radio" value="1"/><em class="form-control">Admin</em>
                <input type="radio" class="form-radio" name="radio" value="0"/><em class="form-control">User</em>
                <input type="submit" class="btn-action" name="action" value="Edit" onclick="return check();closeEdit()"/>      
            </form>
            <button class="btn3 cancel1" onclick="closeEdit()">X</button>
        </div>

        <div class="form-popup" id="product">
            <form action="control_product" method="get" class="form-container">
                <input type="text" class="form-control" name="idp" value="" placeholder="ID"/>
                <input type="text" class="form-control" name="txtname" value="" placeholder="Name Flower"/>
                <input type="text" class="form-control" name="txtprice" value="" placeholder="Price"/><br>
                <input type="file" class="form-control" name="image" id="img" value="" onchange="showname()"/><br><br>
                <input type="submit" class="btn-action" name="action" value="Add Product" onclick="closeProduct()"/>            
            </form>
            <button class="btn2" onclick="closeProduct()">X</button>
        </div>
        <script>

            function showname() {
                var name = document.getElementById('img');
                var x = name.files.item(0).name;
                document.getElementById('123').innerHTML = x;
            }

            function openSearch() {
                document.getElementById("search").style.display = "block";
            }

            function closeSearch() {
                document.getElementById("search").style.display = "none";
            }

            function openAdd() {
                document.getElementById("add").style.display = "block";
            }

            function closeAdd() {
                document.getElementById("add").style.display = "none";
            }

            function openEdit() {
                document.getElementById("edit").style.display = "block";
            }

            function closeEdit() {
                document.getElementById("edit").style.display = "none";
            }

            function openProduct() {
                document.getElementById("product").style.display = "block";
            }

            function closeProduct() {
                document.getElementById("product").style.display = "none";
            }

            function check() {
                var pass = document.getElementsByName("txtpass");
                var repass = document.getElementsByName("txtrepass");
                if (pass[0].value == repass[0].value) {
                    return true;
                } else {
                    alert('Mật khẩu không giống nhau!');
                    return false;
                }
            }

        </script>
    </body>
</html>
