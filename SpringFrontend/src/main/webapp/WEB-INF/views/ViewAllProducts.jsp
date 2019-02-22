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
		url : "${pageContext.request.contextPath}/getJsonProduct",
		success : function(data) {
			console.log(data);
		}
	});
</script>
<script>
	function myFunction() {
		var input, filter, table, tr, td, i, txtValue;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		table = document.getElementById("myTable");
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[0];
			if (td) {
				txtValue = td.textContent || td.innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}
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

<sec:authorize access="hasAuthority('Admin')">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<div class="container21">

		<c:if test="${not empty msg}">
			<div class="alert alert-success">${msg}</div>
		</c:if>


		<input type="text" id="myInput" onkeyup="myFunction()"
			placeholder="Search for products" title="Type in a name">

		<table id="myTable">
			<tr class="header">
				<th>Name</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Description</th>
				<th>Category</th>
				<th>Supplier</th>
				<th>Image</th>
				<th>Update</th>
				<th>Delete</th>
			</tr>
				<c:forEach items="${listOfProduct}" var="prodObj">
			<tr>
			
					<td>${prodObj.productName}</td>
					<td>${prodObj.price}</td>
					<td>${prodObj.quantity}</td>
					<td>${prodObj.productDescription}</td>
					<td>${prodObj.categoryId}</td>
					<td>${prodObj.supplierId}</td>
					<td><img src="${images}/${prodObj.imgname1}"
						style="height: 122px;" /></td>
					<td><a
						href="${contextRoot}/updateProduct/${prodObj.productId}"> <span
							class="glyphicon glyphicon-edit"></span>
					</a></td>
					<td><a
						href="${contextRoot}/deleteProduct/${prodObj.productId}"> <span
							class="glyphicon glyphicon-trash"></span>
					</a></td>
								</tr>
					
				</c:forEach>

		</table>
	</div>
</sec:authorize>




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
											href="${contextRoot}/productDetail/${productObj.productId}" title="View Product">${productObj.productName}</a>
									</h4>

									<p class="card-text">${productObj.productDescription}</p>
									<div class="row">
										<div class="col">
											<p class="btn btn-danger btn-block">$${productObj.price}</p>
										</div>
										<div class="col">

											<a class="btn btn-success"
												href="${contextRoot}/addToCart/${productObj.productId}"><i
												class="fas fa-shopping-cart">Add to cart</i></a>

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

* {
	box-sizing: border-box;
}

#myInput {
	background-image: url('/css/searchicon.png');
	background-position: 10px 10px;
	background-repeat: no-repeat;
	width: 100%;
	font-size: 16px;
	padding: 12px 20px 12px 40px;
	border: 1px solid #ddd;
	margin-bottom: 12px;
}

#myTable {
	border-collapse: collapse;
	width: 100%;
	border: 1px solid #ddd;
	font-size: 18px;
}

#myTable th, #myTable td {
	text-align: left;
	padding: 12px;
}

#myTable tr {
	border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
	background-color: #f1f1f1;
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