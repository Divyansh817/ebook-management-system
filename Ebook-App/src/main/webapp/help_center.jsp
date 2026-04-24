<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Help Center</title>

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
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<div class="main-content">
		<div class="container p-2 text-center">
			<div class="row">
				<div class="col-md-4 offset-md-4 mt-5">
					<i class="fa-solid fa-square-phone fa-5x" style="color: #24c226;"></i>
					<h3 class="mt-4">24*7 Service</h3>
					<h4>Helpline Number</h4>
					<p>+9103101824</p>
					<a href="index.jsp" class="btn btn-primary text-white">Home</a>
				</div>
			</div>
		</div>
	</div>



	<%@include file="all_component/footer.jsp"%>
</body>
</html>