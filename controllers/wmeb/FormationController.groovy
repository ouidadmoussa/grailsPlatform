package wmeb
import org.springframework.web.multipart.commons.CommonsMultipartFile
import grails.plugin.springsecurity.annotation.Secured
import java.util.Date;


@Secured(['ROLE_ADMIN'])
class FormationController {
   def springSecurityService
   def formationService
    def index() { }
	
	def addFormation ={
		def formation=new Formation()
		formation.description=params.formationDesc
		 formation.title=params.formationTitle
		 formation.type=params.formationType
		formation.user=springSecurityService.getCurrentUser()
		
		def file =request.getFile('uploadedFile')
		formationService.addFormation(formation, file)
		redirect(controller: "admin", action: "formation")
	}
	
	
	def deleteAllFormations= {
		
		def selectedFormation = Formation.getAll(params.list('selectedFormations'))
		for(f in selectedFormation){
		
			f.delete(flush: true)	
		}
		redirect(controller: "admin", action: "formation")
	} 
	def deleteFormation= {
		def formation=Formation.get(params.formationId)
		formation.delete(flush: true)	
		redirect(controller: "admin", action: "formation")
	}
  def editFormation={
	  
	  formationService.updateFormation(params.long('formationId'), params.formationDesc,
		   params.formationTitle, params.formationType)
	  redirect(controller: "admin", action: "formation")
  }
}
