<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.sql.Connection, java.util.List, com.entity.BookDtls, com.DB.DBConnect, com.DAO.BookDAOImpl" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>All New Books</title>
  <%@ include file="all_component/allCss.jsp" %>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
    #toast {
      min-width: 300px;
      position: fixed;
      bottom: 30px;
      left: 50%;
      transform: translateX(-50%);
      background: #333;
      padding: 12px 20px;
      color: white;
      text-align: center;
      z-index: 9999;
      font-size: 18px;
      border-radius: 5px;
      display: none;
    }
  </style>
</head>
<body>
<%
User u = (User)session.getAttribute("userobj"); 
%>

<c:if test="${not empty addCart}">
  <div id="toast">${addCart}</div>
  <% session.removeAttribute("addCart"); %>
  <script>
    $(function() {
      $('#toast').fadeIn();
      setTimeout(function() {
        $('#toast').fadeOut();
      }, 2500);
    });
  </script>
  <c:remove var="addCart" scope="session"/>
</c:if>

<%@include file="/all_component/navbar.jsp" %>
<div class="container">
  <h3 class="text-center">All New Book</h3>
  <div class="row p-3">
    <%
      BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
      List<BookDtls> list = dao.getAllNewBooks();
      for (BookDtls b : list) {
    %>
    <div class="col-md-3">
      <div class="card crd-ho mt-2">
        <div class="card-body text-center">
          <img src="<%=request.getContextPath()%>/book/<%=b.getPhotoName()%>"
               style="width: 100px; height: 150px;" class="img-thumbnail">
          <p class="mt-2"><%=b.getBookName()%></p>
          <p class="mt-2"><%=b.getAuthor()%></p>
          <p class="mt-2">Categories: <%=b.getBookCategory()%></p>
          <div class="d-flex justify-content-center">
          <% if(u == null) { %>
            <a href="login.jsp" class="btn btn-danger btn-sm me-2">
              <i class="fa-solid fa-cart-shopping"></i> Add Cart
            </a> 
          <% } else { %>
            <a href="cartServlet?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm me-2">
              <i class="fa-solid fa-cart-shopping"></i> Add Cart
            </a> 
          <% } %>
            <a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm me-2">
              <i class="fa-regular fa-eye"></i> View Details
            </a>
            <span class="btn btn-danger btn-sm">
              <i class="fa-solid fa-indian-rupee-sign me-1"></i><%=b.getPrice()%>
            </span>
          </div>
        </div>
      </div>
    </div>
    <%
      }
    %>
  </div>
</div>

<hr>
<%@ include file="/all_component/footer.jsp" %>
</body>
</html>
