<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>Add Category</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ include file = "AdminHeader.jsp" %>

<f:form class="form-horizontal" action="${contextRoot}/submitProduct" method="post" modelAttribute="productObj"  enctype="multipart/form-data">
    <fieldset>
        <!-- Form Name -->
        <legend>Add Product</legend>
        <!-- Text input-->
        ${msg}
           <div class="form-group">
        	<label class="col-md-4 control-label" for="category">Category :</label>
        	<div class="col-md-5">  
        		<f:select class="form-control" path="categoryId">
        			<f:option  value="0">----Select Category------</f:option>
        			<c:forEach items="${categories}" var="cat">
        				<f:option value="${cat.catId}">${cat.catName}</f:option>
        			</c:forEach>
        		</f:select>
        	</div>
        </div>
        
        <div class="form-group">
        	<label class="col-md-4 control-label" for="supplier">Supplier :</label>
        	<div class="col-md-5">
        		<f:select class="form-control" path="supplierId">
        			<f:option value="0">----Select Supplier------</f:option>
        			<c:forEach items="${supplier}" var="sup">
        				<f:option value="${sup.supplierId}">${sup.supplierName}</f:option>
        			</c:forEach>
        		</f:select>
        	</div>
        </div>
      	<!--  Add File -->
			<div class="form-group">
				<label for="pimage2" class="col-md-4 control-label" > Upload
					Image : </label>
				<div class="col-md-5">
					<f:input type="file" class="form-control" id="pimage1"
						placeholder="Choose Image" path="pimage1" multiple="multiple" />
				</div>
			</div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="title">Product Name</label>
            <div class="col-md-5">
                <f:input id="name" path="productName" name="name" type="text" placeholder="Enter Product Name" class="form-control input-md"/>
               	<f:errors style="color: red;" path="productName"/> 
            </div>
        </div>
                 <!-- Textarea -->
        <div class="form-group" >
            <label class="col-md-4 control-label" for="description">Description</label>

            <div class="col-md-4">
                <f:textarea style="width: 100%;" class="form-control" placeholder="Description" path="productDescription" id="description" name="description"/>
            </div>
        </div>
        
    
        <div class="form-group">
            <label class="col-md-4 control-label" for="title">Price</label>
            <div class="col-md-5">
                <f:input id="price" path="price" name="price" type="number" placeholder="Enter Product Price" class="form-control input-md" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="title">Quantity</label>
            <div class="col-md-5">
                <f:input id="quantity" path="quantity" name="quantity" type="number" placeholder="Enter Product Quantity" class="form-control input-md" />
                <f:errors style="color: red;" path="quantity"/>
            </div>
        </div>
         <!-- Button (Double) -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="saveBtn"></label>
            <div class="col-md-8">
                <input type="submit" id="saveBtn" name="saveBtn" class="btn btn-success" value="Save"/>
                <input type="reset" id="cancelBtn" name="cancelBtn" class="btn btn-inverse" value="Cancel"/>
            </div>
        </div>

    </fieldset>
</f:form>
0