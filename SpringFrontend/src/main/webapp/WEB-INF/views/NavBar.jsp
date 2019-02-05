
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"
	scope="session" />

<nav class="navbar navbar-expand-sm  bg-light border " style="margin-bottom: 0px">
	<div class="container">
		<!-- Brand -->
		<a class="navbar-brand" href="${contextRoot}/HomePage"
			> <img
			src="https://ya-webdesign.com/images/shopping-transparent-logo-png.png"
			alt="Logo" style="width: 120px;">
		</a>

		<!-- Toggler/collapsibe Button -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<!-- Navbar links -->

		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<div>
				<form class="form-inline" action="#">
					<input class="form-control mr-sm-2"
						style="width: 423px; margin-left: 15px" type="text"
						placeholder="Search">
					<button class="btn btn-success" type="submit">
						<i class="fa fa-search"></i>
					</button>
					<div style="margin-left: 282px">
					<ul class="nav navbar-nav navbar-right">

						<sec:authorize access="isAnonymous()">
							<li><a href="${contextRoot}/register"><span
									class="glyphicon glyphicon-user"></span> Sign Up</a></li>
							<li><a href="${contextRoot}/login"><span
									class="glyphicon glyphicon-log-in"></span> Login</a></li>
						</sec:authorize>

						<sec:authorize access="isAuthenticated()">

							<sec:authorize access="hasAuthority('User')">
								<li><a href="${contextRoot}/viewCart">View Cart</a></li>
							</sec:authorize>
							<li>Welcome : ${sessionScope.user.fName}
								${sessionScope.user.lName}</li>
							<li><a href="${contextRoot}/logout">Logout</a></li>


						</sec:authorize>

					</ul>
</div>
				</form>

			</div>
			<ul class="nav navbar-nav">
				<li class=""><a href="${contextRoot}/HomePage">Home</a></li>


				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Shop By Category </a>
					<ul class="dropdown-menu">

						<c:forEach items="${categoryList}" var="cObj">
							<li><a href="${contextRoot}/viewProductsById/${cObj.catId}">${cObj.catName}</a></li>
						</c:forEach>


					</ul></li>
				<li><c:forEach items="${categoryList}" var="cObj">
						<li><a href="${contextRoot}/viewProductsById/${cObj.catId}">${cObj.catName}</a></li>
					</c:forEach></li>


				<sec:authorize access="hasAuthority('Admin')">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Supplier </a>
						<ul class="dropdown-menu">
							<li><a href="${contextRoot}/addSupplier">Add Supplier</a></li>
							<li><a href="${contextRoot}/viewSuppplier">View All
									Supplier</a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Product </a>
						<ul class="dropdown-menu">
							<li><a href="${contextRoot}/addProduct">Add Product</a></li>
							<li><a href="${contextRoot}/viewProducts">View All
									Products</a></li>
						</ul></li>

					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Category </a>
						<ul class="dropdown-menu">
							<li><a href="${contextRoot}/AddCategory">Add Category</a></li>
							<li><a href="${contextRoot}/viewAllCategory">View All
									Categories</a></li>
						</ul></li>
				</sec:authorize>



			</ul>



		</div>
	</div>
</nav>
