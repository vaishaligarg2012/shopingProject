<title>Add Category</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>AllCategories</title>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="HeadScript.jsp"%>
<%@include file="NavBar.jsp"%>
<body>
	<f:form class="form-horizontal"
		action="${contextRoot}/${submitUpdateOrAdd}" method="post"
		modelAttribute="key12" >
		<fieldset>
		<div class="alert alert-success">
			${msg}
		</div>
			<!-- Form Name -->
			<legend>${formLabel}</legend>
			<!-- Text input-->
			<c:if test="${not empty op}">
				<div class="form-group">
					<label class="col-md-4 control-label" for="id">Category Id</label>
					<div class="col-md-5">
						<f:input id="id" path="catId" name="id" type="text"
							placeholder="Category Id" class="form-control input-md"
							readonly="true" />
					</div>
				</div>
			</c:if>

			<div class="form-group">
				<label class="col-md-4 control-label" for="title">Title</label>
				<div class="col-md-5">
					<f:input id="title" path="catName" name="title" type="text"
						placeholder="Category Title" class="form-control input-md" />
						<f:errors path="catName"/>
				</div>
			</div>


			<!-- Textarea -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="description">Description</label>
				<div class="col-md-4">
					<f:textarea style="width: 100%;" class="form-control"
						placeholder="Description" path="catDescription" id="description"
						name="description" />
						<f:errors styles="color: red;" path="catDescription"/>
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