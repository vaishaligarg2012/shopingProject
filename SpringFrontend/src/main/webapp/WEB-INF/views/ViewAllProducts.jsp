
<!------ Include the above in your HEAD tag ---------->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/resources/images" var="images" scope="session" />

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.6.3/css/all.css' integrity='sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/' crossorigin='anonymous'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"
	rel='stylesheet' type='text/css'>
<%@ include file="AdminHeader.jsp"%>

<div class="container">
	<div class="well well-sm">

		<strong>Display</strong>
		<div class="btn-group">
			<a href="#" id="list" class="btn btn-default btn-sm"><span
				class="glyphicon glyphicon-th-list"> </span>List</a> <a href="#"
				id="grid" class="btn btn-default btn-sm"><span
				class="glyphicon glyphicon-th"></span>Grid</a>
		</div>
	</div>
	<div id="products" class="row list-group">
		<c:forEach items="${listOfProduct}" var="productObj">
			<div class="item  col-xs-4 col-lg-4">
				<div class="thumbnail">
					<img class="group list-group-image"
						src="${images}/${productObj.imgname1}" alt="" />
					<div class="caption">
						<h4 class="group inner list-group-item-heading">
							${productObj.productName}</h4>
						<p class="group inner list-group-item-text">
							${productObj.productDescription}</p>
						<div class="row">
							<div class="col-xs-12 col-md-6">
								<p class="lead">$${productObj.price}</p>
							</div>
							<div class="col-xs-12 col-md-6" >
								<a class="btn btn-success"
									href="${contextRoot}/addToCart/${productObj.productId}"><i class="fas fa-shopping-cart"></i></a> <a class="btn btn-success"
									href="${contextRoot}/updateProduct/${productObj.productId}"><i class="material-icons">edit</i></a>
								<a class="btn btn-success"
									href="${contextRoot}/deleteProduct/${productObj.productId}"><span class="glyphicon glyphicon-trash"></span></a>

							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
</div>
</div>
<style>
.glyphicon {
	margin-right: 5px;
}

.thumbnail {
	margin-bottom: 20px;
	padding: 0px;
	-webkit-border-radius: 0px;
	-moz-border-radius: 0px;
	border-radius: 0px;
}

.item.list-group-item {
	float: none;
	width: 100%;
	hight:50%;
	background-color: #fff;
	margin-bottom: 10px;
}

.item.list-group-item:nth-of-type(odd):hover, .item.list-group-item:hover
	{
	background: #428bca;
}

.item.list-group-item .list-group-image {
	margin-right: 10px;
}

.item.list-group-item .thumbnail {
	margin-bottom: 0px;
}

.item.list-group-item .caption {
	padding: 9px 9px 0px 9px;
}

.item.list-group-item:nth-of-type(odd) {
	background: #eeeeee;
}

.item.list-group-item:before, .item.list-group-item:after {
	display: table;
	content: " ";
}

.item.list-group-item img {
	float: left;
}

.item.list-group-item:after {
	clear: both;
}

.list-group-item-text {
	margin: 0 0 11px;
}
</style>
<script>
$(document).ready(function() {
    $('#list').click(function(event){event.preventDefault();$('#products .item').addClass('list-group-item');});
    $('#grid').click(function(event){event.preventDefault();$('#products .item').removeClass('list-group-item');$('#products .item').addClass('grid-group-item');});
});
</script>
