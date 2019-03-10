<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/resources/images" var="images" scope="session" />
    <c:set var="contextRoot" value="${pageContext.request.contextPath}"
	scope="session" />

<
<%@include file="HeadScript.jsp"%>
<%@include file="NavBar.jsp"%>

<div class="container">
	<div class="row">
		<br /> <br />

		<div class="col-xs-12 col-md-4"
			style="margin-left: 381px; margin-top: 18px;">
			<f:form method="POST" action="${contextRoot}/proccedToPay"
				modelAttribute="key2" role="form">

				<div class="panel panel-default">

					<div class="panel-heading">
						<h3 class="panel-title">Payment Details</h3>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<label for="cardNumber"> CARD NUMBER</label>
							<div class="input-group">
								<f:input type="text" path="cardNo" class="form-control"
									id="cardNo" placeholder="Valid Card Number" />
					
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-lock"></span></span>
					
							</div>
										<f:errors style="color: red;" path="cardNo" />
							
						</div>
						<div class="form-group">
							<label for="cardName"> NAME ON CARD</label>
							<div class="input-group">
								<f:input type="text" path="nameOnCard" class="form-control"
									id="nameOnCard" placeholder="Name on card" />
								<f:errors style="color: red;" path="nameOnCard" />
                            </div>
						</div>
						<div class="row">
							<div class="col-xs-7 col-md-7">
								<div class="form-group">
									<label for="expityMonth"> EXPIRY DATE</label>
									<div class="col-xs-6 col-lg-6 pl-ziro">
										<f:input type="number" class="form-control" path="mm" id="mm"
											placeholder="MM" />

										<f:errors style="color: red;" path="mm" />
									</div>
									<div class="col-xs-6 col-lg-6 pl-ziro">
										<f:input type="number" path="yy" class="form-control"
											style="width: 82px;" id="yy" placeholder="YYYY" />
										<f:errors style="color: red;" path="yy" />

									</div>

								</div>
							</div>
							<div class="col-xs-5 col-md-5 pull-right">
								<div class="form-group">
									<label for="cvCode"> CVV CODE</label>
									<f:input type="password" class="form-control" path="cvv"
										id="cvv" placeholder="CVV" />
									<f:errors style="color: red;" path="cvv" />

								</div>
							</div>
						</div>
					</div>
				</div>
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="#"><span
							class="badge pull-right"><span
								class="glyphicon glyphicon-usd"></span>${grandTotal}</span> Final Payment</a></li>
				</ul>
				<br />
				<button id="saveBtn" name="saveBtn" class="btn btn-success">PAY</button>
			</f:form>

		</div>
	</div>
</div>
<style>
body {
	margin-top: 20px;
}

.panel-title {
	display: inline;
	font-weight: bold;
}

.checkbox.pull-right {
	margin: 0;
}

.pl-ziro {
	padding-left: 0px;
}
</style>
