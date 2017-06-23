package wmeb
import org.springframework.web.multipart.commons.CommonsMultipartFile
class PostController {
    def postService
	def springSecurityService
    def index() { 
		redirect(controller: "user", action: "myProfil")
	}
	
	def addPost(){
		
		def post=new Post()
		post.description=params.postDesc
         post.productLink=params.ProductLink
		post.user=springSecurityService.getCurrentUser()
		
		def file =request.getFile('uploadedFile')
		postService.addPost(post, file)
		redirect(controller: "user", action: "myProfil")
			}
	
	def detailedPost={
		def imOwner
	 def post=Post.get(params.long('id'))
		if(post.user==springSecurityService.getCurrentUser()){
			 imOwner=true
		}
     render(template: "detailedPost",  model: [detailedPost:post,imOwner:imOwner])
	}
	
	def deletePost={
		def post = Post.get(params.int('postId'))
		post.delete(flush: true)
	
	}
}
