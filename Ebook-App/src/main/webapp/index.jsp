<%@page import="com.entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Index</title>
<%@include file="/all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/book1.png");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body style="background-color: #e1e2e3;">
<%
User u = (User)session.getAttribute("userobj"); 
%>
	<%@include file="/all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-custom" style="color: #00e676;">EBook
			Management System</h2>
	</div>

	<!-- Start Recent Book -->
	<div class="container">
		<h3 class="text-center">Recent Book</h3>

		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBooks();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3 mb-4">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt=""
							src="<%=request.getContextPath() + "/book/" + b.getPhotoName()%>"
							style="width: 100px; height: 150px;" class="img-thumbnail">
						<p class="text-center mt-2">
							<%=b.getBookName()%>
						</p>

						<p class="text-center"><%=b.getAuthor()%></p>
						<p class="text-center">
							Category:
							<%=b.getBookCategory()%></p>

						<div class="d-flex justify-content-center gap-1">
							<%
							if (b.getBookCategory().equals("New")) {
								if(u == null) 
							{%>
							<a href="login.jsp" class="btn btn-danger btn-sm me-2"><i
								class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
							
							<%} else {%>
							
							<a href="cartServlet?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm me-2"><i
								class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
							<%}
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId() %>"
								class="btn btn-success btn-sm d-flex align-items-center px-2 py-1"
								style="white-space: nowrap;"> <i
								class="fa-regular fa-eye me-1"></i> View Details
							</a> 
							
							<a href="#"
								class="btn btn-danger btn-sm d-flex align-items-center px-2 py-1"
								style="white-space: nowrap;"> <i
								class="fa-solid fa-indian-rupee-sign me-1"
								style="font-size: 0.9em;"></i> <%=b.getPrice()%>
							</a>
						</div>

					</div>
				</div>
			</div>
			<%
			} // end for
			%>
		</div>
		<!-- close row -->

		<div class="text-center mt-1">
			<a href="all_recent_books.jsp" class="btn btn-danger btn-sm text-white"><i
				class="fa-regular fa-eye"></i> ViewAll</a>
		</div>
	</div>


	<!-- End Recent Book -->
	<hr>
	<!-- Start New Book -->
	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img
							src="<%=request.getContextPath() + "/book/" + b.getPhotoName()%>"
							style="width: 100px; height: 150px;" class="img-thumbnail">
						<p class="text-center " style="margin-top: 10px"><%=b.getBookName()%></p>
						<p class="text-center " style="margin-top: 20px"><%=b.getAuthor()%></p>
						<p class="text-center " style="margin-top: 20px">
							Categories:
							<%=b.getBookCategory()%></p>
							
						<div class="d-flex justify-content-center">
							
							<% if(u == null) 
							{%>
							<a href="login.jsp" class="btn btn-danger btn-sm me-2"><i
								class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
							
							<%} else {%>
							
							<a href="cartServlet?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm me-2"><i
								class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
							<%}%>
							
								
								
								<a href="view_books.jsp?bid=<%=b.getBookId() %>"
								class="btn btn-success btn-sm me-2"><i
								class="fa-regular fa-eye"></i> View Details</a>
								
								
								<a href=""
								class="btn btn-danger btn-sm"> <span
								style="display: inline-flex; align-items: center;"> <i
									class="fa-solid fa-indian-rupee-sign me-1"
									style="font-size: 0.9em;"></i> <%=b.getPrice()%>
							</span>
							</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_new_books.jsp" class="btn btn-danger btn-sm text-white"><i
				class="fa-regular fa-eye"></i> ViewAll</a>
		</div>
	</div>

	<!-- End New Book -->
	<hr>
	<!-- Start Old Book -->
	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">
		
		<%
		BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
		List<BookDtls> list3 = dao3.getOldBooks();
		for(BookDtls b: list3) 
		{
		%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="<%=request.getContextPath() + "/book/" + b.getPhotoName()%>"
							style="width: 100px; height: 150px;" class="img-thumbnail">
						<p class="text-center " style="margin-top: 10px"><%=b.getBookName() %></p>
						<p class="text-center " style="margin-top: 20px"><%=b.getAuthor() %></p>
						<p class="text-center " style="margin-top: 20px">Category: <%=b.getBookCategory() %></p>
						<div class="d-flex justify-content-center">
							<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-5 me-2"><i
								class="fa-regular fa-eye"></i> View Details</a><a href=""
								class="btn btn-danger btn-sm"> <span
								style="display: inline-flex; align-items: center;"> <i
									class="fa-solid fa-indian-rupee-sign me-1"
									style="font-size: 0.9em;"></i> <%=b.getPrice()%>
							</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		<%
		}
		%>
		</div>
		<div class="text-center mt-1">
			<a href="all_old_books.jsp" class="btn btn-danger btn-sm text-white"><i
				class="fa-regular fa-eye"></i> ViewAll</a>
		</div>
	</div>

	<!-- End Old Book -->
	<hr>
	<%@include file="/all_component/footer.jsp"%>
</body>
</html>