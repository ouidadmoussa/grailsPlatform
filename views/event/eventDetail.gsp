<html>

<head>
<meta name='layout' content='adminLayout' />
<title>Event  Details</title>


<link rel="stylesheet" type="text/css" 
	href="${resource(dir: 'css/admin', file: 'custom.css')}" >
</head>
<body>


<div class=" container-fluid" >
		<div
			class="row well pading-left-none pading-right-none pading-top-none pading-bottom-none"
			id="tool-bar">
			<div class="col-sm-3">
				<h2>Event Details</h2>
			</div>
			<div class="col-sm-3 col-sm-offset-6">
				
              <button id="editEvent" role="button"  type="button" role="button"
									class="btn btn-default btn-sm btn-icon icon-left  showElement">
									<i class="entypo-pencil"></i> Edit
								</button> 

			 <g:link  params="[eventId: event.id]" action="deleteEvent" controller="Event" 
			  class="btn btn-danger btn-sm btn-icon icon-left"  value="Delete">
			  <i class="entypo-trash"></i>
			  Delete</g:link>
	



			</div>
		
		</div>
	</div>
  <div class="showElement container-fluid">
   <div class="row">
   
      <div class="col-md-5">
       <div class="eventPicture">
      <g:img class="img-responsive" dir="uploadedMedia/events" file="${event.picture}"/>
      </div>
      </div>
      <div class="col-md-7">
      <h2 class="WmebInNumberstitle"> ${event.title }</h2>
      <p class="customText">${event.description }</p> <br>
     
      <p class="customText"><b>Start Day :</b> ${event.startedDay } </p> 
      <p class="customText"> <b> End Day :</b> ${event.endDay }</p> 
      <p class="customText"><b> Local :</b> ${event.local }</p>
      <p class="customText"><b> Guest Number :</b> ${event.MaxGuest }</p> 
       <p class="customText"><b> tickets link :</b> ${event.findTicketUrl }</p> 
      <p class="customText"><b>added By :</b> ${event.admin.firstName} ${event.admin.lastName}</p>
     </div>
   </div>
  
  </div>

<div class="editElement container-fluid " style="margin-bottom: 10px;">
    <div class="col-md-8 col-md-offset-2">
<g:form controller="Event" action="editEvent" id="${event.id}"
				enctype="multipart/form-data">
				<div class="modal-content">
					<div class="modal-header">
					
						<h4 class="modal-title">Add an event</h4>
					</div>
					<div class="modal-body " style="text-align: center;">
						<g:textField class="emailField form-control "
							name="eventTitle" placeholder="Title" value="${event.title}" />
						
						<g:textArea name="eventDesc" placeholder="Description"
							rows="4" cols="40" class="emailField form-control " value="${event.description}"/>
							
						<g:textField class="emailField form-control "
							name="eventLocal" placeholder="Local"  value="${event.local }"/>
							
						<g:textField class="emailField form-control "
							name="findTicketUrl" placeholder="Ticket Url"  value="${event.findTicketUrl}"/>	
							
						<g:textField class="emailField form-control "
							name="eventMaxGuest" placeholder="Maximum Guest" value="${event.MaxGuest}"/>	
						
						<label class="custom-file-upload "> Select event start day<br/>
						<g:datePicker name="eventStartDay" 
						years="${Calendar.instance.get(Calendar.YEAR)..1910}"  
						precision="minute" noSelection="['':'-Choose Start Day-']"
						value="${event.startedDay}" />	
						</label>
						<br> <br>
							<label class="custom-file-upload "> Select event end day<br/>
					
						<g:datePicker name="eventEndDay" 
						years="${Calendar.instance.get(Calendar.YEAR)..1910}"  
						precision="minute" noSelection="['':'-Choose end Day-']"
						value="${event.endDay }" />
						</label>
						<br> <br> <label class="custom-file-upload ">
							Upload Picture <g:field type="file" name="uploadedFile"
							/>
						</label>

					</div>
					<div class="modal-footer">
						<g:submitButton  id="saveEdition" name="saveEdition" class="btn " value="Save" />

					</div>
				</div>
			</g:form>
</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
$('#editEvent').click(function() {
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