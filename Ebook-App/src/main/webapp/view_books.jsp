<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Books</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #e1e2e3;">
	<%@include file="/all_component/navbar.jsp"%>
	<%
	int bId = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	BookDtls b = dao.getBookById(bId);
	%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img
					src="<%=request.getContextPath() + "/book/" + b.getPhotoName()%>"
					style="height: 200px; width: 150px;border: 3px solid #333; border-radius: 5px; box-shadow: 0 2px 4px rgba(0,0,0,0.4);"><br>
				<div class="mt-3 text-start ">
					<h5>
						Book Name: <span style="color: #ffae00;"><%=b.getBookName()%></span>
					</h5>
					<h5>
						Author Name: <span style="color: #ffae00;"><%=b.getAuthor()%></span>
					</h5>
					<h5>
						Category: <span style="color: #ffae00;"><%=b.getBookCategory()%></span>
					</h5>
				</div>
			</div>

			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookName()%></h2>

				<%
				if (b.getBookCategory().equals("Old")) {
				%>
				<h5 style="color: blue;">Contact to Seller</h5>
				<h6 style="color: blue;">
					<i class="fa-solid fa-envelope"></i> Email:
					<%=b.getEmail()%></h6>

				<%
				}
				%>

				<div class="row " style="margin-top: 40px;">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free Delivery</p>
					</div>


				</div>

				<div class="text-center" style="margin-top: 40px;">

					<%
					if (b.getBookCategory().equals("Old")) {
					%>
					<a href="index.jsp" class="btn btn-success">Continue Shopping</a>
					<%
					} else {
					%>
					<a href="" class="btn btn-primary"><i class='fas fa-cart-plus'></i>
						Add to Cart</a>
					<%
					}
					%>

					<a href="" class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>

				</div>

			</div>
		</div>

	</div>
</body>
</html>