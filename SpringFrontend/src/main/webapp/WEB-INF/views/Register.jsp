<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@include file="AdminHeader.jsp"%>

<div class="container register">
	<div class="row">
		${msg}
		<div class="col-md-3 register-left">
			<img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="" />
			<h3>Welcome</h3>
			<br />
		</div>
		<div class="col-md-9 register-right">
			<div class="tab-content" id="myTabContent">
				<a href="login">Login</a>
				<div class="active" id="home" role="tabpanel"
					aria-labelledby="home-tab">
					<h3 class="register-heading">Registration</h3>
					<f:form class="form-horizontal"
						action="${contextRoot}/submitRegister" method="post"
						modelAttribute="userKey">
						<div class="row register-form">
							<div class="col-md-6">
								<div class="form-group">
									<f:input type="text" path="fName" class="form-control"
										placeholder="First Name *" value="" />
								</div>
								<div class="form-group">
									<f:input type="text" path="lName" class="form-control"
										placeholder="Last Name *" value="" />
								</div>
								<div class="form-group">
									<f:input type="password" path="password" class="form-control"
										placeholder="Password *" value="" />
										<f:errors path="password"/>
								</div>
								<div class="form-group">
									<input type="password" class="form-control"
										path="confirmPassword" placeholder="Confirm Password *" value="" />
							            <f:errors path = "confirmPassword"/>
								</div>

							</div>
							<div class="col-md-6">
								<div class="form-group">
									<f:input type="email" path="email" class="form-control"
										placeholder="Your Email *" value="" />
										<f:errors path="email"/>
								</div>
								<div class="form-group">
									<f:input type="text" name="txtEmpPhone" path="phone"
										class="form-control" placeholder="Your Phone *" value="" />
									<f:errors path="phone"/>
								</div>

								<input type="submit" class="btnRegister" value="Register" />
							</div>
						</div>
					</f:form>
				</div>

			</div>
		</div>
	</div>

</div>

<style>
.register {
	background: -webkit-linear-gradient(left, #3931af, #00c6ff);
	margin-top: 3%;
	padding: 3%;
}

.register-left {
	text-align: center;
	color: #fff;
	margin-top: 4%;
}

.register-left input {
	border: none;
	border-radius: 1.5rem;
	padding: 2%;
	width: 60%;
	background: #f8f9fa;
	font-weight: bold;
	color: #383d41;
	margin-top: 30%;
	margin-bottom: 3%;
	cursor: pointer;
}

.register-right {
	background: #f8f9fa;
	border-top-left-radius: 10% 50%;
	border-bottom-left-radius: 10% 50%;
}

.register-left img {
	margin-top: 15%;
	margin-bottom: 5%;
	width: 25%;
	-webkit-animation: mover 2s infinite alternate;
	animation: mover 1s infinite alternate;
}

@
-webkit-keyframes mover { 0% {
	transform: translateY(0);
}

100%
{
transform


:

 

translateY


(-20
px
);

 

}
}
@
keyframes mover { 0% {
	transform: translateY(0);
}

100%
{
transform


:

 

translateY


(-20
px
);

 

}
}
.register-left p {
	font-weight: lighter;
	padding: 12%;
	margin-top: -9%;
}

.register .register-form {
	padding: 10%;
	margin-top: 10%;
}

.btnRegister {
	float: right;
	margin-top: 10%;
	border: none;
	border-radius: 1.5rem;
	padding: 2%;
	background: #0062cc;
	color: #fff;
	font-weight: 600;
	width: 50%;
	cursor: pointer;
}

.register .nav-tabs {
	margin-top: 3%;
	border: none;
	background: #0062cc;
	border-radius: 1.5rem;
	width: 28%;
	float: right;
}

.register .nav-tabs .nav-link {
	padding: 2%;
	height: 34px;
	font-weight: 600;
	color: #fff;
	border-top-right-radius: 1.5rem;
	border-bottom-right-radius: 1.5rem;
}

.register .nav-tabs .nav-link:hover {
	border: none;
}

.register .nav-tabs .nav-link.active {
	width: 100px;
	color: #0062cc;
	border: 2px solid #0062cc;
	border-top-left-radius: 1.5rem;
	border-bottom-left-radius: 1.5rem;
}

.register-heading {
	text-align: center;
	margin-top: 8%;
	margin-bottom: -15%;
	color: #495057;
}
</style>