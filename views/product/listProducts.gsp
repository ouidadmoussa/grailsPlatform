<html>

<head>
	<meta name='layout' content='main'/>
	<title>Products</title>

</head>

<body >

<div class="container"  style="margin-top: 40px;" >
      <div class="row">
	<div class="col-md-5 col-md-offset-4 col-sm-5 col-sm-offset-3 col-xs-10 col-xs-offset-1">
		    <g:form>
				<div class="input-group">
					<g:textField name="productName" class="form-control"  placeholder="Search Product "/>
					<span class="input-group-btn">
					
							<g:actionSubmitImage 	class="btn btn-default"
							src="${resource(dir: 'images', file: 'search_2.png')}"
								with="40" height="34"   value=" "
							action="listProducts"  />
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

		<!-- 	                  --------------------------Products----------------------------------------------- -->

		<div class="col-md-10 col-xs-12 col-sm-9" style=" margin-top: 20px;" id="data">
           <div class="container-fluid">
            <div class="row">
             <p class="pull-left visible-xs">
           <button class="btn " data-toggle="offcanvas" type="button">Categories</button>
          </p>
          </div></div>
                 <div id="wait" ><g:img folder='imges' file='loading.gif'/></div>
			<div class="container-fluid">
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
				<g:if test='${products}'>
				
               	 <g:each var="product" in="${products}">
               
					<div class="col-md-3  col-sm-3  col-xs-6 "  >
					<div class="item_wrap" style="border:10px solid #fff;" >
					   
					     <div class="item_pic  third-effect">

							 <g:img dir='allFiles/${product.shop.name}/product' file='${product.picture }'
									class="img-responsive" absolute='true'/>
					       <div class="mask">
				              <g:submitButton name="p" value="Voir" class="voirButton"/>
		                   </div>
					     </div>
					    <p class="item_title">${product.name} </p>
					    <div class="onLine">
					    <p style="color:#e84d1c; float: left;">${product.price} dh</p>
					    <g:submitButton name="commander" value="Commander" class="Commander"/> 
					    
					    </div>
					</div>

				</div>
<%--				</div></div>--%>
				</g:each>
					</g:if>
					<g:else>   <p class="noPostMsg">No products exist</p></g:else>		
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

	<!--------fin -->
	<script>
	$(document).ready(function(){
	
	    
	    $(".item_wrap").slice(0, 8).show(); 
	    $("#laodMore").click(function(e){ 
	        e.preventDefault();
	        $(".item_wrap:hidden").slice(0, 4).show(); 
	        if($(".item_wrap:hidden").length == 0){ 

	            $("#laodMore").html('No more products');
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

	    $('[data-toggle="offcanvas"]').click(function () {
		    $('.row-offcanvas').toggleClass('active')
		  });
	});
	function loadData(categoryId) {
	    <g:remoteFunction 
	        	action="show" update="data"
	        params="'id='+categoryId"/>
	}
	
	</script>

</body>
</html>