   <p class="pull-left visible-xs">
				<button class="btn " data-toggle="offcanvas" type="button">Categories</button>
			</p>
   <div id="wait" ><g:img folder='imges' file='loading.gif'/></div>
				<div class="container-fluid" >
			 
			 <g:if test='${msg}'>
		<div class="container row">
           <div class="col-md-5 col-md-offset-4 col-sm-8 col-sm-offset-3 col-xs-10 col-xs-offset-1">
			<div class="alert alert-danger alert-dismissible" role="alert" >
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				${msg}
			</div>
          </div>
</div>
		</g:if>
		<g:if test='${shops}'>
					<g:each var="shop" in="${shops}"   >


						<div class="col-md-3  col-sm-3  col-xs-10 ">
							<div class="item_wrap ">
								<div class="ecommerce_item item_pic third-effect">

					<g:img  	dir='allFiles/${shop.name}' file='${shop.logo}'  absolute='true'
				height="200px" width="100%" />
									<div class="mask" style="border-color: fuchsia;">
										<h4 class="boutique_name">
											${shop.name}
										</h4>
										<a href="#" class="boutique_link"> <i
											class="icon_link glyphicon glyphicon-link"></i>
										</a>

										<div class="boutique_description ">
											${shop.description }
										</div>

									</div>
								</div>
							</div>
						</div>
					</g:each>
					</g:if>
					<g:else>   <p class="noPostMsg">No shops exist</p></g:else>		
	</div>
	
	 
	  	<g:if test='${displayButton}'>
		
				<div
					class="col-md-3 col-md-offset-5 col-sm-8 col-sm-offset-3 col-xs-10 col-xs-offset-1">
					<button id="laodMore">laod more</button>
				</div>
		
	</g:if>

<script>
	$(document).ready(function(){
	    $(".categorie_item ").mouseover(function(){
	        $(".submenu").css("display", "block");
	    });
	    $(".categorie_item").mouseout(function(){
	    	 $(".submenu").css("display", "none");
	    });


	    $(".item_wrap").slice(0, 8).show(); 
	    $("#laodMore").click(function(e){ 
	        e.preventDefault();
	        $(".item_wrap:hidden").slice(0, 4).show(); // select next 10 hidden divs and show them
	        if($(".item_wrap:hidden").length == 0){ // check if any hidden divs still exist

	            $("#laodMore").html('No more shops');
	        }
	});

	    $('[data-toggle="offcanvas"]').click(function () {
		    $('.row-offcanvas').toggleClass('active')
		  });
	});
	</script>