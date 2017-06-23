<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="profilLayout" />
</head>
<body>
	<%--                 ______________________ Detailed Post Modal_______________________________--%>

	<div class="modal fade" id="detailedModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">

		<div class="modal-dialog" style="width: 85%;">

			<div class="modal-content">
				<div class="modal-body " id="postModal" style="text-align: center;">

				</div>
			</div>

		</div>

	</div>



	

	<%--                 __________________________end Modal_______________________--%>
	<div class="ProfilHead">
		<div class="container-fluid" >
			<div class="row" >
				<div class="col-md-8 col-md-offset-3 col-lg-6 col-sm-10 col-xs-11">
					
					
					<h1 class="WmebInNumberstitle" style="">
						${affiliate.firstName}
						${affiliate.lastName}
					</h1>
					<p>
						<span class="glyphicon  glyphicon glyphicon-map-marker"
							aria-hidden="true"> ${affiliate.country}, ${affiliate.city}
						</span> <span class="glyphicon glyphicon-envelope" aria-hidden="true"
							style="margin-left: 20px;"> ${affiliate.email}
						</span>

					</p>
					<p>${affiliate.shop.description}</p>
                  <hr/>
             
                  <a class="btn shopLink" href="#" role="button" > Visit my shop</a>
                  <button class="btn pull-right "> Contact</button>
                  <button class="btn pull-right "> Send this profile</button>
                  
				</div>
			</div>
		</div>
	</div>

	<div class="profilBody" style="min-height: 300px;">
		<div class="container-fluid">
			<div class="row">
				<div class="container-fluid">
				<g:if test="${posts}">
					<g:each var="post" in="${posts}">
						<div class="col-md-3  col-sm-3  col-xs-12 ">
							<div class="item_wrap" style="border: 10px solid #fff;">
									<div class="item_pic  third-effect"
									onclick="${remoteFunction(action:'detailedPost',id:post.id,
					                 controller:'post' ,update:'postModal')}">

									<g:if test="${post.media}">
										<g:img dir="uploadedMedia" file="${post.media}"
											class="img-responsive" />
									</g:if>
									<g:else>
										<g:img dir="uploadedMedia" file="pic2.jpg" width="100%" />

									</g:else>

									<div class="mask">
							<g:submitToRemote url="[action: 'detailedPost',  controller:'post']" id="${post.id}"
										 value="Voir" class="voirButton" />
									</div>
								</div>
							</div>

						</div>
					</g:each>
                  </g:if>
                <g:else>
               <p class="noPostMsg">No post exist</p>
                </g:else>
				</div>
			</div>
		</div>
     <g:if test="${posts}">
		<div class="container">
			<div class="row">
				<div
					class="col-md-3 col-md-offset-5 col-sm-2 col-sm-offset-3 col-xs-5 col-xs-offset-1">
					<button id="laodMore"
						style="width: 100%; height: 35px; margin-bottom: 20px; border: none;">laod
						more</button>
				</div>
			</div>
		</div>
		</g:if>
</div>
		<script>
	$(".item_wrap").slice(0, 4).show();

	  $("#laodMore").click(function(e){ 
	        e.preventDefault();
	        $(".item_wrap:hidden").slice(0, 4).show(); // select next 10 hidden divs and show them
	        if($(".item_wrap:hidden").length == 0){ // check if any hidden divs still exist

	            $("#laodMore").html('No more products');
	        }
	});
</script>

</body>
</html>