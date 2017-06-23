
<h2>Affiliates</h2>

<%--    ______________________________________________________invite people modal________________________________________________--%>


<div class="modal fade" id="inviteModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">

	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">x</button>
				<h4 class="modal-title">Invite people</h4>
			</div>
			<div class="modal-body">
			
			    <div class="row">
					<div class="col-sm-12">
                           <div id="fb-root"></div>
						<button class="btn btn-facebook btn-block"
							onclick="FacebookInviteFriends();">
							<i class="fa fa-facebook"></i> Share on facebook
						</button>


					</div>
				</div>
				<br />
				
				<div class="row">
					<div class="col-sm-12">
                           <div id="fb-root"></div>
						<button class="btn btn-facebook btn-block"
							onclick="FacebookInviteFriendsMsg();">
							<i class="fa fa-facebook"></i> send private message Facebook
						</button>


					</div>
				</div>
				<br />
				<div class="row">
					<p style="text-align: center;">Or</p>
					<div class="col-sm-12" style="margin-top: 10px;">
                      <a  class="btn btn-twitter btn-block" target="_blank"
					    href="https://twitter.com/intent/tweet?text=wmeb">
							<i class="fa fa-twitter fa-lg"></i>Share a tweet
						</a>
						
                    
					</div>
				</div>
				<br />
				<div class="row">
					<%--<div class="col-sm-12">
										<oauth:connect provider="google" id="google-connect-link" class="btn btn-google-plus btn-block">
											<i
												class="fa fa-google-plus fa-lg"></i> Google +</oauth:connect>
										</div>
									--%>
				</div>
			</div>
		</div>
	</div>

</div>

<%--		__________________________________________________________end modal__________________________________________________--%>
	<div class="container-fluid" >
		<div class="row">
		<div class="col-md-2">
			<g:select name="filterTable" from="['All','Direct']"
				class="emailField form-control" onchange="filterChanged(this.value);"
				value="${selectValue}"
				style="padding-left: 15px !important;" />
		</div>
		<div class="col-md-2">
			<button class="btn emailField " style="padding-left: 0 !important;" data-target="#inviteModal" data-toggle="modal"
				id="invite">Invite</button>
		</div>

</div></div>



<div class="table-responsive" id="dataTable">
<table class="table table-hover table-condensed" style="margin-top: 15px;">
	<thead style="background-color:#D5D5D5;">
		<g:remoteSortableColumn property="id" title="Code" titleKey="User.id"
			update="data"  />
		<g:remoteSortableColumn property="firstName" title="Full Name"
			update="data" />
		<g:remoteSortableColumn property="email" title="Email" update="data" />
		
		<g:remoteSortableColumn property="createdDate" title="Created Date "
			update="data" />
		<g:remoteSortableColumn property="shop.phoneNumber"
			title="Phone Number " update="data" />
	
		<g:remoteSortableColumn property="shop" title="Shop "
			update="data" />

	</thead>

	<tbody>

		<g:each var="affilie" in="${affiliates}">
			<tr>
				<td>
					${affilie.id }
				</td>
				<td><g:link action="userProfil" style="color:black"
						params='[affiliateId:"${affilie.id}"]' target="_blank">
						${affilie.firstName}
						${affilie.lastName }
					</g:link></td>
				<td>
					${affilie.email }
				</td>
				<td><g:formatDate format="yyyy-MM-dd"
						date="${affilie.createdDate }" /></td>
				<td>
					${affilie.shop.phoneNumber }
				</td>

				<td><a class="btn shopLink"
					href='http://www.${affilie.shop.name }' role="button"
					target="_blank"> ${affilie.shop.name }</a></td>
			</tr>
		</g:each>
	
	</tbody>

      <tfoot>
     <tr><td  colspan="0" style="text-align: center;">	
       <g:remotePaginate  class="pagination" update="data" next="Forward" prev="Back" total="${affiliatesCount}"/>
     </td></tr>
	  
	</tfoot>

</table>
   </div>
   
   	

	
   	<script src="http://connect.facebook.net/en_US/all.js"></script>
  <script>
  function filterChanged(filter) {
         
       if(filter=="Direct"){
    	   <g:remoteFunction  action="directAffiliates"
		        update="data"/>
       }
       else{
    	   <g:remoteFunction  action="myAffiliates"
   	        update="data"  />
	}
  }



  window.fbAsyncInit = function() {
    FB.init({
      appId      : '853464358072616',
      xfbml      : true,
      version    : 'v2.4'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));


	function FacebookInviteFriendsMsg() {
		FB.ui({
			method : 'send',
			link : 'http://itlanes.com/en/index.php',
		});
	}
	function FacebookInviteFriends() {
		FB
				.ui({
					method : 'apprequests',
					message : 'Je vous invite à participer à la grande competition de developpement VINCInnova'
				});
	}

  </script> 
