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
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url value="/resources/images" var="images" scope="session" />

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"
	rel='stylesheet' type='text/css'>
<%@ include file="AdminHeader.jsp"%>


<div class="container">
	<h1>Products List</h1>
	<div class="row">
		<c:forEach items="${listOfProduct}" var="productObj">

			<div class="col-xs-12 col-sm-4">
				<div class="card">
					<a class="img-card" href=""> <img
						src="${images}/${productObj.imgname1}" />

					</a> <br />
					<div class="card-content" style="display: flex">
						<div>
							<h4 class="card-title">
								<a href=""> ${productObj.productName} </a>
							</h4>
							<div class="">$${productObj.price}</div>
						</div>
						<div style="margin-left: 59px;">
							<a href="${contextRoot}/updateProduct/${productObj.productId}" class="btn btn-primary a-btn-slide-text"> <span
								class="glyphicon glyphicon-edit" aria-hidden="true"></span> <span><strong>Edit</strong></span>
							</a> <a href="${contextRoot}/deleteProduct/${productObj.productId}" class="btn btn-primary a-btn-slide-text"> <span
								class="glyphicon glyphicon-remove" aria-hidden="true"></span> <span><strong>Delete</strong></span>
							</a>
						</div>
					</div>	

				</div>
			</div>
		</c:forEach>
	</div>
</div>
<style>
.row {
	padding-top: 25px;
}

a.btn:hover {
	-webkit-transform: scale(1.1);
	-moz-transform: scale(1.1);
	-o-transform: scale(1.1);
}

a.btn {
	-webkit-transform: scale(0.8);
	-moz-transform: scale(0.8);
	-o-transform: scale(0.8);
	-webkit-transition-duration: 0.5s;
	-moz-transition-duration: 0.5s;
	-o-transition-duration: 0.5s;
}

card {
	display: block;
	margin-bottom: 20px;
	line-height: 1.42857143;
	background-color: #fff;
	border-radius: 2px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
	transition: box-shadow .25s;
}

.card:hover {
	box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

.img-card {
	width: 100%;
	height: 200px;
	border-top-left-radius: 2px;
	border-top-right-radius: 2px;
	display: block;
	overflow: hidden;
}

.img-card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
	transition: all .25s ease;
}

.card-content {
	padding: 15px;
	text-align: left;
}

.card-title {
	margin-top: 0px;
	font-weight: 700;
	font-size: 1.65em;
}

.card-title a {
	color: #000;
	text-decoration: none !important;
}

.card-read-more {
	border-top: 1px solid #D4D4D4;
}

.card-read-more a {
	text-decoration: none !important;
	padding: 10px;
	font-weight: 600;
	text-transform: uppercase
}
</style>
