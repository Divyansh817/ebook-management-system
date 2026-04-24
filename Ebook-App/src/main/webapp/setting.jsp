<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Setting Page</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
html, body {
		height: 100%;
		margin: 0;
		padding: 0;
		display: flex;
		flex-direction: column;
	}
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
.main-content {
		flex: 1;
		background-color: #e1e2e3;
	}
</style>
</head>
<body style="background-color: #e1e2e3;">

	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="main-content">
	<div class="container">
	<h3 style="text-align: center;">Hello, ${userobj.name }</h3>
		<div class="row p-5">
			<div class="col-md-4">
				<a href="sell_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-book-open fa-3x"></i>
							</div>
							<h3>Sell Old Book</h3>


						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="old_book.jsp?">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-trash-can fa-3x" style="color: #858a93;"></i>
							</div>
							<h3>Delete Book</h3>


						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-id-card fa-3x"></i>
							</div>
							<h4>Edit Profile</h4>


						</div>
					</div>
				</a>
			</div>

			<div class="col-md-6 mt-3">
				<a href="user_order.jsp?email=${userobj.email }">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fa-solid fa-box-open fa-3x"></i>
							</div>
							<h4>My Order</h4>
							<p>Track your Order</p>


						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6 mt-3">
				<a href="help_center.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-circle-user fa-3x"></i>
							</div>
							<h4>Help Center</h4>
							<p>24*7 Service</p>


						</div>
					</div>
				</a>
			</div>
		</div>


	</div>
</div>
	<%@include file="/all_component/footer.jsp"%>

</body>
</html>