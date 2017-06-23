<html>

<head>
<meta name='layout' content='register' />
<title><g:message code='spring.security.ui.register.title' /></title>
</head>

<body>



	<div class=" container">
		<div class="row">
			<div
				class="col-md-5 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">

				<div class=" sigInContainer" style="height: 500px;">
					<h4 class="" style="display: table-row;">Not a member yet ?
						Join us now</h4>
					<g:form action='register' name='registerForm'
						enctype="multipart/form-data" style="display: table-row;">
						<div class="panel-body">
							<g:if test='${emailSent}'>
								<br />
								<g:message code='spring.security.ui.register.sent' />
							</g:if>
							<g:else>

								<br />

								<table>
									<tbody class="firstDiv">

										<s2ui:textFieldRow name='username' style="margin-top:10%;"
											labelCode='user.username.label' bean="${command}"
											class="emailField form-control " placeholder='Username'
											value="${command.username}" />

										<s2ui:textFieldRow name='email' labelCode='user.email.label'
											bean="${command}" class="emailField form-control "
											placeholder='E-mail' value="${command.email}" />

										<s2ui:passwordFieldRow name='password'
											labelCode='user.password.label' bean="${command}"
											class="emailField form-control " placeholder='Password'
											value="${command.password}" />

										<s2ui:passwordFieldRow name='password2'
											labelCode='user.password2.label' bean="${command}"
											class="emailField form-control "
											placeholder='Password (again)' value="${command.password2}" />


										<tr class="prop">
											<td valign="top" class="name"><label for="${name}">
													${message(code: labelCode, default: labelCodeDefault)}
											</label></td>
											<td valign="top"
												class="value ${hasErrors(bean: command, field: 'parent', 'errors')}">
												<g:if test="${params.code }">
													<g:field type="text" name='parents'
														labelCode='user.email.label'
														class="emailField form-control " value='${params.code}'
														readonly="readonly" />
												</g:if> <g:else>
													<g:textField name='parents' labelCode='user.email.label'
														class="emailField form-control "
														placeholder='Code of your Parent affiliate' />
												</g:else>
											</td>
										</tr>


									</tbody>
									<%--                        _________________________________personnel data___________________________________________________________--%>

									<tbody class="secondDiv">
										<s2ui:textFieldRow name='firstName'
											labelCode='user.firstName.label' bean="${command}"
											class="emailField form-control " placeholder='First Name'
											value="${command.firstName}" />



										<s2ui:textFieldRow name='lastName'
											labelCode='user.email.label' bean="${command}"
											class="emailField form-control" placeholder='Last Name'
											value="${command.lastName}" />




										<tr class="prop  ">
											<td valign="top" class="name"><label for="${name}">
													${message(code: labelCode, default: labelCodeDefault)}
											</label></td>
											<td valign="top"
												class="value ${hasErrors(bean: command, field: 'birthDay', 'errors')}">
												<label class="custom-file-upload "> Select your
													birthDay<br /> <g:datePicker name="birthDay"
														value="${new Date()}"
														years="${Calendar.instance.get(Calendar.YEAR)..1910}"
														precision="day" noSelection="['':'-Choose-']" /> ${fieldError(bean: command, field: 'birthDay')}


											</label>


											</td>
										</tr>



										<tr class="prop  ">
											<td valign="top" class="name"><label for="${name}">
													${message(code: labelCode, default: labelCodeDefault)}
											</label></td>
											<td valign="top"
												class="value ${hasErrors(bean: command, field: 'country', 'errors')}">

												<g:select name="country" from="${countries}" optionKey="id"
													optionValue="name"
													class="  emailField form-control secondDiv" id="country"
													onchange="countyChanged(this.value);"
													value="${command?.country}"
													noSelection="['':'-Choose your country-']" /> ${fieldError(bean: command, field: 'country')}

											</td>
										</tr>


										<tr class="prop ">
											<td valign="top" class="name"><label for="${name}">
													${message(code: labelCode, default: labelCodeDefault)}
											</label></td>
											<td valign="top"
												class="value ${hasErrors(bean: command, field: 'city', 'errors')}">

												<g:select name="city" from="${}" optionKey="id"
													optionValue="name"
													class="  emailField form-control secondDiv"
													value="${command?.city}"
													noSelection="['':'-Choose your city-']" /> ${fieldError(bean: command, field: 'city')}

											</td>
										</tr>


										<tr class="prop ">
											<td valign="top" class="name"><label for="${name}">
													${message(code: labelCode, default: labelCodeDefault)}
											</label></td>
											<td valign="top"
												class="value ${hasErrors(bean: command, field: 'gender', 'errors')}">
												<g:select name="gender" from="${['Man','Woman']}"
													value="${command.gender}" class="emailField form-control " />
											</td>
										</tr>
									</tbody>
									<%--			_________________________________________________________shop data _____________________________________________--%>

									<tbody class="thirdDiv">
										<tr class="prop">
											<td valign="top" class="name"><label for="${name}">
													${message(code: labelCode, default: labelCodeDefault)}
											</label></td>
											<td valign="top"
												class="value ${hasErrors(bean: command, field: 'domainName', 'errors')}">

												<form class="">
													<g:textField name="domainName" placeholder='Domain name'
														class=" thirdDiv form-control domainField" />
													<g:select name="tld" from="${['com','org','net']}"
														class="thirdDiv tldField  form-control" />

													<g:actionSubmit value="Search"
														class="btn domainSearch thirdDiv" />

												</form>
											</td>
										</tr>

										<tr class="prop">
											<td valign="top" class="name"><label for="${name}">
													${message(code: labelCode, default: labelCodeDefault)}
											</label></td>
											<td valign="top"
												class="value ${hasErrors(bean: command, field: 'address', 'errors')}">
												<g:textField name='address' labelCode='user.email.label'
													class="emailField form-control " placeholder='Address' />

											</td>
										</tr>

										<tr class="prop">
											<td valign="top" class="name"><label for="${name}">
													${message(code: labelCode, default: labelCodeDefault)}
											</label></td>
											<td valign="top"
												class="value ${hasErrors(bean: command, field: 'phoneNumber', 'errors')}">
												<g:textField name='phoneNumber' labelCode='user.email.label'
													class="emailField form-control " placeholder='Phone Number' />

											</td>
										</tr>

										<tr class="prop">
											<td valign="top" class="name"><label for="${name}">
													${message(code: labelCode, default: labelCodeDefault)}
											</label></td>
											<td valign="top"
												class="value ${hasErrors(bean: command, field: 'myFile', 'errors')}">

												<label class="custom-file-upload "> Upload your logo
													<g:field type="file" name="myFile"
														accept=".jpg, .jpeg , .png" />
											</label>

											</td>
										</tr>


										<tr class="prop ">
											<td valign="top" class="name"><label for="${name}">
													${message(code: labelCode, default: labelCodeDefault)}
											</label></td>
											<td valign="top"
												class="value ${hasErrors(bean: command, field: 'category', 'errors')}">

												<g:select name="myCategory" from="${categories}"
													optionKey="id" optionValue="label"
													class="  emailField form-control"
													noSelection="['':'-Choose your shop  category-']" />


											</td>
										</tr>

										<tr class="prop">
											<td valign="top" class="name"><label for="${name}">
													${message(code: labelCode, default: labelCodeDefault)}
											</label></td>
											<td valign="top"
												class="value ${hasErrors(bean: command, field: 'desc', 'errors')}">
												<g:textArea name='desc' labelCode='user.email.label'
													class="emailField form-control " rows="3" cols="40"
													maxlength="100" placeholder='Description' />

											</td>
										</tr>

									</tbody>
									<%--					__________________________________payment__________________________				--%>
									<tbody class="fourthDiv">
										<tr>
											<td valign="top" class="name"><label for="${name}">
													${message(code: labelCode, default: labelCodeDefault)}
											</label></td>
											<td valign="top">
												<%----%> <%----%> <%--<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top">--%>
												<%--<input type="hidden" name="cmd" value="_s-xclick">--%> <%--<input type="hidden" name="hosted_button_id" value="GSWBTFUSQG466">--%>
												<%--<input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/btn_subscribeCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">--%>
												<%--<img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">--%>
												<%--</form>--%> 
												
												
												<g:link controller="payment" action="pay" data-paypal-button="true">


													<img
														src="//www.paypalobjects.com/en_US/i/btn/btn_xpressCheckout.gif"
														alt="Check out with PayPal" />

												</g:link>

											</td>
										</tr>

									</tbody>

								</table>
								<%--                   _________________________buttons__________________________           --%>
								<g:link controller="login" action="auth" style="margin-left:2%;"
									class="login ">I have account</g:link>

								<button id="firstDivButton" type="button"
									class=" firstDiv navigationButton">Next</button>

								<button id="preview2" type="button"
									class="navigationButton secondDiv">Preview</button>

								<button id="secondDivButton" type="button"
									class="navigationButton secondDiv">Next</button>

								<button id="preview3" type="button"
									class="navigationButton thirdDiv">Preview</button>

								<button id="thirdDivButton" type="button"
									class="navigationButton thirdDiv">Next</button>


								<button id="preview4" type="button"
									class="navigationButton fourthDiv">Preview</button>

								<s2ui:submitButton elementId='create' form='registerForm'
									class="logInButton submit"
									messageCode='spring.security.ui.register.submit' />



							</g:else>

						</div>
					</g:form>
				</div>
			</div>
		</div>
	</div>

	<script>
