
		<h2 style="clear:both; ">Personal Informations 
		<button class="editButton" id="editPersonalInfosButton"><span
		 class="glyphicon glyphicon-pencil"></span></button> 
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
						<td>
						<g:formatDate format="yyyy-MM-dd" date="${user.birthDay}"/>
							
						</td>
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
										years="${Calendar.instance.get(Calendar.YEAR)..1910}" />
								</td>
							</tr>
							<tr>
								<td>Gender</td>
								<td><g:select name="gender" from="${['Man','Woman']}"
										value="${user.gender}" /></td>
							</tr>
							<tr>
								<td>Location</td>
								<td><g:select name='country' from="${countries}"
								        optionKey="id"  value="${userCountry.id }"
										onchange="countyChanged(this.value);" 
										
										noSelection="['':'-Choose your country-']" /> 
										<g:select optionKey="id"
										optionValue="name" value="${userCity.id }"									 
										name='city' from="${cities}"  />

								</td>
							</tr>
                          <tr>
                          <td></td> 
                          <td><button   type="button" id="editionCancel">Cancel</button> 
                          <g:submitToRemote id="editionSave" value="save" action="updateUser" 
                          update="data"/>
                          </td>
                          </tr>
						</tbody>
					</table>
				</g:form>
				
					<h2 >My shop <button id="editShopButton" class="editButton"><span
		 class="glyphicon glyphicon-pencil"></span></button> </h2>
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
					<tbody id="editShop"  style="display: none">
					<tr>
						<td>Domain Name</td>
						<td>
							${user.shop.name }
						</td>
					</tr>
					<tr>
						<td>Category</td>
						<td>
						    <g:select name="category" from="${categories}" 
						    optionValue="label" optionKey="id"
						    value="${shopCategory.id }"/>
							
						</td>
					</tr>
					<tr>
						<td>Description</td>
						<td>
							<g:textField name="desc" value="${user.shop.description}"/>
		
						</td>
					</tr>
					<tr>
						<td>Address</td>
						<td>
						  <g:textField name="address" value="${user.shop.Address }"/>
							
						</td>
					</tr>
					<tr>
						<td>Phone Number</td>
						<td>
						<g:textField name="phoneNumber" value="${user.shop.phoneNumber }"/>
							
						</td>
					</tr>
					<tr>
                          <td></td> 
                          <td><button   type="button" id="editionCancel_shop">Cancel</button> 
                          <g:submitToRemote id="editionSave_shop" value="save" action="updateShop" 
                          update="data"/>
                          </td>
                          </tr>
					</tbody>
				</table>
				</g:form>

	<script type="text/javascript">
		
		function countyChanged(countryId) {


		    <g:remoteFunction  action="cities"
		        update="city"
		        params="'countryId='+countryId"/>
		}
		 $(document).ready(function() {
			 $("#editPersonalInfosButton").click(function() {
			 	$("#showPersonalInfos").hide()	;
			 	$("#editPersonalInfos").show();
			 	 <g:remoteFunction  action="countries"
				        update="country"/>
			 });

			 $("#editionCancel").click(function() {
			 	$("#showPersonalInfos").show()	;
			 	$("#editPersonalInfos").hide();
			 });

			 $("#editionSave").click(function() {
			 	$("#showPersonalInfos").show()	;
			 	$("#editPersonalInfos").hide();
			 });

			 });

		 $("#editShopButton").click(function() {
		 	$("#showShop").hide()	;
		 	$("#editShop").show();
		 });

		 $("#editionCancel_shop").click(function() {
		 	$("#showShop").show();
		 	$("#editShop").hide();
		 });

		 $("#editionSave_shop").click(function() {
		 	$("#showShop").show();
		 	$("#editShop").hide();
		 });
	</script>