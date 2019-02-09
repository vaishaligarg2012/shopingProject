<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link href="css/viewAllCategory.css" rel='stylesheet' type='text/css'>
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.6.3/css/all.css'
	integrity='sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/'
	crossorigin='anonymous'>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"
	rel='stylesheet' type='text/css'>


<%@include file="NavBar.jsp"%>
<div class="container">
	<div class="row">
		<div class="col">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="${contextRoot}/HomePage">Home</a></li>
					<li class="breadcrumb-item"><a
						href="${contextRoot}/viewAllCategory">Categories</a></li>

				</ol>
			</nav>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<c:forEach items="${categoryList}" var="category">
			<div class="card" style="padding-top: 10px;">
				<div class="container">

					<h4>${category.catId }</h4>
					<h4>${category.catName}</h4>
					<h4>${category.catDescription}</h4>
				</div>
				<div>
					<a class="btn btn-success"
						href="${contextRoot}/updateCategory/${category.catId}"><i
						class="material-icons">edit</i></a> <a class="btn btn-success"
						href="${contextRoot}/deleteCategory/${category.catId}"><i
						class="material-icons">delete</i></a> <a type="button"
						href="${contextRoot}/viewProductsById/${category.catId}"
						class="btn btn-outline-danger">Shop Now</a>
				</div>
			</div>
		</c:forEach>
	</div>

</div>

<style>
.card {
	/* Add shadows to create the "card" effect */
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
}

/* On mouse-over, add a deeper shadow */
.card:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

/* Add some padding inside the card container */
.container {
	padding: 2px 16px;
}
</style>