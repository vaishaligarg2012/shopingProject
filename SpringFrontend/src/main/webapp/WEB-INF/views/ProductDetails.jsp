<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/resources/images" var="images" scope="session" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.6.3/css/all.css'
	integrity='sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/'
	crossorigin='anonymous'>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
	<title>Details</title>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<%@include file="HeadScript.jsp"%>
<%@include file="NavBar.jsp"%>

<div class="container">
	<br>
	<p class="text-center">
		<a></a>
	</p>
	<hr>


	<div class="card">
		<div class="row">
			<aside class="col-sm-5 border-right">
				<article class="gallery-wrap">
					<div class="img-big-wrap">
						<div>
							<a href="#"><img style="height: 453px;"
								src="${images}/${productDetails.imgname1}"></a>
						</div>
					</div>
					<!-- slider-product.// -->
					<%-- <div class="img-small-wrap">
  <div class="item-gallery"> <img src="https://s9.postimg.org/tupxkvfj3/image.jpg"> </div>
  <div class="item-gallery"> <img src="https://s9.postimg.org/tupxkvfj3/image.jpg"> </div>
  <div class="item-gallery"> <img src="https://s9.postimg.org/tupxkvfj3/image.jpg"> </div>
  <div class="item-gallery"> <img src="${images}/${productObj.imgname1}"> </div>
</div> <!-- slider-nav.// -->
 --%>
				</article>
				<!-- gallery-wrap .end// -->
			</aside>
			<aside class="col-sm-7">
				<article class="card-body p-5">
					<h3 class="title mb-3">${productDetails.productName }</h3>

					<p class="price-detail-wrap">
						<span class="price h3 text-warning"> <span class="currency">US
								$</span><span class="num">${productDetails.price }</span>
						</span>

					</p>
					<!-- price-detail-wrap .// -->
					<dl class="item-property">
						<dt>Description</dt>
						<dd>
							<p>${productDetails.productDescription }</p>
						</dd>
					</dl>

					<dl class="param param-feature">
						<dt>Delivery</dt>
						<dd>Russia, USA, and Europe</dd>
					</dl>
					<!-- item-property-hor .// -->

					<hr>
					
					<hr> 
					<c:if test="${productObj.quantity gt 0}">							
											
					<a
						href="${contextRoot}/addToCart/${productDetails.productId}"
						class="btn btn-lg btn-primary text-uppercase"> <i
						class="fas fa-shopping-cart"></i> Add to cart
					</a>
					</c:if>
					<c:if test="${productObj.quantity lt 1}">							
												<h4>Out of Stock</h4>
											</c:if>						
									
				</article>
				<!-- card-body.// -->
			</aside>
			<!-- col.// -->
		</div>
		<!-- row.// -->
	</div>
	<!-- card.// -->


</div>
<!--container.//-->


<br>
<br>
<br>
