<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #e1e2e3;">
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<c:if test="${not empty succMsg }"> 
<div class="alert alert-success" role="alert">${succMsg}</div>
<c:remove var="succMsg" scope="session"/>	
	</c:if>
	
	<c:if test="${not empty failedMsg }"> 
<div class="alert alert-danger text-center" role="alert">${failedMsg}</div>
<c:remove var="failedMsg" scope="session"/>	
	</c:if>
	
	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Item</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
							CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
							User u = (User)session.getAttribute("userobj"); 
							List<Cart> list = dao.getCartByUser(u.getId());
							Double totalPrice = 0.00;
							for(Cart c: list) 
							{
								totalPrice=c.getTotalPrice();
							%>
								<tr>
									<th scope="row"><%=c.getBookName() %></th>
									<td><%=c.getAuthor() %></td>
									<td><%=c.getPrice() %></td>
									<td><a href="remove_book?cid=<%=c.getCid()%>" class="btn btn-danger">Remove</a></td>
								</tr>
								<%
								}
							%>
								<tr>
									<td>Total Price</td>
									<td></td>
									<td>
										<%=totalPrice %>
									</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>


			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details for Order</h3>
						<form action="<%=request.getContextPath() %>/order" method="post" class="row g-3">
							<input type="hidden" value="${userobj.id }" name="uid">
							
							<div class="col-md-6">
								<label for="name" class="form-label">Name</label> <input
								name="name"	type="text" class="form-control" id="name"
									value="<%=u.getName()%>" required="required">
							</div>

							<div class="col-md-6">
								<label for="email" class="form-label">Email</label> <input
								name="email"	type="email" class="form-control" id="email"
									value="<%=u.getEmail() %>" required="required" >
							</div>

							<div class="col-md-6">
								<label for="mobile" class="form-label">Mobile No</label> <input
								name="phone"	type="number" class="form-control" id="mobile"
									value="<%=u.getPhno() %>" required="required">
							</div>

							<div class="col-md-6">
								<label for="address" class="form-label">Address</label> <input
								name="address"	type="text" class="form-control" id="address" required="required">
							</div>

							<div class="col-md-6">
								<label for="landmark" class="form-label">Landmark</label> <input
								name="landmark"	type="text" class="form-control" id="landmark" required="required">
							</div>

							<div class="col-md-6">
								<label for="city" class="form-label">City</label> <input
								name="city"	type="text" class="form-control" id="city" required="required">
							</div>

							<div class="col-md-6">
								<label for="state" class="form-label">State</label> <input
								name="state"	type="text" class="form-control" id="state" required="required">
							</div>

							<div class="col-md-6">
								<label for="zip" class="form-label">Zip</label> <input
								name="zip"	type="text" class="form-control" id="zip" required="required">
							</div>

							<div class="form-group">
								<label>Payment Mode</label> <select class="form-control" name="paymentType">
									<option value="noSelect">--Select--</option>
									<option value="COD">Cash On Delivery</option>
								</select>
							</div>

							<div class="row mt-3">
								<div class="col-md-6 text-start">
									<a href="index.jsp" class="btn btn-success">Continue
										Shopping</a>
								</div>
								<div class="col-md-6 text-end">
									<button class="btn btn-warning">Order Now</button>
								</div>
							</div>


						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>