<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Web market ebook</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%--		----------------------------------------css-------------------------------------------------------------------------%>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" />


<%------------------------------- --------------------my css---------------------------- ----%>


<link rel="stylesheet" type="text/css" 
	href="${resource(dir: 'css', file: 'base.css')}" >
	
<link rel="stylesheet" type="text/css"
	href="${resource(dir: 'css', file: 'thirdeffect.css')}" >

<link rel="stylesheet" type="text/css"
	href="${resource(dir: 'css', file: 'full-slider.css')}" >		

<link rel="stylesheet" type="text/css" 
	href="${resource(dir: 'css', file: 'verticalMenu.css')}" >
	
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'social-buttons-3.css')}">	
<%--	-----------------------------------------------js------------------------------------------------		--%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script src="${resource(dir: 'js', file: 'youtubeApi.js')}"></script>
<script src="${resource(dir: 'js', file: 'editFields.js')}"></script>
<g:layoutHead />
</head>
<body >
<div id="bodyContainer">
 <div id="content">
<nav class=" nav menuTop2 ">

		<div class="col-md-3 ">
				<g:img dir="images" file="logo1.png" class="img-responsive" />
		</div>

		<div class="col-md-4 ">

			<div class="input-group "
				style="margin-top: 5px; height: 25px; width: 100%;">
				<input type="text" class="form-control " placeholder="Search ">
				<span class="input-group-btn">
					<button type="submit" class="btn btn-default ">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</span>
			</div>
		</div>

		<div class="col-md-5 "  >
			<ul class="navbar-nav list-unstyled list-inline  "   id="menu"
				style="margin-top: 12px;">

				<li><g:link class="linkCustom" uri="/">Home</g:link></li>
				<li><g:link class="linkCustom" controller="product">Products</g:link></li>
				<li><g:link class="linkCustom" controller="shop">Shops</g:link></li>
				<li><g:link class="linkCustom" controller="user"  action="listAffiliates">Affiliates</g:link></li>
				<sec:ifLoggedIn>
				
				<li class="dropdown " style="background-color:  #1fa67a;" >
				
				<g:link   controller='user' action='myProfil' class=" linkCustom dropdown-toggle"
				aria-haspopup="true" aria-expanded="false">
					
					${user.username }     <span class="caret"></span></g:link>
					
					<ul class="dropdown-menu profilButton ">
						
						<li><g:link controller='user' action='dashboard'>Dashboard </g:link></li>
						<sec:ifAnyGranted roles="ROLE_ADMIN">
						<li><g:link controller='admin' action='index'>Administration </g:link></li>
						</sec:ifAnyGranted>
						<li>
						<g:link controller="logout">Logout</g:link>
						
						</li>
		         	</ul></li>
                </sec:ifLoggedIn>

			</ul>
		</div>

	</nav>
	<g:layoutBody />
	</div></div>
	<!-- --------------------------------------------footer--------------------------------------- -->
		<footer id="footer" class=" footerCss" >
		<div class="container">
		<div class="row">
		
		 <div class="col-md-6 ">
			<ul class="navbar-nav list-inline list-unstyled" >
					<li><a href="#" class="footerLink" >Terme&Conditions</a></li>
					<li><a href="#" class="footerLink">plan de rémuniration </a></li>
					<li><a href="#" class="footerLink">A propos</a></li>
			</ul>
			</div>
		
		  <div class="col-md-4 col-md-offset-2 " >
		      
<%--		         <g:img dir="images" file="logo.png" width="110px" />--%>
				<p><i class="glyphicon glyphicon-copyright-mark"></i> copyRight reserver 2014</p>
			</div>	
			</div></div>
		</footer>
		
		

</body>
</html>