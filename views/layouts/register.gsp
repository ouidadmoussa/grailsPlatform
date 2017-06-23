<html>

<head>
 <style>

 </style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Web market ebook</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />

<%--		----------------------------------------css-------------------------------------------------------------------------%>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" />

<%------------------------------- --------------------my css---------------------------- ----%>


<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'base.css')}">
<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'thirdeffect.css')}">

<link rel="stylesheet" media="screen" href="${resource(dir:'css',file:'reset.css',plugin:'spring-security-ui')}" />
<link rel="stylesheet" media="screen" href="${resource(dir:'css',file:'spring-security-ui.css',plugin:'spring-security-ui')}" />
<jqui:resources />
<link rel="stylesheet" media="screen" href="${resource(dir:'css/smoothness',file:'jquery-ui-1.10.3.custom.css',plugin:'spring-security-ui')}" />
<link rel="stylesheet" media="screen" href="${resource(dir:'css',file:'jquery.jgrowl.css',plugin:'spring-security-ui')}" />
<link rel="stylesheet" media="screen" href="${resource(dir:'css',file:'jquery.safari-checkbox.css',plugin:'spring-security-ui')}" />
<link rel="stylesheet" media="screen" href="${resource(dir:'css',file:'auth.css',plugin:'spring-security-ui')}" />

<%--	-----------------------------------------------js------------------------------------------------		--%>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="${resource(dir: 'js', file: 'countries3.js')}"></script>
<script src="${resource(dir: 'js', file: 'bootstrap.min.js')}"></script>



<g:layoutHead />

</head>

<body>

	<!-- -----------------------------------------------first row ----------------------------------------	 -->
	<div class="my-container">
		<g:img dir="images" file="street.jpeg" class="img-responsive" />
	
	</div>
<div class="logo">

		<g:img dir="images" file="logo1.png"  class="img-responsive"/>
	</div>
	
	<s2ui:layoutResources module='register' />
	<g:layoutBody />



	<s2ui:showFlash />
	<!-- --------------------------------------------footer--------------------------------------- -->

 

	<footer class="footer ">

         
		<ul class="list-inline list-unstyled ">
			<li><a class="linkCustom" href="#">About</a></li>
			<li><a class="linkCustom" href="#">Blog</a></li>
			<li><a class="linkCustom" href="#">Help</a></li>
			<li><a class="linkCustom" href="#">Contact</a></li>
			<li><a class="linkCustom" href="#">Terms&Conditions</a></li>
		</ul>


	</footer>




	<!-- ****************************************************************************
                                 Scripts Angular
   ***************************************************************************  -->

</body>
</html>
