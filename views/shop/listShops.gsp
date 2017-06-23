<html>

<head>
<meta name='layout' content='main' />
<title>List Shops</title>
<style type="text/css"></style>

</head>

<body>

<div class="container"  style="margin-top: 40px;">
      <div class="row">
	<div class="col-md-5 col-md-offset-4 col-sm-5 col-sm-offset-3 col-xs-10 col-xs-offset-1">
				
		
          <g:form>
				<div class="input-group">
					<g:textField name="shopName" class="form-control"  placeholder="Search Shop "/>
					<span class="input-group-btn">
					
							<g:actionSubmitImage 	class="btn btn-default"
							src="${resource(dir: 'images', file: 'search_2.png')}"
								with="40" height="34"   value=" "
							action="listShops"  />
					</span>

				</div>
				</g:form>        
	</div>
	</div></div>

	<div class="container-fluid"  >
		<!--  -------------------------categorie-------------------------- -->
	
	
        <div class="row row-offcanvas row-offcanvas-left" >
		<g:form action="show">
			<div class="col-md-2  col-sm-3">
    
				<div class="title sidebar-offcanvas" style="top:24px;">
					<i class="glyphicon glyphicon-align-justify " aria-hidden="true"></i>
					Catégories
				</div>

				
				<div id="sidebar" class=" sidebar-offcanvas">
					<ul class="nav">
					     
						<li><g:remoteLink class="itemLink" action="show"
								update="data" id=''>
										All
									</g:remoteLink></li>
						<g:each var="category" in="${ categories }">
							<g:if test="${category.isParent}">
								<li><g:remoteLink class="itemLink" action="show"
										update="data" id='${category.id}'>
										${category.label }
										<span class="glyphicon glyphicon-chevron-right"> </span>
									</g:remoteLink> <g:if test="${category.subCategories}">
										<ul class="subCategorie list-unstyled submenu">
											<g:each var="suubCategory" in="${category.subCategories}">
												<li class="subCategorie_item itemLink"
													onclick="loadData(${suubCategory.id})">
													${suubCategory.label }
												
											</g:each>
										</ul>
									</g:if></li>
							</g:if>
						</g:each>
					</ul>
				</div>
			</div>
		</g:form>

			<%--		__________________________________________end category__________________________________--%>

			<div class="col-md-10 col-xs-12 col-sm-9" style="margin-top: 20px;" id="data" >
    <div class="container-fluid">
            <div class="row">
             <p class="pull-left visible-xs">
           <button class="btn " data-toggle="offcanvas" type="button">Categories</button>
          </p>
          </div></div>

                <div id="wait" ><g:img folder='imges' file='loading.gif'/></div>
				<div class="container-fluid" >
			 
			 <g:if test='${msg}'>
	
           <div class="col-md-5 col-md-offset-5 col-sm-8 col-sm-offset-3 col-xs-10 col-xs-offset-1">
			<div class="alert alert-dismissible" role="alert" >
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				${msg}
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
			</div>
	</div>
			</div>
			
	<script>
	$(document).ready(function(){
	    $(".categorie_item ").mouseover(function(){
	        $(".submenu").css("display", "block");
	    });
	    $(".categorie_item").mouseout(function(){
	    	 $(".submenu").css("display", "none");
	    });

	    if($(".item_wrap").length == 0){ // check if any hidden divs still exist

            $("#laodMore").html('No  shops exist');
        }
	    $(".item_wrap").slice(0, 8).show(); 
	    $("#laodMore").click(function(e){ 
	        e.preventDefault();
	        $(".item_wrap:hidden").slice(0, 8).show(); // select next 10 hidden divs and show them
	        if($(".item_wrap:hidden").length == 0){ // check if any hidden divs still exist

	            $("#laodMore").html('No more shops');
	        }
	});

	    $(document).ajaxStart(function(){
	        $("#wait").css("display", "block");
	    });
	    $(document).ajaxComplete(function(){
	        $("#wait").css("display", "none");
	    });
	    $(window).load(function() {
	    	$("#wait").fadeOut("slow");
	    })
	});
	</script>
</body>
</html>