package wmeb

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import grails.transaction.Transactional

@Transactional
class PostService {
     def toolsService
    def serviceMethod() {

    }
	
	def addPost(Post post,CommonsMultipartFile file ){
		
		post.media=toolsService.uplodFile(file, "web-app/uploadedMedia/")
		
		post.save(failOnError:true,flush: true)
	}
}
