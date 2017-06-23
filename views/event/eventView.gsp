<html>

<head>
<meta name='layout' content='main' />
<title>Event  Details</title>


<link rel="stylesheet" type="text/css" 
	href="${resource(dir: 'css/admin', file: 'custom.css')}" >
</head>
<body>



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
      
      <g:if test="${event.findTicketUrl }">
      <a href="${event.findTicketUrl }"
      		class="btn createButton" style="margin-top:10px;margin-bottom:5px;"
      >get a Ticket</a>
      </g:if>
        
     </div>
   </div>

  </div>

</body>
</html>