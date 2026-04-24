<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Success</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
html, body {
	margin: 0;
	padding: 0;
	display: flex;
	height: 100%;
	flex-direction: column;
}

.main-content {
	flex: 1;
}
</style>
</head>
<body style="background-color: #e1e2e3">
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj }">
	<c:redirect url="login.jsp"></c:redirect>
	
	</c:if>
		<div class="main-content">
		<div class="container text-center mt-3">
			<i class="fa-solid fa-circle-check fa-5x" style="color: #00f529;"></i>
			<h1>Thank You</h1>
			<h2>Your Order Placed Successfully</h2>
			<h5>Your Product will be Delivered at your
				Address within 7 Days </h5>
			<a href="index.jsp" class="btn btn-primary mt-3">Home</a> <a
				href="user_order.jsp?email=${userobj.email }" class="btn btn-danger mt-3">View Order</a>
		</div>
		</div>
		<%@include file="all_component/footer.jsp"%>
</body>
</html>