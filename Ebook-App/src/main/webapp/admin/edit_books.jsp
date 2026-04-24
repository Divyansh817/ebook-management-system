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
<title>Admin:Edit Books</title>
<%@ include file="allCss.jsp"%>
</head>
<body class="d-flex flex-column min-vh-100">
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"/>
	</c:if>
	<div class="container p-3 flex-grow-1">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Book</h4>
						
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
						BookDtls b = dao.getBookById(id);
						%>

						<form action="../edit_books" method="post" class="p-3">
						<input type="hidden" name="id" value="<%=b.getBookId()%>">
							<div class="mb-3 form-group">
								<label for="exampleInputEmail1" class="form-label">Book
									Name*</label> <input name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getBookName()%>" required>
							</div>
							<div class="form-group mb-3">
								<label for="exampleInputEmail1" class="form-label">Author
									Name*</label> <input name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getAuthor()%>" required>
							</div>
							<div class="form-group mb-3">
								<label for="exampleInputPassword1">Price*</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputPassword1" value="<%=b.getPrice()%>" required>
							</div>

							<div class="form-group mb-3">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="status" class="form-control">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option selected>Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else if ("Inactive".equals(b.getStatus())) {
									%>
									<option selected>Inactive</option>
									<option value="Active">Active</option>
									<%
									}
									%>
								</select>
							</div>
							<button type="submit" class="btn btn-primary mt-2">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<%@include file="footer.jsp"%>
</body>
</html>