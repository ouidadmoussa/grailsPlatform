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
<meta name="description" content="Administration Web Market Ebook" />
<title>Administration | Web market ebook</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <style type="text/css">
  


	
}
  
  </style>
<%--		----------------------------------------css-------------------------------------------------------------------------%>
<link rel="stylesheet" type="text/css" 
	href="${resource(dir: 'css/admin', file: 'bootstrap.css')}" >

<link rel="stylesheet" type="text/css" 
	href="${resource(dir: 'css/admin', file: 'neon-core.css')}" >
	
		<link rel="stylesheet" type="text/css" 
	href="${resource(dir: 'css/admin', file: 'entypo.css')}" >

	 

	<link rel="stylesheet" type="text/css" 
	href="${resource(dir: 'css', file: 'bootstrap-table.css')}" >
	
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic">

<%--	-----------------------------------------------js------------------------------------------------		--%>
	   <script src="http://code.jquery.com/jquery-1.11.0.min.js" charset="utf-8" ></script>
   <script src="${resource(dir: 'js/admin', file:'bootstrap.js')}"></script>
     <script src="${resource(dir: 'js', file:'bootstrap-table.js')}"></script>
<g:layoutHead />
</head>

<body class="page-body " >

<div class="page-container horizontal-menu">
	<div id="content">
	<header class="navbar navbar-fixed-top"><!-- set fixed position by adding class "navbar-fixed-top" -->
		
		<div class="navbar-inner">
		
			<!-- logo -->
			<div class="navbar-brand">
				<a href="index.html">
			<g:img dir="images" file="logo1.png"  width="88" alt="web Market ebook"/>  
				</a>
			</div>
			
			
			<!-- main menu -->
						
			<ul class="navbar-nav">
				<li class="opened ">
					<g:link controller="admin" >
						<i class="entypo-gauge"></i>
						<span>Dashboard</span>
					</g:link>
					
				</li>
				<li >
					<g:link controller="admin" action="admins">
						<i class="entypo-layout"></i>
						<span>Admins</span>
					</g:link>
					
				</li>
				<li>
						<g:link controller="admin" action="events">
						<i class="entypo-newspaper"></i>
						<span>Evenements</span>
					</g:link>
				</li>
				<li>
							<g:link controller="admin" action="formation">
						<i class="entypo-doc-text"></i>
						<span>Formations</span>
					</g:link>
					
				</li>
				<li>
						<g:link controller="admin" action="affiliates">
						<i class="entypo-bag"></i>
						<span>Affilies</span>
<%--						<span class="badge badge-secondary">9</span>--%>
					</g:link>
					
				</li>
			
			</ul>
						
			
			<!-- notifications and other links -->
			<ul class="nav navbar-right pull-right">
				
				<!-- dropdowns -->
				
				<!-- raw links -->
			
				
				<li class="sep"></li>
				
				<li>
						<g:link controller="logout">Logout
						 <i class="entypo-logout right"></i></g:link>

				
				</li>
				
				
				<!-- mobile only -->
				<li class="visible-xs">	
				
					<!-- open/close menu icon (do not remove if you want to enable menu on mobile devices) -->
					<div class="horizontal-mobile-menu visible-xs">
						<a href="#" class="with-animation"><!-- add class "with-animation" to support animation -->
							<i class="entypo-menu"></i>
						</a>
					</div>
					
				</li>
				
			</ul>
	
		</div>
	
	</header>		

			<g:layoutBody/>
	 
	  </div>
	  </div>
	<footer class="main">
	
		
	&copy; 2015 <strong>Web Market Ebook</strong>
	
</footer>		
	
</body>
</html>
