

<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">


<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
* {
	box-sizing: border-box;
}

.columns {
	float: left;
	width: 33.3%;
	padding: 8px;
}

.price:hover {
	box-shadow: 0 8px 12px 0 rgba(0, 0, 0, 0.2)
}

.price .header {
	background-color: #111;
	color: white;
	font-size: 25px;
}

.price li {
	border-bottom: 1px solid #eee;
	padding: 20px;
	text-align: center;
}

.price .grey {
	background-color: #eee;
	font-size: 20px;
}

.button {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 10px 25px;
	text-align: center;
	text-decoration: none;
	font-size: 18px;
}

@media only screen and (max-width: 600px) {
	.columns {
		width: 100%;
	}
}

/* Make the image fully responsive */
.carousel-inner img {
	width: 100%;
	height: 100%;
}

.carousel-item {
	position: relative;
	display: none;
	float: left;
	width: 100%;
	height: 376px;
	margin-right: -100%;
	-webkit-backface-visibility: hidden;
	backface-visibility: hidden;
	transition: -webkit-transform .6s ease-in-out;
	transition: transform .6s ease-in-out;
	transition: transform .6s ease-in-out, -webkit-transform .6s ease-in-out;
}
</style>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/resources/design" var="design" scope="session" />
<head>

<title>Store</title>
</head>
<%@include file="AdminHeader.jsp"%>

<body>

	<div id="demo" class="carousel slide" data-ride="carousel">

		<!-- Indicators -->
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
		</ul>

		<!-- The slideshow -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="${design}/crosel.jpg" alt="Chicago" width="100%"
					height="50">
			</div>
			<div class="carousel-item">
				<img src="${design}/slide.jpg" alt="Chicago" width="100%"
					height="50">
			</div>
			<div class="carousel-item">
				<img src="${design}/echoplusdot_main_1539332754848.jpg"
					alt="New York" width="100%" height="50">
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span
			class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#demo" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>

	</div>

		<div class="columns">
			<ul class="price">
	<c:forEach items="${categoryList}" var="objs">
	
				<li class="header">${objs.catName }</li>
	</c:forEach>
	
			</ul>
		</div>
	</body>
</html>
