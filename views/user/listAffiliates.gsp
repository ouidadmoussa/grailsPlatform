<html>

<head>
<meta name='layout' content='main' />
<title>Affiliates</title>
</head>

<body>

	<div class="container searcheBlock " style="margin-top: 40px;">
		<div class="row">
			<div
				class="col-md-4 col-md-offset-3 col-sm-5 col-sm-offset-3 col-xs-9 col-xs-offset-0 ">
				<g:form>
					<div class="input-group">
						<g:textField name="affiliateNumero" class="form-control"
							placeholder="affiliate Code " />
						<span class="input-group-btn"> <g:actionSubmitImage
								class="btn btn-default"
								src="${resource(dir: 'images', file: 'search_2.png')}" with="40"
								height="34" id="del-check" value=" " action="searcheByCode" />
						</span>

					</div>
				</g:form>
			</div>
			<div class="col-md-2 col-sm-2  col-xs-3 ">

				<button id="advancedSearch" class="advancedSearch" type="button">Show
					me a list</button>
			</div>

		</div>
	</div>
	<%--	----------------------------------advnced search block----------------------------------%>
	<div id="advancedSearchBlock" class="container advancedSearchBlock">
		<div class="row">
			<div
				class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">


				<div class="advanced_searche">
					<g:form>
						<div class="container-fluid">


							<h3 style="float: left;">please select Area</h3>
							<g:select name="country" from="${countries}" optionKey="id"
								class=" col-md-6 col-xs-10  countrySelect form-control oneLine"
								optionValue="name" onchange="countyChanged(this.value);"
								noSelection="['':'-Choose your country']" />


							<g:select from="${}"
								class=" col-md-6 col-xs-10  countrySelect form-control  full-right"
								name="state" id="state" noSelection="['':'-Choose your city-']"></g:select>

						</div>


						<g:submitToRemote name="valider" value="Submit"
							class="btn  advanced_searche_Button" url="[action: 'findAffiliates']"
							update="data" />
						<button id="cancelButton" 	class="btn pull-right  "
						  role="button">Cancel</button>	
					</g:form>
				</div>
			</div>
		</div>
	</div>

	<%--   -------------------------------affiliates----------------------------------------------------%>
	<div class="container-fluid affilies" id="data">
		<g:if test='${msg}'>
			<div class="container row">
				<div
					class="col-md-5 col-md-offset-4 col-sm-8 col-sm-offset-3 col-xs-10 col-xs-offset-1">
					<div class="alert alert-danger alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						${msg}
					</div>
				</div>
			</div>
		</g:if>
		<g:if test='${users}'>
			<g:each var="user" in="${users}">
				<div class="col-md-2  col-sm-3  col-xs-5 affilie">
					<h4>
						${user.firstName}
						${user.lastName}
					</h4>
					<g:if test="${user.shop != null}">
						<a href="#">
							${user?.shop.name }
						</a>
					</g:if>



					<ul class="soc">
						<li><g:form>
								<g:link class="profil" action="userProfil"
									params='[affiliateId:"${user.id}"]'>
									<i class="glyphicon glyphicon-user"></i>

								</g:link>
							</g:form></li>

					</ul>


				</div>
			</g:each>
		</g:if>
		<g:else>
			<p class="noPostMsg">No affiliates exist</p>
		</g:else>

		<g:if test='${displayButton}'>
			<div
				class="col-md-3 col-md-offset-5 col-sm-8 col-sm-offset-3 col-xs-10 col-xs-offset-1">
				<button id="laodMore">laod more</button>
			</div>
		</g:if>
	</div>




	<script>
		$(document).ready(function() {

			$('.searcheBlock').click(function(e) {

				e.preventDefault();

				$('#advancedSearchBlock').css('display', 'block')

			});

			$('#cancelButton').click(function(e) {

				e.preventDefault();
				$('#advancedSearchBlock').css('display', 'none')

			});

			if ($(".affilie").length == 0) { // check if any hidden divs still exist

				$("#laodMore").html('No  affiliates exist');
			}
			$(".affilie").slice(0, 10).show();
			$("#laodMore").click(function(e) {
				e.preventDefault();
				$(".affilie:hidden").slice(0, 10).show();
				if ($(".affilie:hidden").length == 0) {

					$("#laodMore").html('No more data');
				}
			});

		});

		function countyChanged(countryId) {
			<g:remoteFunction  action="cities"
        update="state"
        params="'countryId='+countryId"/>
		}
	</script>

</body>
</html>
