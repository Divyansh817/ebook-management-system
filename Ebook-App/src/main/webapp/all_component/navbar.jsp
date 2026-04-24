<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ page isELIgnored="false"%>
<div class="container-fluid"
	style="height: 5px; background-color: #00838f"></div>


<div class="container-fluid p-2">
	<div class="row align-items-center">
		<div class="col-md-3 text-success">
			<h3>
				<i class="fa-solid fa-book"></i> Ebooks
			</h3>
		</div>

		<div class="col-md-4">
			<form class="d-flex" role="search" action="search.jsp" method="post">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search" name="ch" />
				<button class="btn btn-primary custom-search-btn" type="submit">
					<i class="fa-solid fa-magnifying-glass"></i>
				</button>
			</form>
		</div>

		<c:if test="${not empty userobj}">
			<div class="col-md-5 text-end">
				<a href="checkout.jsp" class="btn btn-danger me-2"> <i
					class="fa-solid fa-cart-shopping"></i>
				</a> <a href="login.jsp" class="btn btn-success me-2"> <i
					class="fa-solid fa-user"></i> ${userobj.name}
				</a> <a href="logout" class="btn btn-primary"> <i
					class="fa-solid fa-arrow-right-to-bracket"></i> Logout
				</a>
			</div>
		</c:if>

		<c:if test="${empty userobj}">
			<div class="col-md-5 text-end">
				<a href="login.jsp" class="btn btn-success me-2"> <i
					class="fa-solid fa-arrow-right-to-bracket"></i> Login
				</a> <a href="register.jsp" class="btn btn-primary"> <i
					class="fa-solid fa-user-plus"></i> Register
				</a>
			</div>
		</c:if>
	</div>
</div>



<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-solid fa-house"></i></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					href="index.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="all_recent_books.jsp"><i class="fa-solid fa-book-open"></i>
						Recent Book</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="all_new_books.jsp"><i class="fa-solid fa-book-open"></i>
						New Book</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="all_old_books.jsp"><i class="fa-solid fa-book-open"></i>
						Old Book</a></li>
			</ul>
			<form class="d-flex">
				<a href="setting.jsp" class="btn btn-light btn-custom me-2"
					type="submit"> <i class="fa-solid fa-wrench"></i> Setting
				</a>
				<button class="btn btn-light btn-custom" type="submit">
					<i class="fa-solid fa-address-book"></i> Contact Us
				</button>
			</form>
		</div>
	</div>
</nav>