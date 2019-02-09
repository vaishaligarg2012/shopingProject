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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
					<li class="breadcrumb-item"><a href="${contextRoot}/viewAllCategory">Category</a></li>
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
				<c:forEach items= "${categoryList}" var = "objs">
					<li class="list-group-item"><a href="${contextRoot}/viewProductsById/${objs.catId}">${objs.catName}</a></li>
				
                  </c:forEach>
		 	  </ul>
			</div>

		</div>
		<div class="col">
			<div class="row">
				<c:forEach items="${listOfProduct}" var="productObj">
					<div style=" padding-top: 13px;    padding-left: 11px;">
						<div class="card" style="width: 347px;">
							<img class="card-img-top" style="height: 246px;" src="${images}/${productObj.imgname1}"
								alt="Card image cap">
							<div class="card-body" style="height: 215px;">
								<h4 class="card-title">
									<a href="product.html" title="View Product">${productObj.productName}</a>
								</h4>
								<p class="card-text">${productObj.productDescription}</p>
								<div class="row">
									<div class="col">
										<p class="btn btn-danger btn-block">$${productObj.price}</p>
									</div>
									<div class="col">
										<a class="btn btn-success"
											href="${contextRoot}/addToCart/${productObj.productId}"><i
											class="fas fa-shopping-cart"></i></a> <a class="btn btn-success"
											href="${contextRoot}/updateProduct/${productObj.productId}"><i
											class="material-icons">edit</i></a> <a class="btn btn-success"
											href="${contextRoot}/deleteProduct/${productObj.productId}"><span
											class="glyphicon glyphicon-trash"></span></a>
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