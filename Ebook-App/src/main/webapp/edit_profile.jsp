<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
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
<%@include file="all_component/navbar.jsp" %>
<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

<%
User us = (User)session.getAttribute("userobj");
%>
	<div class="main-content">
		<div class="container p-3">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-body">
							<h4 class="text-center text-primary">Edit Profile</h4>
							
							<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session"/>
							</c:if>
							<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session"/>
							</c:if>
							
							<form action="<%=request.getContextPath() %>/editProfile" method="post">
							
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Name*</label>
									<input name="uname" type="text" class="form-control" id="exampleInputEmail1" value="${userobj.name }" required="required">
								</div>
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Email
										address*</label> <input name="uemail" type="text" class="form-control"
										id="exampleInputEmail1" value=<%=us.getEmail() %> required="required" readonly="readonly">
								</div>
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Phone*</label>
									<input name="uphone" type="number" class="form-control"
										id="exampleInputEmail1" value=<%=us.getPhno() %> required="required">
								</div>
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Password*</label>
									<input name="upass" type="password" class="form-control"
										id="exampleInputPassword1" required="required">
								</div>
								<button type="submit" class="btn btn-primary">Update</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp" %>
</body>
</html>