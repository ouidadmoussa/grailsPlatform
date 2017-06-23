<button type="button" class="close" data-dismiss="modal">x</button><br>
<g:if test="${imOwner}">
<g:form >
<button class="close del" type="submit"  onclick='deleteItem(${detailedPost.id});'><span
		 class="glyphicon glyphicon-trash "></span></button> 
</g:form>
</g:if>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-8">
           <g:if test="${detailedPost.media}">
			<g:img dir="uploadedMedia" file="${detailedPost.media }" width="100%"/>
           </g:if>
           <g:else>
           <g:img dir="uploadedMedia" file="pic2.jpg" width="100%"/>   
           </g:else>
		</div>

	
	<div class="col-md-4">
		${detailedPost.description}
		<br>
		 <a class="btn pull-right shopLink" href='http://www.${detailedPost.productLink}'
		 style="border: 1px solid #ebebeb;margin-top: 10px; " 
                  role="button" target="_blank" >More details</a>
	</div>
</div>
</div>

<script>
$( document ).ready(function() {
	$('#detailedModal').modal("show")
	});
	
function deleteItem(postId) {
    if (confirm("Are you sure?")) {
    	 <g:remoteFunction  action="deletePost" controller="post" 
    	        params="'postId='+postId" />
    }
    return false;
}
</script>