<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="profilLayout" />

</head>
<body>

	<%--      _____________________________add post Modal__________________________________--%>
	<div class="modal fade" id="inviteModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">

		<div class="modal-dialog  modal-sm">
			<g:form controller="post" action="addPost"
				enctype="multipart/form-data">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">x</button>
						<h4 class="modal-title">Add a post</h4>
					</div>
					<div class="modal-body " style="text-align: center;">
						<g:textArea name="postDesc" placeholder="Description" rows="4"
							cols="40" class="emailField form-control " />
						<br>
						<g:textField class="emailField form-control " name="ProductLink"
							placeholder="Link to your product" />
						<br> <label class="custom-file-upload "> Upload Image
							<g:field type="file" name="uploadedFile"
								ccept=".jpg, .jpeg , .png" />
						</label>

					</div>
					<div class="modal-footer">
						<g:submitButton name="savePost" class="btn " value="Save" />

					</div>
				</div>
			</g:form>
		</div>

	</div>




	<%--       ________________________________end modal _______________________________--%>

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
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-8 col-md-offset-3 col-lg-6 col-sm-10 col-xs-11">


					<h1 class="WmebInNumberstitle" style="">
						${user.firstName}
						${user.lastName}
					</h1>
					<p>
						<span class="glyphicon  glyphicon glyphicon-map-marker"
							aria-hidden="true"> ${user.country}, ${user.city}
						</span> <span class="glyphicon glyphicon-envelope" aria-hidden="true"
							style="margin-left: 20px;"> ${user.email}
						</span>

					</p>
					<p>On sait depuis longtemps que travailler avec du texte
						lisible</p>
					<hr />

					<a class="btn shopLink" href='http://www.${user.shop.name}'
						role="button" target="_blank"> Visit my shop</a>
					<button class="btn pull-right " data-target="#inviteModal"
						data-toggle="modal">Add a post</button>
					<button class="btn pull-right ">Send this profile</button>

				</div>
			</div>
		</div>
	</div>

	<div class="profilBody">
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
										
									</div>
								</div>
							</div>

						</div>
					</g:each>
               </g:if>
                <g:else>
               <p class="noPostMsg">No posts exist</p>
                </g:else>
				</div>
			</div>
		</div>
     <g:if test="${displayButton}">
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
	        $(".item_wrap:hidden").slice(0, 4).show();
	        if($(".item_wrap:hidden").length == 0){ 

	            $("#laodMore").html('No more posts');
	        }
	});

	 
		
	
	 
</script>

</body>
</html>