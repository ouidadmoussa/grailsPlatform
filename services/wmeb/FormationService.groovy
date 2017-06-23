package wmeb

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import grails.transaction.Transactional

@Transactional
class FormationService {
     def toolsService
    def serviceMethod() {

    }
	def addFormation(Formation formation ,CommonsMultipartFile file){
	
		formation.path=toolsService.uplodFile(file,'web-app/uploadedMedia/formations/')
		formation.save(failOnError:true,flush: true)
		}
	
	def updateFormation(long id,String description,String title,String type){
		def formation=Formation.get(id)
		formation.description=description
		formation.title=title
		formation.type=type
		formation.save(failOnError:true,flush: true)
	}
}
