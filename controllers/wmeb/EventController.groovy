package wmeb
import org.springframework.web.multipart.commons.CommonsMultipartFile
import grails.plugin.springsecurity.annotation.Secured
import java.util.Date;

@Secured(['ROLE_ADMIN'])
class EventController {
   def springSecurityService
   def eventService
   def  toolsService
    def index() { }
	

	def addEvent ={
		def event=new Event()
		event.description=params.eventDesc
		 event.title=params.eventTitle
		 event.startedDay=params.eventStartDay
		 event.endDay=params.eventEndDay
		 event.local=params.eventLocal
		 event.findTicketUrl=params.findTicketUrl
		 event.MaxGuest=params.int('eventMaxGuest')
		event.admin=springSecurityService.getCurrentUser()
		
		def file =request.getFile('uploadedFile')
		eventService.addEvent(event, file)
		redirect(controller: "admin", action: "events")
	}
	
	

	def deleteAllEvents= {
		
		def selectedEvent = Event.getAll(params.list('selectedEvents'))
		for(f in selectedEvent){
			println f.title
			f.delete(flush: true)
		}
		redirect(controller: "admin", action: "events")
	}
	

	def deleteEvent= {
		def event=Event.get(params.eventId)
		event.delete(flush: true)
		redirect(controller: "admin", action: "events")
	}
	

  def eventDetail(){
	  [event: Event.get(params.eventId)]
  }	
  
  def eventView(){
	  [event: Event.get(params.id)]
  }
  

  def editEvent={
	  def event= Event.get(params.id)
	  event.description=params.eventDesc
	  event.title=params.eventTitle
	  event.startedDay=params.eventStartDay
	  event.endDay=params.eventEndDay
	  event.local=params.eventLocal
	  event.findTicketUrl=params.findTicketUrl
	  event.MaxGuest=params.int('eventMaxGuest')
	  println params.uploadedFile
	 
		  def file =request.getFile('uploadedFile')
	if(!file.empty){	  
		 event.picture=toolsService.uplodFile(file,'web-app/uploadedMedia/events/')
	  }
	  
	  eventService.updateEvent(event)
	  redirect(controller: "admin", action: "events")
  }
}
