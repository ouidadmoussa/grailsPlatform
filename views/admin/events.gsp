<html>

<head>
<meta name='layout' content='adminLayout' />
<title>Events management</title>


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

	<%-- _____________________________add event Modal__________________________________--%>
	<div class="modal fade" id="add_EventModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">

		<div class="modal-dialog  modal-sm">
			<g:form controller="Event" action="addEvent"
				enctype="multipart/form-data">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">x</button>
						<h4 class="modal-title">Add an event</h4>
					</div>
					<div class="modal-body " style="text-align: center;">
						<g:textField class="emailField form-control "
							name="eventTitle" placeholder="Title" />
						
						<g:textArea name="eventDesc" placeholder="Description"
							rows="4" cols="40" class="emailField form-control " />
							
						<g:textField class="emailField form-control "
							name="eventLocal" placeholder="Local" />
							
						<g:textField class="emailField form-control "
							name="findTicketUrl" placeholder="Ticket Url" />	
							
						<g:textField class="emailField form-control "
							name="eventMaxGuest" placeholder="Maximum Guest" />	
						
						<label class="custom-file-upload "> Select event start day<br/>
						<g:datePicker name="eventStartDay" value="${new Date()}"
						years="${Calendar.instance.get(Calendar.YEAR)..1910}"  
						precision="minute" noSelection="['':'-Choose Start Day-']" />	
						</label>
						<br> <br>
							<label class="custom-file-upload "> Select event end day<br/>
					
						<g:datePicker name="eventEndDay" value="${new Date()}"
						years="${Calendar.instance.get(Calendar.YEAR)..1910}"  
						precision="minute" noSelection="['':'-Choose end Day-']" />
						</label>
						<br> <br> <label class="custom-file-upload ">
							Upload Picture <g:field type="file" name="uploadedFile" />
						</label>

					</div>
					<div class="modal-footer">
						<g:submitButton name="savePost" class="btn " value="Save" />

					</div>
				</div>
			</g:form>
		</div>

	</div>



	<div class="container-fluid" >
		<div
			class="row well pading-left-none pading-right-none pading-top-none pading-bottom-none"
			id="tool-bar">
			<div class="col-sm-3">
				<h2>Events Management</h2>
			</div>
			<div class="col-sm-3 col-sm-offset-6">
				<label for="apr-check" class="btn btn-default" style="height: 84px;"
					data-target="#add_EventModal" data-toggle="modal"> <g:actionSubmitImage
						src="${resource(dir: 'images', file: 'add-ico.png')}" width="40"
						height="40" id="apr-check" value="Approuver" />
					<h6>Add an Event</h6>
				</label> <label for="del-check" class="btn btn-default"
					style="height: 84px;"> <g:actionSubmitImage
						name="del-check" form="tableForm"
						src="${resource(dir: 'images', file: 'cancel-ico.png')}" with="40"
						height="40" id="del-check" value="Delete"
						action="deleteAllEvents" controller="Event" />
					<h6>Delete</h6>
				</label>



			</div>
		</div>
	</div>
	
	<div class="container-fluid " >

		<g:form name="tableForm"   controller="Event"  >

			<table id="table-format" data-toggle="table"  data-search="true"
				data-click-to-select="true" data-pagination="true"
				data-page-list="[5, 10, 20, 50, 100, 200]">
				<thead>
					<tr>
						<th><label><input type="checkbox" id="checkboxParant" /></label></th>
						<th data-sortable="true">Title</th>
						<th data-sortable="true">Started Day</th>
						<th data-sortable="true">End Day</th>
						<th data-sortable="true">Local</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<g:each var="event" in="${listEvents}">

						<tr class="odd gradeX">
							<td><g:checkBox name="selectedEvents"
									class="selectedEvents" value="${event.id}" checked="false" /></td>
							<td>
								<label class="showElement"> ${event.title }</label>
								
							</td>
							<td> 
								<label  class="showElement">${event.startedDay}</label>
							
							</td>
							<td>
							<label>	${event.endDay }</label>
							</td>
							
							<td>
							<label>${event.local }</label>
							</td>
							<td class="center">
						     <g:field type="number" name="eventId" value="${event.id}" style="display:none"/>
							
							
								
								<g:link  params="[eventId: event.id]" action="eventDetail" controller="Event"
								class="btn btn-default btn-sm btn-icon icon-left"  >
     								<i class="entypo-info"></i> Details</g:link>				
					
								<g:actionSubmit  
									class="btn btn-danger btn-sm btn-icon icon-left"
									action="deleteEvent"   value="Delete"/>
							
 
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
				$('.selectedEvents').prop('checked', true);
		}
		else{
			$('.selectedEvents').prop('checked', false);
		}
	});
	$('.selectedEvents').click(function() {
		if ($('.selectedEvents').is(':checked')) {
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