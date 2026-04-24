<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Old Books</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	display: flex;
	flex-direction: column;
}

.main-content {
	flex: 1;
}

thead.bg-primary {
	background-color: blue;
}

thead.bg-primary th {
	background-color: blue;
	color: white;
}
</style>
</head>
<body style="background-color: #e1e2e3;">
	<%@include file="all_component/navbar.jsp"%>

	<div class="main-content">
	<c:if test="${not empty succMsg }">
	<div class="alert alert-success text-center">${succMsg }</div>
	<c:remove var="succMsg" scope="session"/>
	</c:if>
	<c:if test="${not empty failedMsg }">
	<div class="alert alert-danger text-center">${failedMsg }</div>
	<c:remove var="failedMsg" scope="session"/>
	</c:if>
	
		<div class="container p-3">
			<div class="row">
				<div class="col-12">
					<table class="table table-striped table-bordered mt-2">
						<thead class="bg-primary text-white">
							<tr>
							
								<th scope="col">S.No.</th>
								<th scope="col">BookName</th>
								<th scope="col">Author</th>
								<th scope="col">Category</th>
								<th scope="col">Price</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
						<%
						
						User us = (User)session.getAttribute("userobj");
						int i = 1;
						
						BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
						List<BookDtls> list=dao.getBookByOld(us.getEmail(), "Old");
						for(BookDtls b: list)
						{ %>
							<tr>
								<td><%=i++ %>.</td>
								<td><%=b.getBookName() %></td>
								<td><%=b.getAuthor() %></td>
								<td><%=b.getBookCategory() %></td>
								<td><%=b.getPrice() %></td>
								<td><a href="<%=request.getContextPath() %>/deleteOldBook?bid=<%=b.getBookId() %>" class="btn btn-danger">Remove</a></td>
							</tr>
							<% 
							} %>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>