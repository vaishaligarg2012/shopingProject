<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>${formLabel}</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<%@ include file="AdminHeader.jsp"%>
</head>
<body>

	<f:form class="form-horizontal"
		action="${contextRoot}/${submitUpdateOrAdd}" method="post"
		modelAttribute="key123">
		<fieldset>
			<!-- Form Name -->
			<legend>${formLabel}</legend>
			<!-- Text input-->
			${msg}
			<c:if test="${not empty op}">
				<div class="form-group">
					<label class="col-md-4 control-label" for="supplierId">Id</label>
					<div class="col-md-5">
						<f:input id="name" path="supplierId" name="supplierId" type="text"
							class="form-control input-md" readonly="true" />
					</div>
				</div>
			</c:if>
			<div class="form-group">
				<label class="col-md-4 control-label" for="title">Name</label>
				<div class="col-md-5">
					<f:input id="name" path="supplierName" name="name" type="text"
						placeholder="Enter Supplier Name" class="form-control input-md" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" for="title">Email</label>
				<div class="col-md-5">
					<f:input id="email" path="supplierEmail" name="email" type="email"
						placeholder="Enter Supplier Email" class="form-control input-md" />
						<f:errors style="color: red;" path="supplierEmail"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" for="title">Mobile</label>
				<div class="col-md-5">
					<f:input id="mobile" path="supplierMobile" name="mobile"
						type="number" placeholder="Enter Supplier Mobile"
						class="form-control input-md" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" for="description">Full
					Address</label>
				<div class="col-md-4">
					<f:textarea style="width: 100%;" class="form-control"
						placeholder="Enter Permanent Address" path="address.addressLine"
						id="pAdd" name="pAdd" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" for="pincode">Pincode</label>
				<div class="col-md-5">
					<f:input id="pincode" path="address.pincode" name="pincode"
					     placeholder="Enter pincode"
						class="form-control input-md" />
						<f:errors path="address.pincode" style="color: red;"/>
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-4 control-label" for="city">City</label>
				<div class="col-md-5">
					<f:input id="city" path="address.city" name="city" type="text"
						placeholder="Enter City" class="form-control input-md" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-4 control-label" for="state">State</label>
				<div class="col-md-5">
					<f:input id="state" path="address.state" name="state" type="text"
						placeholder="Enter state" class="form-control input-md" />
				</div>
			</div>

			<!-- Button (Double) -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="saveBtn"></label>

				<div class="col-md-8">
					<button id="saveBtn" name="saveBtn" class="btn btn-success">${btnLabel}</button>
					<button id="cancelBtn" name="cancelBtn" class="btn btn-inverse">Cancel</button>
				</div>
			</div>

		</fieldset>
	</f:form>
</body>
</html>