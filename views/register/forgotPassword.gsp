<html>

<head>
<title><g:message code='spring.security.ui.forgotPassword.title'/></title>
<meta name='layout' content='register'/>
</head>

<body>

<p/>
<div class=" container" style="height: 80%;">
		<div class="row  ">
			<div
				class="col-md-5 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
 <div class="logInContainer">

	<g:form action='forgotPassword' name="forgotPasswordForm" autocomplete='off'>

	<g:if test='${emailSent}'>
	<br/>
	<g:message code='spring.security.ui.forgotPassword.sent'/>
	</g:if>

	<g:else>

	<br/>
	<h4><g:message code='spring.security.ui.forgotPassword.description'/></h4>

	<table style="width: 100%;">
		<tr>
<%--			<td><label for="username"><g:message code='spring.security.ui.forgotPassword.username'/></label></td>--%>
			<td><g:textField name="username" class="emailField form-control" placeholder="Email "/></td>
		</tr>
	</table>

	<s2ui:submitButton elementId='reset' form='forgotPasswordForm' class="btn logInButton btn-lg btn-block"
	 messageCode='spring.security.ui.forgotPassword.submit'/>

	</g:else>

	</g:form>
</div>
</div></div></div>
<script>
$(document).ready(function() {
	$('#username').focus();
});
</script>

</body>
</html>
