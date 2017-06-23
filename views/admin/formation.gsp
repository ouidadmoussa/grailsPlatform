<html>

<head>
<meta name='layout' content='adminLayout' />
<title>Formations management</title>


<style type="text/css">
.editElement{
 display:none
}
.showElement{
display:block;
}
</style>
</head>
<body>
	<%-- _____________________________add post Modal__________________________________--%>
	<div class="modal fade" id="add_FormtionModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">

		<div class="modal-dialog  modal-sm">
			<g:form controller="formation" action="addFormation"
				enctype="multipart/form-data">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">x</button>
						<h4 class="modal-title">Add a Formation</h4>
					</div>
					<div class="modal-body " style="text-align: center;">
						<g:textField class="emailField form-control "
							name="formationTitle" placeholder="Title" />
						<g:select name="formationType" from="${['video','document']}"
							class="emailField form-control"
							noSelection="['':'-Choose formation type -']" />

						<g:textArea name="formationDesc" placeholder="Description"
							rows="4" cols="40" class="emailField form-control " />
						<br> <br> <label class="custom-file-upload ">
							Upload Image <g:field type="file" name="uploadedFile" />
						</label>

					</div>
					<div class="modal-footer">
						<g:submitButton name="savePost" class="btn " value="Save" />

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
				<h2>Formations Management</h2>
			</div>
			<div class="col-sm-3 col-sm-offset-6">
				<label for="apr-check" class="btn btn-default" style="height: 84px;"
					data-target="#add_FormtionModal" data-toggle="modal"> <g:actionSubmitImage
						src="${resource(dir: 'images', file: 'add-ico.png')}" width="40"
						height="40" id="apr-check" value="Approuver" />
					<h6>Add a Formation</h6>
				</label> <label for="del-check" class="btn btn-default"
					style="height: 84px;"> <g:actionSubmitImage
						name="del-check" form="tableForm"
						src="${resource(dir: 'images', file: 'cancel-ico.png')}" with="40"
						height="40" id="del-check" value="Delete"
						action="deleteAllFormations" controller="Formation" />
					<h6>Delete</h6>
				</label>



			</div>
		</div>
	</div>
	<div class="container-fluid">

		<g:form name="tableForm"   controller="Formation"  >

			<table id="table-format" data-toggle="table"  data-search="true"
				data-click-to-select="true" data-pagination="true"
				data-page-list="[5, 10, 20, 50, 100, 200]">
				<thead>
					<tr>
						<th><label><input type="checkbox" id="checkboxParant" /></label></th>
						<th data-sortable="true">Title</th>
						<th>Description</th>
						<th data-sortable="true">Uploaded Date</th>
						<th data-sortable="true">Type</th>
						<th data-sortable="true">Path</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<g:each var="f" in="${listFormation}">

						<tr class="odd gradeX">
							<td><g:checkBox name="selectedFormations"
									class="selectedFormations" value="${f.id}" checked="false" /></td>
							<td>
								<label class="showElement"> ${f.title }</label>
								<g:textField name="formationTitle" value=" ${f.title }" class="emailField form-control editElement" />
							</td>
							<td> 
								<label  class="showElement">${f.description }</label>
							<g:textArea name="formationDesc" placeholder="Description"
							rows="4" cols="40" class="emailField form-control editElement" value="${f.description}" />
							</td>
							<td>
							<label>	${f.uplaodedDate }</label>
							</td>
							<td>
							<label  class="showElement">	${f.type }</label>
								
							<g:select name="formationType" from="${['video','document']}"
							class="emailField form-control editElement" value="${f.type}"
							noSelection="['':'-Choose formation type -']" />
							</td>
							<td>
							<label>${f.path }</label>
							</td>
							<td class="center">
						     <g:field type="number" name="formationId" value="${f.id}" style="display:none"/>
								<button id="editRow" role="button"  type="button" role="button"
									class="btn btn-default btn-sm btn-icon icon-left  showElement">
									<i class="entypo-pencil"></i> Edit
								</button> 
								
								<g:actionSubmit id="saveEdition"
									class="btn btn-default btn-sm btn-icon editElement" value="Save" 
									action="editFormation"/>
									
					
								<g:actionSubmit id="${f.id}" 
									class="btn btn-danger btn-sm btn-icon icon-left"
									action="deleteFormation"   value="Delete"/>
							
 
							</td>
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
				$('.selectedFormations').prop('checked', true);
		}
		else{
			$('.selectedFormations').prop('checked', false);
		}
	});
	$('.selectedFormations').click(function() {
		if ($('.selectedFormations').is(':checked')) {
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