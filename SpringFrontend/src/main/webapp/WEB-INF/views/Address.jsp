<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<%@include file="HeadScript.jsp"%>
<%@include file="NavBar.jsp"%>
				<legend>Select a delivery address </legend>

<div class="row">

	<c:forEach items="${listofAddres}" var="listObj">
		<div class="column">
			<div class="card">
				<h3>${sessionScope.user.fName} ${sessionScope.user.lName}</h3>
				<p>${listObj.userAddressLine}</p>
				${listObj.userCity}
			    ${listObj.userState}
				${listObj.userPinCode}
				<button id="cancelBtn" name="cancelBtn" class="btn btn-inverse">Cancel</button>
				<a id="saveBtn" name="saveBtn" href="${contextRoot}/Reciept/${listObj.userAddressId}" class="btn btn-success">Deliver
					to this address</a>
			</div>
		</div>
	</c:forEach> 
</div>
<br/>
<div class="row">

	<div class="col-md-4 col-md-offset-4">
		<f:form class="form-horizontal" role="form"
			action="${contextRoot}/Reciept" method="POST"
			modelAttribute="key1">
			<fieldset>
				<!-- Form Name -->
				<p>Is the address you'd like to use displayed below? If so,
					click the corresponding "Deliver to this address" button.</p>
				<!-- Text input-->
				<div class="form-group">
					<label class="col-sm-2 control-label" for="textinput">Line
						1</label>
					<div class="col-sm-10">
						<f:input type="text" placeholder="Address Line 1" id="userAddressLine"
							name="userAddressLine" path="userAddressLine" class="form-control" />
                         <f:errors style="color: red;" path="userAddressLine"/>
					</div>
				</div>


				<!-- Text input-->
				<div class="form-group">
					<label class="col-sm-2 control-label" for="textinput">City</label>
					<div class="col-sm-10">
						<f:input type="text" placeholder="City" id="userCity" name="userCity"
							path="userCity" class="form-control" />
							<f:errors style="color: red;"   path="userCity"/>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-sm-2 control-label" for="textinput">State</label>
					<div class="col-sm-4">
						<f:input type="text" placeholder="State" id="userState" name="userState"
							path="userState" class="form-control" />
							<f:errors style="color: red;"  path="userState"/>
					</div>

					<label class="col-sm-2 control-label" for="textinput">Postcode</label>
					<div class="col-sm-4">
						<f:input type="text" placeholder="Post Code" id="userPinCode"
							name="userPinCode" path="userPinCode" class="form-control" />
							<f:errors style="color: red;"  path="userPinCode"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="pull-right">

							<button id="saveBtn" name="saveBtn" class="btn btn-success">Add Address</button>
							<button id="cancelBtn" name="cancelBtn" class="btn btn-inverse">Cancel</button>

						</div> 
					</div>
				</div>

			</fieldset>
		</f:form>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<style>
* {
	box-sizing: border-box;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

/* Float four columns side by side */
.column {
	float: left;
	width: 25%;
	padding: 0 10px;
}

/* Remove extra left and right margins, due to padding */
.row {
	margin: 0 -5px;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Responsive columns */
@media screen and (max-width: 600px) {
	.column {
		width: 100%;
		display: block;
		margin-bottom: 20px;
	}
}

/* Style the counter cards */
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	padding: 16px;
	text-align: center;
	background-color: #f1f1f1;
}
</style>
