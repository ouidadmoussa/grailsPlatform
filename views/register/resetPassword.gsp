<html>

<head>
<title><g:message code='spring.security.ui.resetPassword.title'/></title>
<meta name='layout' content='register'/>
</head>

<body>

<p/>

<div class=" container" style="height: 70%;">
		<div class="row  ">
			<div
				class="col-md-5 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
				<div class="">

	<g:form action='resetPassword' name='resetPasswordForm' autocomplete='off'>
	<g:hiddenField name='t' value='${token}'/>
	<div class="sign-in">

	<br/>
	<h4><g:message code='spring.security.ui.resetPassword.description'/></h4>

	<table>
		<s2ui:passwordFieldRow name='password' labelCode='resetPasswordCommand.password.label' bean="${command}"
                           class="emailField  form-control" placeholder="Password " value="${command?.password}"/>

		<s2ui:passwordFieldRow name='password2' labelCode='resetPasswordCommand.password2.label' bean="${command}"
                       class="emailField  form-control" placeholder="Password (again)" value="${command?.password2}"/>
	</table>

	<s2ui:submitButton elementId='reset' form='resetPasswordForm'  class="btn logInButton btn-lg btn-block"
	 messageCode='spring.security.ui.resetPassword.submit'/>

	</div>
	</g:form>

</div></div></div></div>

<script>
$(document).ready(function() {
	$('#password').focus();
});
</script>

</body>
</html>
