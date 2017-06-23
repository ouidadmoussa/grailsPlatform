<g:if test='${users}'>
		<g:each var="user" in="${users}">
			<div class="col-md-2  col-sm-3  col-xs-5 affilie">
				<h4>${user.firstName} ${user.lastName}</h4>
				<g:if test="${user.shop != null}">
   						<a href="#">${user?.shop.name }</a>
					</g:if>
			

                  
				<ul class="soc">
					<li>
					<g:form>
					<g:link class="profil"  action="userProfil"  params='[affiliateId:"${user.id}"]'> <i
							class="glyphicon glyphicon-user"></i>

					</g:link> </g:form></li>

				</ul>


			</div>
		</g:each>
					</g:if>
					<g:else>   <p class="noPostMsg">No affiliates exist</p></g:else>	

	<g:if test='${displayButton}'>
			<div class="col-md-3 col-md-offset-5 col-sm-8 col-sm-offset-3 col-xs-10 col-xs-offset-1">
				<button id="laodMore">laod more</button>
			</div>
			</g:if>
		
		
		
			<script>
$(document).ready(function() {
$('#advancedSearch').on('click', function(e){

    $("#advancedSearchBlock").toggle();
    
});
$(".affilie").slice(0, 10).show(); 
$("#laodMore").click(function(e){ 
    e.preventDefault();
    $(".affilie:hidden").slice(0, 10).show(); 
    if($(".affilie:hidden").length == 0){ 

        $("#laodMore").html('No more data');
    }
});

});
</script>