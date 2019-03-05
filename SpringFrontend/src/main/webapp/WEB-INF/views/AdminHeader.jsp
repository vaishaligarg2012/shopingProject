<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextRoot" value = "${pageContext.request.contextPath}" scope="session"/>


<nav class="navbar navbar-expand-sm bg-dark navbar-dark" style="background-color: mediumspringgreen;">
  <ul class="nav navbar-nav">  
      <li class=""><a href="${contextRoot}/HomePage">Home</a></li>
      
       
      <li class="dropdown">   
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Shop By Category
        </a>
        <ul class="dropdown-menu">  
          
          <c:forEach items="${categoryList}" var="cObj">
          	<li><a href="${contextRoot}/viewProductsById/${cObj.catId}">${cObj.catName}</a></li>
          </c:forEach> 
          
          
        </ul>
      </li>
      
      <li><a href="#">Contact Us</a></li>   
      
      
      <sec:authorize access="hasAuthority('Admin')">
      <li class="dropdown">   
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Supplier
        </a>
        <ul class="dropdown-menu">  
          <li><a href="${contextRoot}/addSupplier">Add Supplier</a></li>
          <li><a href="${contextRoot}/viewSuppplier">View All Supplier</a></li>
        </ul>
      </li>
       <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Product
        </a>
        <ul class="dropdown-menu">
          <li><a href="${contextRoot}/addProduct">Add Product</a></li>
          <li><a href="${contextRoot}/viewProducts">View All Products</a></li>
        </ul>
      </li>
     
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Category
        </a>
        <ul class="dropdown-menu">
          <li><a href="${contextRoot}/AddCategory">Add Category</a></li>
          <li><a href="${contextRoot}/viewAllCategory">View All Categories</a></li>
        </ul>
      </li>
      </sec:authorize>
      
      
      
    </ul>
    
    
    <ul class="nav navbar-nav navbar-right">
     
     <sec:authorize access="isAnonymous()">
      <li><a href="${contextRoot}/register"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="${contextRoot}/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </sec:authorize>
      
      <sec:authorize access="isAuthenticated()">
      
      <sec:authorize access="hasAuthority('User')">
      <li>
      	<a href="${contextRoot}/viewCart">View Cart</a>
      </li>	
      </sec:authorize>
      <li>Welcome : ${sessionScope.user.fName} ${sessionScope.user.lName}</li>
      <li><a href="${contextRoot}/logout">Logout</a></li>
      
      
      </sec:authorize>
      
    </ul>
    
    
</nav>