$(document).ready(function() {
	$('#username').focus();
	
	$( "#firstDivButton" ).click(function() {
		$('.secondDiv').css('display', 'table-row-group');
		
		$('.firstDiv,.login,.thirdDiv,.fourthDiv,.submit').css('display', 'none');
	});
	
	$( "#preview2" ).click(function() {
			$('.firstDiv').css('display', 'table-row-group');
			$(".login").css('display', 'inline');
			$('.secondDiv,.thirdDiv,.fourthDiv,.submit').css('display', 'none'); 		
		});
		
	$( "#secondDivButton" ).click(function() {
		$('.thirdDiv').css('display', 'table-row-group');
		
		$('.firstDiv,.login,.secondDiv,.fourthDiv,.submit').css('display', 'none');
		
		});
	$( "#preview3" ).click(function() {
		$('.secondDiv').css('display', 'table-row-group');
	
		$('.firstDiv,.login,.thirdDiv,.fourthDiv,.submit').css('display', 'none'); 		
	});
	$( "#thirdDivButton" ).click(function() {
		$('.fourthDiv').css('display', 'table-row-group');
		$('.submit').css('display', 'inline');
		$('.firstDiv,.login,.secondDiv,.thirdDiv').css('display', 'none');
		
		});	
	$( "#preview4" ).click(function() {
		$('.thirdDiv').css('display', 'table-row-group');
		$('.firstDiv,.login,.secondDiv,.fourthDiv,.submit').css('display', 'none'); 		
	});
});
function countyChanged(countryId) {


    <g:remoteFunction  action="cities"
        update="city"
        params="'countryId='+countryId"/>

    <g:remoteFunction  action="getTld"
	        update="tld"
	        params="'countryId='+countryId"/>
}


</script>

</body>
</html>
