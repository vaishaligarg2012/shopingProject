<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link href="css/viewAllCategory.css" rel='stylesheet' type='text/css'>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.6.3/css/all.css' integrity='sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/' crossorigin='anonymous'>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
<%@ include file = "AdminHeader.jsp" %>

<div class="container">
    <div class="row">
    
        <div class="col-md-10 col-md-offset-1">

            <div class="panel panel-default panel-table">
              <div class="panel-heading">
               <div> ${msg}</div>
                <div class="row">
                  <div class="col col-xs-6">
                    <h3 class="panel-title">Category List</h3>
                  </div>
                  <div class="col col-xs-6 text-right">
                    <a type="button" class="btn btn-sm btn-primary btn-create" href="${contextRoot}/AddCategory">Add New Category</a>
                  </div>
                </div>
              </div>
              <div class="panel-body">
                <table class="table table-striped table-bordered table-list">
                  <thead>
                    <tr>
                        <th class="hidden-xs">ID</th>
                        <th>Category Title</th>
                        <th>Category Description</th>
                        <th><em class="fa fa-cog"></em></th>
                        
                    </tr> 
                  </thead>
                  <tbody>
                  <c:forEach items= "${categoryList}" var = "objs">
                          <tr>
                            <td class="hidden-xs">${objs.catId }</td>
                            <td>${objs.catName }</td>
                            <td>${objs.catDescription}</td>
                            <td align="center">
                              <a  href="${contextRoot}/updateCategory/${objs.catId}" ><i class="material-icons">create</i></a>
                              <a  href="${contextRoot}/deleteCategory/${objs.catId}"><i class='fas fa-trash'></i>
</a>
                            </td>
                        
                          </tr>
                          </c:forEach>
                        </tbody>
                </table>
            
              </div>
              <div class="panel-footer">
                <div class="row">
                  <div class="col col-xs-4">Page 1 of 5
                  </div>
                  <div class="col col-xs-8">
                    <ul class="pagination hidden-xs pull-right">
                      <li><a href="#">1</a></li>
                      <li><a href="#">2</a></li>
                      <li><a href="#">3</a></li>
                      <li><a href="#">4</a></li>
                      <li><a href="#">5</a></li>
                    </ul>
                    <ul class="pagination visible-xs pull-right">
                        <li><a href="#">«</a></li>
                        <li><a href="#">»</a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>

</div></div></div>