<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.Category" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="daoImpl.CategoryDaoImpl" %>
<%@ page import="models.Book" %>
<%@ page import="daoImpl.BookDaoImpl" %><%--
  Created by IntelliJ IDEA.
  User: ViNguyen
  Date: 12/2/2019
  Time: 12:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8" contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Booking Online</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <link rel="stylesheet" href="styles.css" type="text/css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>
  <div class="container">
    <header>
      <nav class="top-menu">
        <div class="row">
          <div class="left-top-menu col-md-3">
            <a href="index.jsp">
              <img src="https://i.ibb.co/vwnJZNq/logo.png" alt="logo" border="0" width="100%">
            </a>
          </div>
          <div class="center-top-menu col-md-7">
            <div class="center-menu-top">
              <h3>The more that you read, the more things you will know</h3>
              <h3>The more that you learn, the more places you'll go</h3>
            </div>
            <div class="center-menu-bottom">
              <form class="form-inline row form-search" action="search" method="get">
                <%
                  ArrayList<Category> listCate = new CategoryDaoImpl().findAll();
                %>
                <select class="custom-select col-md-4" name="category_id">
                  <option selected>Select Category</option>
                  <%
                    for(Category list : listCate) {
                  %>
                  <option value="<%=list.getId()%>"><%=list.getName()%></option>
                  <%
                    }
                  %>
                </select>
                <input class="form-control col-md-5" type="search" name="name" placeholder="Search Book" aria-label="Search">
                <button class="btn btn-outline-success col-md-2" type="submit">Search</button>
              </form>
            </div>
          </div>
          <div class="right-top-menu col-md-2">
            <div class="right-menu-top">
              <%
                Cookie[] cookies = request.getCookies();
                int checkLogin = 0;
                for(int i =0;i<cookies.length;i++) {
                  Cookie cookie = cookies[i];
                  if(cookie.getName().equals("username") && cookie.getValue()!="") {
                    String username = cookie.getValue();
                    checkLogin = 1;
                    break;
                  }
                }
                if(checkLogin==1) {
              %>
              <form action="logout" method="post">
                <input type="submit" value="Logout" class="inputLogout">
              </form>
              <%
              } else {
              %>
              <a href="login">Login</a>
              <%
                }
              %>
            </div>
            <div class="right-menu-bottom">
              <%
                int checkRole = 0;
                for(int i =0;i<cookies.length;i++) {
                  Cookie cookie = cookies[i];
                  if(cookie.getName().equals("username") && cookie.getValue().equals("admin")) {
                    String username = cookie.getValue();
                    checkRole = 1;
                    break;
                  }
                }
                if(checkRole==1) {
              %>
              <a class="cart-icon" href="admin">
                  <span class="mini-cart-icon">
                    <img src="https://raw.githubusercontent.com/azouaoui-med/pro-sidebar-template/gh-pages/src/img/user.jpg" alt="Manage System" border="0">
                  </span>
              </a>
              <%
              } else {
              %>
              <a class="cart-icon" href="cart">
                      <span class="mini-cart-icon">
                        <img src="https://image.flaticon.com/icons/png/512/34/34627.png" alt="" border="0">
                      </span>
                <div class="number-cart">
                  <%
                    HttpSession sessionHome = request.getSession();

                    if(sessionHome.getAttribute("total")!=null) {
                      %>
                    <%=sessionHome.getAttribute("total")%>
                  <%
                    } else {
                      %>
                    0
                  <%
                    }
                  %>

                </div>
              </a>
              <%
                }
              %>
            </div>
          </div>
        </div>
      </nav>
    </header>
    <%--    End header--%>
    <span><i>${orderSuccess}</i></span>

    <%
      ArrayList<Book> listBook = new BookDaoImpl().findAll();
    %>

    <div class="list-product">
      <%
        for(Book item : listBook ) {
      %>
          <div class="product">
            <div class="image">
              <img class="lazy" src="images/<%=item.getPicture()%>" style="width: 100%; display: inline;">
            </div>
            <a class="title" href="#">
              <%=item.getName()%>
            </a>
            <div class="price-order">
              <div class="price">
                <%=item.getPrice()%> VNĐ
              </div>
              <div class="order">
                <a class="order-add" href="addToCart?bookId=<%=item.getId()%>">
                  <img src="http://cdn.onlinewebfonts.com/svg/img_553457.png" alt="" border="0" style="width: 70%; display: inline;">
                </a>
              </div>
            </div>
          </div>
      <%
        }
      %>
    </div>
  </div>

  <h1 class="homeMain"> Book Maintainance </h1>
  <a href="Home" target="_self" class="viewBook">View books</a>
</body>
</html>
