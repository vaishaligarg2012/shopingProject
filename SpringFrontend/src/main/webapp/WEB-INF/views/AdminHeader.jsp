
<nav class="navbar navbar-expand-sm bg-dark navbar-dark" style="background-color: mediumspringgreen;">
  <ul class="nav navbar-nav">
      <li class=""><a href="${contextRoot}/HomePage">Home</a></li>
      
      <li><a href="#">Contact Us</a></li>
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
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="${contextRoot}/register"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="${contextRoot}/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
</nav>