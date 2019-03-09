<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>All Suppliers</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"
	rel='stylesheet' type='text/css'>
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.6.3/css/all.css'
	integrity='sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/'
	crossorigin='anonymous'>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/scroller/1.5.1/css/scroller.bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Latest compiled and minified CSS -->
<style>
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	width: 90%;
	margin-left: 83px;
	margin-top: 49px;
}

.card:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

.container {
	padding: 2px 16px;
}
</style>
<script>
  $(function(){
    $("#example").dataTable();
  })
  </script>
<%@include file="HeadScript.jsp"%>

<%@include file="NavBar.jsp"%>
<div class="col col-xs-6 text-right" style="width: 97%">
	<a type="button" class="btn btn-sm btn-primary btn-create"
		href="${contextRoot}/addSupplier">Add New Supplier</a>
</div>

<div class="alert alert-success">
		${msg}
</div>
<div class="card">

	<div class="container">

		<table id="example" class="table table-striped table-bordered nowrap">
			<thead>
				<tr>
					<th>Name</th>
					<th>Email</th>
					<th>Mobile</th>
					<th>Address Line 1</th>
					<th><em class="fa fa-cog"></em></th>

				</tr>
			</thead>
			<c:forEach items="${allSupplier}" var="obj1">
				<tr>
					<td>${obj1.supplierName}</td>
					<td>${obj1.supplierEmail}</td>
					<td>${obj1.supplierMobile }</td>
					<td>${obj1.address.addressLine}</td>
					<td align="center"><a
						href="${contextRoot}/updateSupplierDetails/${obj1.supplierId}"><i
							class="material-icons">create</i></a> <a
						href="${contextRoot}/deleteSupplier/${obj1.supplierId}"><i
							class='fas fa-trash'></i></a></td>

				</tr>
			</c:forEach>

		</table>
	</div>
</div>

