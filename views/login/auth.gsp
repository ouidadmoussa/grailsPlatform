<html>

<head>
	<meta name="layout" content="register"/>
	<title><g:message code='spring.security.ui.register.title'/></title>
	
</head>

<body >
	<div class=" container" style="height: 70%;">
		<div class="row  ">
			<div
				class="col-md-5 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
				<div class="logInContainer">
	  <form action='${postUrl}' method='POST' id="loginForm" name="loginForm" 
	  
	  autocomplete='off' style="display: table-row; ">
		
			<g:textField name="j_username" id="username"
				placeholder="Email or username" class="emailField form-control"/>
				
			<g:passwordField name="j_password" id="password" 
				placeholder="Password"  class="emailField form-control" />
				
           
			  <s2ui:submitButton elementId='loginButton' 
             form='loginForm'  class="btn logInButton btn-lg btn-block"
             messageCode='spring.security.ui.login.login'/>
             
          
             <input type="checkbox"  name="${rememberMeParameter}"
				id="remember_me" checked="checked" /> <label for='remember_me'><g:message
					code='spring.security.ui.login.rememberme' /></label> |
			
			<g:link controller='register' action='forgotPassword'>
				<g:message code='spring.security.ui.login.forgotPassword' />
			</g:link>|
			<s2ui:linkButton elementId='register'
			 controller='register' messageCode='spring.security.ui.login.register'/>
	
			
          
	</form>	
				
				</div>
			</div>
		</div>
	</div>




	<script type="text/javascript">
$(document).ready(function() {
	$('#username').focus();
});

<s2ui:initCheckboxes/>

function print_cities(country_id){
      <g:remoteFunction controller="Register" action="cities" update="city"
			 params="'countryId='+country_id"/>

}
</script>
</body>
</html>



