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
<meta name="viewport" content="width=device-width, initial-scale=1">
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

<%--	-----------------------------------------------js------------------------------------------------		--%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<script src="${resource(dir: 'js', file: 'bootstrap.min.js')}"></script>


<g:layoutHead />
</head>
<body >
<div id="bodyContainer">
 <div id="content">
	<!-- -----------------------------------------------first row ----------------------------------------	 -->
<nav class="navbar navbar-default menuTop " >
  <div class="container-fluid ">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed"
      style="height: 30px;margin-top: 2px;margin-bottom: 2px;"
       data-toggle="collapse" data-target="#navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    
      <ul class="navbar-brand  soc" >
					<li><a class="soc-facebook" href="#"></a></li>
					<li><a class="soc-twitter" href="#"></a></li>
					<li><a class="soc-linkedin" href="#"></a></li>
					<li><a class="soc-instagram" href="#"></a></li>
					<li><a class="soc-youtube soc-icon-last" href="#"></a></li>
				</ul>
      
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="navbar-collapse-1">
      <ul class=" navbar-nav list-unstyled navbar-right">
      
			<li><a href="#" class="linkCustom">Blog</a></li>
			<li><a href="#" class="linkCustom">FAQ</a></li>
			<li><a href="#" class="linkCustom">Support</a></li>
			<li><g:select name="language"  class="form-control languageSelect "
			from="${['Français', 'Anglais', 'Arabe']}"/>
			
			</li>
      </ul>
     
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

	<!--  ------------------------------second row -------------------------------------- -->

	<nav class=" nav menuTop2" >
	 <div class="col-md-3">
	 	<g:img dir="images" file="logo1.png" class="img-responsive" />
	 </div>
	 <div class="col-md-6 " style="float: right;">
	 	<ul class=" navbar-nav list-unstyled list-inline "
					style="margin-top: 9px;">

			            <li><g:link class="linkCustom" uri="/">Home</g:link></li>
						<li><g:link class="linkCustom" controller="product" action="listProducts"  >Products</g:link></li>
						<li><g:link class="linkCustom" controller="shop" action="listShops">Shops</g:link></li>
					<li><g:link class="linkCustom" controller="user" action="listAffiliates">Affiliates</g:link></li>
					<sec:ifNotLoggedIn>
					<li><g:link class="linkCustom" controller="register">Joins us</g:link></li>
					</sec:ifNotLoggedIn>
				   	<sec:ifNotLoggedIn>
					<li><g:link class="linkCustom" controller="login" action="auth">Login</g:link></li>
					</sec:ifNotLoggedIn>
					
					<sec:ifLoggedIn>
						<li><g:link class="linkCustom" controller="user" action="myProfil">Profile</g:link></li>
					</sec:ifLoggedIn>

				</ul>
<%--	   					<div class="input-group" style="margin-top: 5px; height: 25px">--%>
<%--                    <input type="text" class="form-control " placeholder="Search ">--%>
<%--                    <span class="input-group-btn">--%>
<%--                        <button type="submit" class="btn btn-default ">--%>
<%--                        <span class="glyphicon glyphicon-search"></span>--%>
<%--                        </button>--%>
<%--                    </span>--%>
<%--                </div>--%>
	 
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
		
		
		
		
		
		
		
   <!-- ****************************************************************************
                                 Scripts Angular
   ***************************************************************************  -->       		
	
</body>
</html>
