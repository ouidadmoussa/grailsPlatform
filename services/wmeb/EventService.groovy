package wmeb

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import grails.transaction.Transactional

@Transactional
class EventService {
	def toolsService
    def serviceMethod() {

    }
	
	def addEvent(Event event ,CommonsMultipartFile file){
		
			event.picture=toolsService.uplodFile(file,'web-app/uploadedMedia/events/')
			event.save(failOnError:true,flush: true)
			}
	
   def updateEvent(Event event){
	   
	   event.save(failOnError:true,flush: true)
   }
   
   def upcomingEvent(){
	   def today = new Date()
	   def query = Event.where {
		   (startedDay >= today )
	   }
	   def result = query.list(sort:"startedDay",max: 1)
	   return result[0]
   }		
}
