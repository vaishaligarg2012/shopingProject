<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/resources/images" var="images" scope="session" />

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.6.3/css/all.css'
	integrity='sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/'
	crossorigin='anonymous'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$.ajax({
    type : "GET", 
    url : "${pageContext.request.contextPath}/HomePage",
    success: function(data){
       console.log(data);  
    } 
});
</script>
<%@include file="HeadScript.jsp"%>
<%@include file="NavBar.jsp"%>
<div class="container">
	<div class="row">
		<div class="col">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="${contextRoot}/HomePage">Home</a></li>
					<li class="breadcrumb-item"><a
						href="${contextRoot}/viewAllCategory">Category</a></li>
					<li class="breadcrumb-item active" aria-current="page">Products</li>
				</ol>
			</nav>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-12 col-sm-3">
			<div class="card bg-light mb-3">
				<div class="card-header bg-primary text-white text-uppercase">
					<i class="fa fa-list"></i> Categories
				</div>
				<ul class="list-group category_block">
					<c:forEach items="${categoryList}" var="objs">
						<li class="list-group-item"><a
							href="${contextRoot}/viewProductsById/${objs.catId}">${objs.catName}</a></li>

					</c:forEach>
				</ul>
			</div>

		</div>
		<div class="col">
			<div class="row">
				<c:forEach items="${listOfProduct}" var="productObj">
					<div style="padding-top: 13px; padding-left: 11px;">
						<div class="card" style="width: 347px;">
							<img class="card-img-top" style="height: 246px;"
								src="${images}/${productObj.imgname1}" alt="Card image cap">
							<div class="card-body" style="height: 215px;">
								<h4 class="card-title">
									<a data-toggle="modal" style="cursor: grab;"
										data-target="#myModal" title="View Product">${productObj.productName}</a>
								</h4>
								<!-- The Modal -->
								<div class="modal" id="myModal">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<a href="#" data-dismiss="modal" class="class pull-right"><span
													class="glyphicon glyphicon-remove"></span></a>
												<h3 class="modal-title">${productObj.productName}</h3>
											</div>
											<div class="modal-body">
												<div class="row">
													<div class="col-md-6 product_img">
														<img src="${images}/${productObj.imgname1}"
															class="img-responsive">
													</div>
													<div class="col-md-6 product_content">
														<h4>
															Product Id: <span>${productObj.productId}</span>
														</h4>
														<div class="rating">
															<span class="glyphicon glyphicon-star"></span> <span
																class="glyphicon glyphicon-star"></span> <span
																class="glyphicon glyphicon-star"></span> <span
																class="glyphicon glyphicon-star"></span> <span
																class="glyphicon glyphicon-star"></span> (10 reviews)
														</div>
														<p>${productObj.productDescription}</p>
														<h3 class="cost">
															<span class="glyphicon glyphicon-usd"></span> 75.00 <small
																class="pre-cost"><span
																class="glyphicon glyphicon-usd"></span> 60.00</small>
														</h3>
														<div class="row">
															<div class="col-md-4 col-sm-6 col-xs-12">
																<select class="form-control" name="select">
																	<option value="" selected="">Color</option>
																	<option value="black">Black</option>
																	<option value="white">White</option>
																	<option value="gold">Gold</option>
																	<option value="rose gold">Rose Gold</option>
																</select>
															</div>
															<!-- end col -->
															<div class="col-md-4 col-sm-6 col-xs-12">
																<select class="form-control" name="select">
																	<option value="">Capacity</option>
																	<option value="">16GB</option>
																	<option value="">32GB</option>
																	<option value="">64GB</option>
																	<option value="">128GB</option>
																</select>
															</div>
															<!-- end col -->
															<div class="col-md-4 col-sm-12">
																<select class="form-control" name="select">
																	<option value="" selected="">QTY</option>
																	<option value="">1</option>
																	<option value="">2</option>
																	<option value="">3</option>
																</select>
															</div>
															<!-- end col -->
														</div>
														<div class="space-ten"></div>

														<div class="btn-ground">
															<button type="button" class="btn btn-primary">
																<span class="glyphicon glyphicon-shopping-cart"></span>
																Add To Cart
															</button>
															<button type="button" class="btn btn-primary">
																<span class="glyphicon glyphicon-heart"></span> Add To
																Wishlist
															</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<p class="card-text">${productObj.productDescription}</p>
								<div class="row">
									<div class="col">
										<p class="btn btn-danger btn-block">$${productObj.price}</p>
									</div>
									<div class="col">
							
											<a class="btn btn-success"
												href="${contextRoot}/addToCart/${productObj.productId}"><i
												class="fas fa-shopping-cart">Add to cart</i></a>
									
										<sec:authorize access="hasAuthority('Admin')">
											<a class="btn btn-success"
												href="${contextRoot}/updateProduct/${productObj.productId}"><i
												class="fa fa-edit"></i></a>
											<a class="btn btn-success"
												href="${contextRoot}/deleteProduct/${productObj.productId}"><span
												class="glyphicon glyphicon-trash"></span></a>
										</sec:authorize>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
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
		$('#list').click(function(event) {
			event.preventDefault();
			$('#products .item').addClass('list-group-item');
		});
		$('#grid').click(function(event) {
			event.preventDefault();
			$('#products .item').removeClass('list-group-item');
			$('#products .item').addClass('grid-group-item');
		});
	});
</script>