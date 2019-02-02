<%@taglib prefix='f' uri="http://www.springframework.org/tags/form" %>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="504163670361-prsa2jkhfsj131se147vtlgc8e41cfuk.apps.googleusercontent.com">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
function onSignIn(googleUser) {
	console.log("Login with Google");
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	}
	
function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
  }
</script>
 <%@include file="AdminHeader.jsp" %>    
	
<div class="container">

'<div class="omb_login"> 
    	<h3 class="omb_authTitle">Login as <a href="register">Sign up</a></h3>
		<div class="row omb_row-sm-offset-3 omb_socialButtons">
    	    <div class="col-xs-4 col-sm-2">
			 <div class="g-signin2" data-onsuccess="onSignIn">
			       </div> 
		        </div>	
	        <div>   <a href="#" onclick="signOut();">Sign out</a>
	      </div>
			    	</div>

		<div class="row omb_row-sm-offset-3 omb_loginOr">
			<div class="col-xs-12 col-sm-6">
				<hr class="omb_hrOr">
				<span class="omb_spanOr">or</span>
			</div>
		</div>	

		<div class="row omb_row-sm-offset-3">
			<div class="col-xs-12 col-sm-6">	
			<span class="help-block">	</span> 
			    <f:form class="omb_loginForm"  action="submitLogin" method="POST" modelAttribute="userInfo">
					<div class="input-group" >
						<span class="input-group-addon"><i class="fa fa-user"></i></span>
					 	<f:input type="text" path="email" class="form-control" name="email" id="email" placeholder="email"/>
					    <f:errors path="email"/>
					</div>
					<span class="help-block"></span>
										
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock"></i></span>
						<f:input  type="password" path="password" class="form-control" name="pass" id="pass" placeholder="Password"/>
					    <f:errors path="password"/>
					</div>
                     					<span class="help-block"></span>
                     
					<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
				</f:form>
			</div>
    	</div>
		<div class="row omb_row-sm-offset-3">
		</div>	    	
	</div>
</div>
  <style>
  @charset "ISO-8859-1";

/*
    Note: It is best to use a less version of this file ( see http://css2less.cc
    For the media queries use @screen-sm-min instead of 768px.
    For .omb_spanOr use @body-bg instead of white.
*/

@media (min-width: 768px) {
    .omb_row-sm-offset-3 div:first-child[class*="col-"] {
        margin-left: 25%;
    }
}

.omb_login .omb_authTitle {
    text-align: center;
	line-height: 300%;
}
	
.omb_login .omb_socialButtons a {
	color: white; // In yourUse @body-bg 
	opacity:0.9;
}
.omb_login .omb_socialButtons a:hover {
    color: white;
	opacity:1;    	
}
.omb_login .omb_socialButtons .omb_btn-facebook {background: #3b5998;}
.omb_login .omb_socialButtons .omb_btn-twitter {background: #00aced;}
.omb_login .omb_socialButtons .omb_btn-google {background: #c32f10;}


.omb_login .omb_loginOr {
	position: relative;
	font-size: 1.5em;
	color: #aaa;
	margin-top: 1em;
	margin-bottom: 1em;
	padding-top: 0.5em;
	padding-bottom: 0.5em;
}
.omb_login .omb_loginOr .omb_hrOr {
	background-color: #cdcdcd;
	height: 1px;
	margin-top: 0px !important;
	margin-bottom: 0px !important;
}
.omb_login .omb_loginOr .omb_spanOr {
	display: block;
	position: absolute;
	left: 50%;
	top: -0.6em;
	margin-left: -1.5em;
	background-color: white;
	width: 3em;
	text-align: center;
}			

.omb_login .omb_loginForm .input-group.i {
	width: 2em;
}
.omb_login .omb_loginForm  .help-block {
    color: red;
}

	
@media (min-width: 768px) {
    .omb_login .omb_forgotPwd {
        text-align: right;
		margin-top:10px;
 	}		
}
  </style>