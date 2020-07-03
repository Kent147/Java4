<%-- 
    Document   : index
    Created on : Oct 28, 2019, 9:14:17 PM
    Author     : root
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.poly.DAO.productDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Store DEMO</title>
        <link rel="stylesheet" href="css/styleindex.css">
        <link href='image/fpt.ico' rel='icon' />
        <script src="script.js"></script>
    </head>
    <body>
        <%
            pageContext.setAttribute("Product DAO", new productDAO());
        %>
        <table border="0" class="menu-chinh">
            <tr>
                <th>
                    <nav class="menu">
                        <ul class="control-menu">
                            <li> <a href="index.jsp"> TRANG CHỦ </a> </li>
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
                            <form class="search" action="">
                                <div class="search">
                                    <input type="text" name="txtsearch" name="search" placeholder="Search" required=""/>
                                </div>
                            </form>
                            <a href="./admin/login.jsp" class="login">Đăng Nhập /</a>
                            <a href="./admin/indexadmin.jsp" class="register">Đăng Ký</a>
                        </ul>
                    </nav>
                </th>
            </tr>
        </table>
        <table border="1" class="menu-trai">
            <tr>
                <th>BUY</th>
            </tr>
            <tr>
                <td>
                    <p id="GH"></p>
                </td>
            </tr>
            <tr> 
                <td>
                    <h4>Tổng số tiền:$</h4> <p id="total"></p>
                </td> 
            <tr>
                <td>
                    <form action="control_contact" method="POST">
                        <button type="submit" class="btn-action1" name="action" value="Buy">Buy</button>
                    </form>
                </td> 
            </tr>
        </tr>
    </table>

    <table class="tableproduct">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Name Flower</th>
                <th scope="col">Price</th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="dong" items="${productDAO().fillProduct()}">
            <tr>
                <td>${dong.idp}</td>
                <td>${dong.name}</td>
                <td id="price">${dong.price}</td>
                <td> <img style="height: 50px ; width: 50px;" class="product" src="./image/${dong.image}"/></td>
                <td>
                    <button class="btn-action1" onclick="chon(this)">Buy</button>
                </td>
            </tr> 
        </c:forEach>
    </tbody>
</table>
</body>
<script>
    var total = 0;
    function chon(x)
    {
        var cell = x.parentNode.parentNode;
        var dong = x.parentNode.parentNode.cloneNode(true);
        var sua = dong.getElementsByTagName('button');
        document.getElementById('GH').appendChild(dong);
        sua[0].innerText = "Hủy";
        sua[0].setAttribute('onclick', 'huy(this)');
        tinh();
    }
    function huy(x)
    {
        var dong = x.parentNode.parentNode;
        document.getElementById('GH').removeChild(dong);
        tinh();
    }
    function tinh()
    {
        var mang = [];
        var gia = [];
        mang = document.getElementById('GH').getElementsByTagName('tr');
        alert(mang[0]);
        for (var i = 0; i < mang.length; i++)
        {
            gia = mang[i].getElementById('price');
            total += parseFloat(gia[1].innerText);
        }
        document.getElementById('total').innerHTML = total;
    }

</script>
</html>
