<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Register</title>
<%@include file="/all_component/allCss.jsp"%>
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
	<%@include file="/all_component/navbar.jsp"%>
	<div class="main-content">
		<div class="container p-3">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-body">
							<h4 class="text-center">Registration Page</h4>
							<c:if test="${not empty successMsg }">
								<p class="text-center text-success">${successMsg }</p>
								<c:remove var="successMsg" scope="session"></c:remove>
							</c:if>
							<c:if test="${not empty failedMsg }">
								<p class="text-center text-danger">${failedMsg }</p>
								<c:remove var="failedMsg" scope="session"></c:remove>
							</c:if>
							<form action="register" method="post" class="p-3">

								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Full
										Name*</label> <input type="text" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										required="required" name="fname">
								</div>
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Email
										address*</label> <input type="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										required="required" name="email">
								</div>
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Phone*</label>
									<input type="number" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										required="required" name="phno">
								</div>
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Password*</label>
									<input type="password" class="form-control"
										id="exampleInputPassword1" required="required" name="password">
								</div>
								<div class="mb-3 form-check">
									<input type="checkbox" class="form-check-input" name="check"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">I agree to Terms & Conditions</label>
								</div>
								<button type="submit" class="btn btn-primary">Submit</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/all_component/footer.jsp"%>
</body>
</html>