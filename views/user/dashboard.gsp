<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="profilLayout" />

</head>
<body>

	<%--    ______________________________________________________modal________________________________________________--%>
		<g:if test="${user.shop == null}">

		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Enjoy your business</h4>
					</div>
					<div class="modal-body">
						<p>please register you domain name and create your online shop
							&hellip;</p>
					</div>
					<div class="modal-footer">
						<g:link role="button" class=" btn btn-default shopLink"
							controller="shop" action="createShop">Create</g:link>

					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
	</g:if>
	<%-- _______________________________________________________end modal___________________________________________________--%>

	<div class="container-fluid" style="min-height: 600px; height: 100%;">
		<div class="row" style="height: 100%;">
			<div class="col-md-3"
				style="background-color: #f9f9f9; padding: 0; height: 100vh;"
				class="categorie onLine">


				<ul id="verticalMenu" class="nav"
					style="float: right; margin: 0; background-color: #ebebeb; height: 100%; width: 80%">

					<li style="height: 50px;"><g:remoteLink class="myTab"
							action="generalData" update="data">
					General
						
						</g:remoteLink></li>


					<li style="height: 50px;"><g:remoteLink class="myTab"
							action="formation" update="data">
					My Formation 
						
						</g:remoteLink></li>

					<li style="height: 50px;"><g:remoteLink class="myTab"
							action="myAffiliates" update="data">
					My Affiliates 
					
						</g:remoteLink></li>

					<li style="height: 50px;"><g:remoteLink class="myTab"
							action="paiment" update="data">
					Paiment 
						</g:remoteLink></li>

					<%--					<li style="height: 50px;"><g:remoteLink class="myTab" action="statistic" update="data" >--%>
					<%--					Statistics <span class="glyphicon glyphicon-chevron-right">						--%>
					<%--						</span>--%>
					<%--					</g:remoteLink></li>--%>

					<li style="height: 50px;"><a href="#" class="myTab">webmail
						
					</a></li>

				</ul>




			</div>
			<div class="col-md-9" id="data">




				<h2 style="clear: both;">
					Personal Informations
					<button class="editButton" id="editPersonalInfosButton">
						<span class="glyphicon glyphicon-pencil"></span>
					</button>
				</h2>
				<g:form>
					<table class="table table-hover">
						<tbody id="showPersonalInfos">
							<tr>
								<td>Username</td>
								<td>
									${user.username }
								</td>
							</tr>
							<tr>
								<td>First and last name</td>
								<td>
									${user.firstName} ${user.lastName }
								</td>
							</tr>
							<tr>
								<td>Email</td>
								<td>
									${user.email }
								</td>
							</tr>
							<tr>
								<td>Birthday</td>
								<td><g:formatDate format="yyyy-MM-dd"
										date="${user.birthDay}" /></td>
							</tr>
							<tr>
								<td>Gender</td>
								<td>
									${user.gender}
								</td>
							</tr>
							<tr>
								<td>Location</td>
								<td>
									${user.city}, ${user.country }
								</td>
							</tr>
							<tr>
								<td>Code</td>
								<td>
									${user.code}
								</td>
							</tr>
							<tr>
								<td>Link</td>
								<td>
									${user.link}
								</td>
							</tr>
						</tbody>
						<tbody id='editPersonalInfos' style="display: none">
							<tr>
								<td>Username</td>
								<td><g:textField name="username" value="${user.username }" />
								</td>
							</tr>
							<tr>
								<td>First and last name</td>
								<td><g:textField name="firstName" value="${user.firstName}" />
									<g:textField name="lastName" value=" ${user.lastName }" /></td>
							</tr>
							<tr>
								<td>Email</td>
								<td><g:textField name="email" value="${user.email }" /></td>
							</tr>
							<tr>
								<td>Birthday</td>
								<td><g:datePicker name="birthDay" value="${user.birthDay}"
										precision="day"
										years="${Calendar.instance.get(Calendar.YEAR)..1910}" /></td>
							</tr>
							<tr>
								<td>Gender</td>
								<td><g:select name="gender" from="${['Man','Woman']}"
										value="${user.gender}" /></td>
							</tr>
							<tr>
								<td>Location</td>
								<td><g:select name='country' from="${countries}"
										optionKey="id" value="${userCountry.id }"
										onchange="countyChanged(this.value);"
										noSelection="['':'-Choose your country-']" /> <g:select
										optionKey="id" optionValue="name" value="${userCity.id }"
										name='city' from="${cities}" /></td>
							</tr>
							</tr>
							<tr>
								<td>Code</td>
								<td>
									${user.code}
								</td>
							</tr>
							<tr>
								<td>Link</td>
								<td>
									${user.link}
								</td>
							</tr>
							<tr>

								<td></td>
								<td><button type="button" id="editionCancel">Cancel</button>
									<g:submitToRemote id="editionSave" value="save"
										action="updateUser" update="data" /></td>
							</tr>
						</tbody>
					</table>
				</g:form>


				<h2>
					My shop
					<button id="editShopButton" class="editButton">
						<span class="glyphicon glyphicon-pencil"></span>
					</button>
				</h2>
				<g:form>
					<table class="table table-hover">
						<tbody id="showShop">
							<tr>
								<td>Domain Name</td>
								<td>
									${user.shop.name }
								</td>
							</tr>
							<tr>
								<td>Category</td>
								<td>
									${user.shop.category.label }
								</td>
							</tr>
							<tr>
								<td>Description</td>
								<td>
									${user.shop.description}
								</td>
							</tr>
							<tr>
								<td>Address</td>
								<td>
									${user.shop.Address }
								</td>
							</tr>
							<tr>
								<td>Phone Number</td>
								<td>
									${user.shop.phoneNumber }
								</td>
							</tr>
						</tbody>
						<tbody id="editShop" style="display: none">
							<tr>
								<td>Domain Name</td>
								<td>
									${user.shop.name }
								</td>
							</tr>
							<tr>
								<td>Category</td>
								<td><g:select name="category" from="${categories}"
										optionValue="label" optionKey="id" value="${shopCategory.id }" />

								</td>
							</tr>
							<tr>
								<td>Description</td>
								<td><g:textField name="desc"
										value="${user.shop.description}" /></td>
							</tr>
							<tr>
								<td>Address</td>
								<td><g:textField name="address"
										value="${user.shop.Address }" /></td>
							</tr>
							<tr>
								<td>Phone Number</td>
								<td><g:textField name="phoneNumber"
										value="${user.shop.phoneNumber }" /></td>
							</tr>
							<tr>
								<td></td>
								<td><button type="button" id="editionCancel_shop">Cancel</button>
									<g:submitToRemote id="editionSave_shop" value="save"
										action="updateShop" update="data" /></td>
							</tr>
						</tbody>
					</table>
				</g:form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function countyChanged(countryId) {

			<g:remoteFunction  action="cities"
		        update="city"
		        params="'countryId='+countryId"/>
		}}
	</script>
</body>
</html>