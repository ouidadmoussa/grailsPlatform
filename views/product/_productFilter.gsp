     
             <p class="pull-left visible-xs">
<button class="btn " data-toggle="offcanvas" type="button">Categories</button>
</p>
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
               	 <g:each var="product" in="${ products }">
					<div class="col-md-3  col-sm-3  col-xs-12 "  >
					<div class="item_wrap" style="border:10px solid #fff;" >
					   
					     <div class="item_pic  third-effect">
					   
					     <g:img dir="allFiles/${product.shop.name}/product" file="${product.picture }"  class="img-responsive"
					     absolute='true'/>
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

	    $('[data-toggle="offcanvas"]').click(function () {
		    $('.row-offcanvas').toggleClass('active')
		  });
	});
	</script>