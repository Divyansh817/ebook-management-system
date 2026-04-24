<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Sell Book Page</title>
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
</style>

</head>
<body style="background-color: #e1e2e3;">
<% User us = (User)session.getAttribute("userobj"); %>

<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<div class="main-content">
		<div class="container p-3">

			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-body">
						<h4 class="text-center text-primary">Sell Old Book</h4>
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success">${succMsg }</p>	
						<c:remove var="succMsg" scope="session"/>
						</c:if>
						<c:if test="${not empty failedMsg }">
						<p class="text-center text-danger">${failedMsg }</p>
						<c:remove var="failedMsg" scope="session"/>
						</c:if>
							<form action="add_old_book" method="post" enctype="multipart/form-data">
							<input type="hidden" value="${userobj.email }" name="userEmail">
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Book
										Name*</label> <input type="text" class="form-control"
										id="exampleInputEmail1" name="bname" required="required">
								</div>
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Author
										Name*</label> <input type="text" class="form-control"
										id="exampleInputEmail1" name="author" required="required">
								</div>
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Price*</label> <input type="number" class="form-control"
										id="exampleInputEmail1" name="price" required="required">
								</div>
								<div class="form-group mb-3">
									<label for="exampleFormControlFile1">Upload Photo</label><input
										name="bimg" type="file" class="form-control-file"
										id="exampleFormControlFile1" required="required">
								</div>
								<button type="submit" class="btn btn-primary">Sell</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>


	<%@include file="all_component/footer.jsp"%>
</body>
</html>