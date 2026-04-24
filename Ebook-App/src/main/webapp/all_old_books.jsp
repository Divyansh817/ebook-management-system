<%@page import="java.sql.Connection"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Old Books</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body>
	<%@include file="/all_component/navbar.jsp"%>
	
	<div class="container">
		<h3 class="text-center">All Old Book</h3>
		<div class="row p-3">
		
		<%
		BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
		List<BookDtls> list3 = dao3.getAllOldBooks();
		for(BookDtls b: list3) 
		{
		%>
			<div class="col-md-3">
				<div class="card crd-ho p-2">
					<div class="card-body text-center">
						<img alt="" src="<%=request.getContextPath() + "/book/" + b.getPhotoName()%>"
							style="width: 100px; height: 150px;" class="img-thumbnail">
						<p class="text-center " style="margin-top: 10px"><%=b.getBookName() %></p>
						<p class="text-center " style="margin-top: 20px"><%=b.getAuthor() %></p>
						<p class="text-center " style="margin-top: 20px">Category: <%=b.getBookCategory() %></p>
						<div class="d-flex justify-content-center">
							<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-5 me-2"><i
								class="fa-regular fa-eye"></i> View Details</a><a href=""
								class="btn btn-danger btn-sm"> <span
								style="display: inline-flex; align-items: center;"> <i
									class="fa-solid fa-indian-rupee-sign me-1"
									style="font-size: 0.9em;"></i> <%=b.getPrice()%>
							</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		<%
		}
		%>
		</div>
		
	</div>
	
	
	
	
	<hr>
	<%@include file="/all_component/footer.jsp"%>

</body>
</html>