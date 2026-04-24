<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Home</title>
<%@ include file="allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}

.card:hover {
	box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
	transform: scale(1.05);
}
</style>
</head>
<body class="d-flex flex-column min-vh-100"
	style="background-color: #e1e2e3">
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"/>
	</c:if>
	<div class="container flex-grow-1">
		<div class="row -5" style="margin-top: 150px;">
			<div class="col-md-3">
				<a href="add_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-square-plus fa-3x" style="color: #0008ff;"></i><br>
							<h4>Add Books</h4>
							----------
						</div>
					</div>

				</a>
			</div>
			<div class="col-md-3">
				<a href="all_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-3x" style="color: #ff0000;"></i><br>
							<h4>All Books</h4>
							----------
						</div>
					</div>

				</a>
			</div>
			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-box-open fa-3x" style="color: #FFD43B;"></i><br>
							<h4>Order</h4>
							----------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a data-bs-toggle="modal" data-bs-target="#exampleModalCenter" style="cursor: pointer;">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-right-from-bracket fa-3x"
								style="color: #adacaf;"></i><br>
							<h4>Logout</h4>
				 ----------
			</div>
		</div>
		</a>
	</div>
	
	</div>
	</div>
	<!-- Start Logout Modal -->

	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle"></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="text-center">
						<h4>Are you sure you want to logout?</h4>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<a href="../logout" type="button" class="btn btn-primary ">Logout</a>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>


	<!-- End Logout Modal -->
	<%@include file="footer.jsp"%>
</body>
</html>