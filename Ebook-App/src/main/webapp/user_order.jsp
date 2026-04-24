<%@page import="com.entity.User"%>
<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Orders</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
html, body {
	padding: 0;
	margin: 0;
	height: 100%;
	display: flex;
	flex-direction: column;
}

.main-content {
	flex: 1;
}

thead.bg-primary {
	background-color: #0d6efd !important;
}

thead.bg-primary th {
	background-color: #0d6efd !important;
	color: white !important;
}
</style>
</head>
<body style="background-color: #e1e2e3">
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<div class="main-content">
		<div class="container p-1">
			<h3 class="text-center text-primary">Your Orders</h3>
			<table class="table table-striped table-bordered mt-3">
				<thead class="bg-primary text-white">
					<tr>
						<th scope="col">Order Id</th>
						<th scope="col">Name</th>
						<th scope="col">Book Name</th>
						<th scope="col">Author</th>
						<th scope="col">Price</th>
						<th scope="col">Payment Type</th>
					</tr>
				</thead>
				<tbody>
				
				<%
				User us = (User)session.getAttribute("userobj");
				BookOrderDAOImpl dao = new BookOrderDAOImpl(DBConnect.getConn());
				List<Book_Order> blist = dao.getOrderByEmail(us.getEmail());
				
				for(Book_Order b: blist) 
				{ %>
					<tr>
						<th scope="row"><%=b.getOrderId() %></th>
						<td><%=b.getUsername() %></td>
						<td><%=b.getBookName() %></td>
						<td><%=b.getAuthor() %></td>
						<td><%=b.getPrice() %></td>
						<td><%=b.getPaymentType() %></td>
					</tr>
					<% }
				%>
				</tbody>
			</table>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>

</body>
</html>