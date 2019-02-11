
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/resources/design" var="design" scope="session" />
<%@include file="HeadScript.jsp" %>
<%@include file="NavBar.jsp"%>
 <%@page session="true"%>
<div class="banner slider">  
    <div id="demo" class="carousel slide" data-ride="carousel"  data-interval="false">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>


  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${design}/1.jpg" style="height: 100%" alt="Los Angeles">
    
       </div>
    <div class="carousel-item"> 
      <img src="${design}/2.jpg"  style="height: 100%" alt="Chicago">
      </div> 
    <div class="carousel-item">
      <img src="${design}/3.jpg" style="height: 100%" alt="New York">
    </div>
  </div>  

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>

</div>
</div>
<div class="upcoming py-5">
    <div class="container">
    <div class="row pb-4 text-center">
        <div class="col-md-12">
            <h2>Shop by category</h2>
           </div>
    </div>
	<div class="row text-center">
		<c:forEach items="${categoryList}" var="category">
					
		<div class="col-md-3 box border py-4">
		    
		    <div class="box-cartitle">
		        <h4>${category.catName}</h4>
		    </div>
		    
		 <a type="button" href="${contextRoot}/viewProductsById/${category.catId}" class="btn btn-outline-danger">Shop Now</a>
		</div>
		</c:forEach>
			</div>
	<div class="row text-center pt-4">
	    <div class="col-md-12">
	        <a type="button" class="btn btn-danger" href="${contextRoot}/viewProducts">View All Upcoming Products</a>
	    </div>
	</div>
</div>
</div>
<div class="help py-5 bg-secondary twhite">
<div class="container py-5">
	<div class="row text-center">
		<div class="col-md-12">
		    <i class="fa fa-headphones fa-3x"></i>
		    <h3>How can we help you?</h3>
		    <p>Fusce imper diet odio sit amet erat conse quat, eget eleme nmper diet odio sit amet erat atege tpurc surus lorem iandit vehi culas.</p>
		    <button type="button" class="btn btn-danger">Ask the Question</button>
		</div>
	</div>
</div>
</div>


<div class="footer  py-5  ">
	<div class="container">
	  <div class="row">
		<div class="col-xs-12 col-sm-6 col-md-3 footer-one">
		    <img src="https://ya-webdesign.com/images/shopping-transparent-logo-png.png" alt="Logo" style="width:120px;">
			
		   	<div class="social-icons"> 
               <a href="https://www.facebook.com/"><i id="social-fb" class="fa fa-facebook-square fa-3x social"></i></a>
               <a href="https://twitter.com/"><i id="social-tw" class="fa fa-twitter-square fa-3x social"></i></a>
	            <a href="https://plus.google.com/"><i id="social-gp" class="fa fa-google-plus-square fa-3x social"></i></a>
	            <a href="mailto:bootsnipp@gmail.com"><i id="social-em" class="fa fa-envelope-square fa-3x social"></i></a>
	        </div>	
		</div>
	  </div>
	</div>
</div>

<style>
/************* GENERIC  *****************/
a {color:#696969;}
img {width:100%;}
.twhite {color:#fff!important;}
/************* TOP-HEAD *****************/
.top-head ul li {padding-right:8px;}
/****************** Navigation **************/
.navbar-toggler {border-color: #dd0000;}
.navbar-toggler-icon {
  background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 32 32' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgb(221, 0, 0, 0.7)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 8h24M4 16h24M4 24h24'/%3E%3C/svg%3E");
}
/**************** Banner Slider Carousel **************/
.carousel-inner img {width: 100%;}
.carousel-caption {color:#000;top:110px; bottom: auto; text-align:left;}
.carousel-caption h1 { color:#dd0000; background-color:#;}
/************ Services **************/
.most-car-box:hover {background: ; box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);}
/*********** TABS *******/
.nav-tabs { border-bottom: 1px solid #ccc; }
.nav-tabs .nav-link.active {
    border-bottom: 1px solid #dd0000;
    border-radius:0px;
}
/**************** Social ICONS ***************/
/* Social Icons */

.social-icons{margin: 0;padding: 0; font-size : 10px;}
.social {margin:7px 7px 7px 0px;}
#social-fb:hover {color: #3B5998;transition:all .25s;}
 #social-tw:hover {color: #4099FF;transition:all .25s;}
 #social-gp:hover {color: #d34836;transition:all .25s;}
 #social-em:hover {color: #f39c12;transition:all .25s;}

</style>






