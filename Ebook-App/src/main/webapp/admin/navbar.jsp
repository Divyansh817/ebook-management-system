<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ page isELIgnored="false"%>

<div class="container-fluid"
	style="height: 5px; background-color: #00838f"></div>


<div class="container-fluid p-2 ">
	<div class="row">
		<div class="col-md-3 text-success ">
			<h3>
				<i class="fa-solid fa-book"></i>Ebooks
			</h3>
		</div>
		<div class="col-md-3">
			<c:if test="${not empty userobj }">
				<a class="btn btn-success text-white"><i
					class="fa-solid fa-circle-user"></i> ${userobj.name}</a>
				<a data-bs-toggle="modal" data-bs-target="#exampleModalCenter"
					class="btn btn-primary"><i
					class="fa-solid fa-right-from-bracket"></i> Logout</a>
			</c:if>
			<c:if test="${empty userobj}">

				<a href="login.jsp" class="btn btn-success"><i
					class="fa-solid fa-arrow-right-to-bracket"></i> Login</a>
				<a href="register.jsp" class="btn btn-primary"><i
					class="fa-solid fa-user-plus"></i> Register</a>
			</c:if>

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
			<div class="modal-footer">
			</div>
		</div>
	</div>
</div>


<!-- End Logout Modal -->

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<div class="container-fluid">
		<a class="navbar-brand" href="home.jsp"><i class="fa-solid fa-house"></i></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active" href="home.jsp">Home</a></li>

			</ul>
			<form class="d-flex">
				<button class="btn btn-light btn-custom me-2" type="submit">
					<i class="fa-solid fa-wrench"></i> Setting
				</button>
				<button class="btn btn-light btn-custom" type="submit">
					<i class="fa-solid fa-address-book"></i> Contact Us
				</button>
			</form>
		</div>
	</div>
</nav>