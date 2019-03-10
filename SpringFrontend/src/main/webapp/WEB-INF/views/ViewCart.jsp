<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/resources/images" var="images" scope="session" />
    <c:set var="contextRoot" value="${pageContext.request.contextPath}"
	scope="session" />

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<%@include file="HeadScript.jsp"%>
<%@include file="NavBar.jsp"%>
<title>Cart</title>
<div class="container">

	
	<br/>
	<c:choose>
		<c:when test="${itemsList == 'Cart Empty'}">
			<h1>Empty Cart</h1>
		</c:when>
		<c:otherwise>
		    <c:if test="${not empty msg}">
	         <div class="alert alert-success">
		      ${msg}
	     	</div>
	       </c:if>
	    <table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr>
							<th style="width:50%;font-size:23px">Shopping Cart</th>
							<th style="width:10%">Price</th>
							<th style="width:8%">Quantity</th>
							<th style="width:22%" class="text-center">Subtotal</th>
							<th style="width:10%"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${itemsList}" var="item">
						<tr>
							<td data-th="Shopping Cart">
								<div class="row">
									<div class="col-sm-2 hidden-xs"><img src="${images}/${item.product.imgname1}" class="img-responsive"/></div>
									<div class="col-sm-10">
										<h4 class="nomargin">${item.product.productName}</h4>
										<p>${item.product.productDescription}</p>
									</div>
								</div>
							</td>
							<td data-th="Price">${item.product.price}</td>
							<td data-th="Quantity">
								<input type="number" class="form-control text-center" value="${item.qunatity }">
							</td>
							<td data-th="Subtotal" class="text-center" style="color: darkgoldenrod;"><b>${item.qunatity *item.product.price}</b></td>
							<td class="actions" data-th="">
								<a href="${contextRoot}/increase/${item.itemId}" class="btn btn-info btn-sm">+</a>
								<a href="${contextRoot}/decrease/${item.itemId}" class="btn btn-danger btn-sm">-</a>
								<!-- <i class="fa fa-trash-o"> -->								
							</td>
							<td  class="text-center"><a href="${contextRoot}/deleteCartItem/${item.itemId}">Delete</a></td>
							
						</tr>
						</c:forEach>
						
					</tbody>
						<tfoot>
						<tr class="visible-xs">
							<td class="text-center"><strong>Total 1.99</strong></td>
						</tr>
						<tr>
							<td><a href="${contextRoot}/HomePage" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center"><strong>Total: <b style="color: darkgoldenrod;"> ${sessionScope.grandTotal}</b></strong></td>
							<td><a href="${contextRoot}/addressPage" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></a></td>
						</tr>
					</tfoot>
				
					</table>
					
 </c:otherwise>
	</c:choose>
</div>
<style>  
.table>tbody>tr>td, .table>tfoot>tr>td{
    vertical-align: middle;
}
@media screen and (max-width: 600px) {
    table#cart tbody td .form-control{
		width:20%;
		display: inline !important;
	}
	.actions .btn{
		width:36%;
		margin:1.5em 0;
	}
	
	.actions .btn-info{
		float:left;
	}
	.actions .btn-danger{
		float:right;
	}
	
	table#cart thead { display: none; }
	table#cart tbody td { display: block; padding: .6rem; min-width:320px;}
	table#cart tbody tr td:first-child { background: #333; color: #fff; }
	table#cart tbody td:before {
		content: attr(data-th); font-weight: bold;
		display: inline-block; width: 8rem;
	}
	
	
	
	table#cart tfoot td{display:block; }
	table#cart tfoot td .btn{display:block;}
	
}
</style>