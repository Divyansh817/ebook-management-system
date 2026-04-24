<%@page import="com.entity.User"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
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
<title>Search</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #e1e2e3">
	<%@include file="/all_component/navbar.jsp"%>
	
<%
User u = (User)session.getAttribute("userobj"); 
%>

	<div class="container-fluid">
		<h2 class="text-center">Search Results</h2>
		<div class="row p-3">
			<%
			String ch = (String)request.getParameter("ch");
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getBookBySearch(ch);
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3 mb-4">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt=""
							src="<%=request.getContextPath() + "/book/" + b.getPhotoName()%>"
							style="width: 100px; height:150px;" class="img-thumbnail">
						<p class="text-center mt-2">
							<%=b.getBookName()%>
						</p>

						<p class="text-center"><%=b.getAuthor()%></p>
						<p class="text-center">
							Category:
							<%=b.getBookCategory()%></p>

						<div class="d-flex justify-content-center gap-1">
							<%
							if (b.getBookCategory().equals("New")) {
								if(u == null) 
								{%>
								<a href="login.jsp" class="btn btn-danger btn-sm me-2"><i
									class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
								
								<%} else {%>
								
								<a href="cartServlet?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm me-2"><i
									class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
								<%}
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId() %>"
								class="btn btn-success btn-sm d-flex align-items-center px-2 py-1"
								style="white-space: nowrap;"> <i
								class="fa-regular fa-eye me-1"></i> View Details
							</a> <a href="#"
								class="btn btn-danger btn-sm d-flex align-items-center px-2 py-1"
								style="white-space: nowrap;"> <i
								class="fa-solid fa-indian-rupee-sign me-1"
								style="font-size: 0.9em;"></i> <%=b.getPrice()%>
							</a>
						</div>

					</div>
				</div>
			</div>
			<%
			} // end for
			%>
		</div>
	</div>



	<hr>
	<%@include file="/all_component/footer.jsp"%>

</body>
</html>