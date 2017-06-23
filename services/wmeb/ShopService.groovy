package wmeb

import grails.transaction.Transactional
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Transactional
class ShopService {
     def toolsService
    def serviceMethod() {

    }
	
	
	def addShop(Shop shop ,CommonsMultipartFile file ,User user){

		new File("web-app/allFiles/"+shop.name).mkdirs()
		String destinationDir = "web-app/allFiles/"+shop.name+"/"
		String sourceDir = "template1"
		
		new AntBuilder().copy(todir: destinationDir) {
			fileset(dir: sourceDir)
		}
		shop.logo=toolsService.uplodFile(file,destinationDir)
		
  
	
		user.withThisTenant {
			 shop.save(failOnError:true,flush: true)
		}
		}
}
