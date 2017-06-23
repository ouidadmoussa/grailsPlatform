<html>

<head>
<meta name='layout' content='adminLayout' />
<title>Admins management</title>

</head>
<body>

	<%-- _____________________________add post Modal__________________________________--%>
	<div class="modal fade" id="add_AdminModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">

		<div class="modal-dialog  modal-sm">
			<g:form >
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">x</button>
						<h4 class="modal-title">Add an admin</h4>
					</div>
					<div class="modal-body " style="text-align: center;">
						<g:textField class="emailField form-control " name="userInfos"
							placeholder="Search user by username or email" />


					</div>


					<div class="modal-footer">

						<g:actionSubmit class=" btn" name="addAdmin" controller="Admin" 
						action="addAdmin" value="Save" />
					</div>



				</div>
			</g:form>
		</div>

	</div>



	<div class="container-fluid">
		<div
			class="row well pading-left-none pading-right-none pading-top-none pading-bottom-none"
			id="tool-bar">
			<div class="col-sm-3">
				<h2>Admins Management</h2>
			</div>
			<div class="col-sm-3 col-sm-offset-6">
				<label for="apr-check" class="btn btn-default" style="height: 84px;"
					data-target="#add_AdminModal" data-toggle="modal"> <g:actionSubmitImage
						src="${resource(dir: 'images', file: 'add-ico.png')}" width="40"
						height="40" id="apr-check" value="Approuver" />
					<h6>Add an Admin</h6>
				</label> 



			</div>
		</div>
	</div>

	<div class="container-fluid ">
         <g:if test='${flash.message}' >
        <div id="resultat"   class="alert alert-success  alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span></button>
             ${flash.message}
        </div>
       

    </g:if>
		<g:form name="tableForm" controller="Admin">

			<table id="table-format" data-toggle="table" data-search="true"
				data-click-to-select="true" data-pagination="true"
				data-page-list="[5, 10, 20, 50, 100, 200]">
				<thead>
					<tr>
						<th><label><input type="checkbox" id="checkboxParant" /></label></th>
						<th data-sortable="true">Username</th>
						<th data-sortable="true">First & last name</th>
						<th data-sortable="true">Email</th>
						<th data-sortable="true">Added day</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<g:each var="admin" in="${listAdmins}">

						<tr class="odd gradeX">
							<td><g:checkBox name="selectedAdmins" class="selectedAdmins"
									value="${admin.id}" checked="false" /></td>
							<td><label class="showElement"> ${admin.username}</label></td>
							<td><label class="showElement">
									${admin.firstName} ${admin.lastName}
							</label></td>
							<td><label> ${admin.email }</label></td>

							<td><label>${admin.adminInfos.addedDay} </label></td>

						
						
							<td class="center">
							   <g:field type="number" name="adminId"
									value="${admin.id}" style="display:none" /> 
									<g:actionSubmit
									class="btn btn-danger btn-sm btn-icon icon-left"
									action="deleteAdmin" value="Delete" /></td>
						</tr>

					</g:each>
				</tbody>
				<tfoot>

				</tfoot>
			</table>
		</g:form>
	</div>

	<script type="text/javascript">
	$(document).ready(function(){
		$('#del-check').click(function(){
			$('td > form  >:checked').parent().parent().parent().remove();
		});
		
	$('#checkboxParant').click(function() {
		if ($('#checkboxParant').is(':checked')) {
				$('.selectedAdmins').prop('checked', true);
		}
		else{
			$('.selectedAdmins').prop('checked', false);
		}
	});
	$('.selectedAdmins').click(function() {
		if ($('.selectedAdmins').is(':checked')) {
				$('#checkboxParant').prop('checked', true);
		}
		else{
			$('#checkboxParant').prop('checked', false);
		}
	});

	$('#editRow').click(function() {
		$('.editElement').show()
			$('.showElement').hide()
	});
	
	$('#saveEdition').click(function() {
		$('.showElement').show();
		$('.editElement').hide();
			});
	});
</script>

</body>
</html>