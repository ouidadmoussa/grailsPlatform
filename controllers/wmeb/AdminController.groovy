package wmeb

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import wmeb.User
import wmeb.AdminInfos


@Secured(['ROLE_ADMIN'])
class AdminController {
	def sessionRegistry
	def springSecurityService
	def toolsService
    def index() { 
	
		println sessionRegistry.getAllPrincipals().size()
		[today:new Date(),usersNb:User.count(),productsNb:Product.count(),
			logInUsers:sessionRegistry.getAllPrincipals().size(),
			admin:springSecurityService.getCurrentUser()]
	}
	
	
	def usersLoctaion={
		return  toolsService.usersLoction() 
	}
	def admins(){
		def adminRole = Role.findByAuthority('ROLE_ADMIN')
		[listAdmins: UserRole.findAllByRole(adminRole).user]
	}
	
	
	def affiliates(){
		
	}
	
	def events(){
		[listEvents:Event.list()]
	}
	
	def formation(){
		[listFormation:Formation.list()]
	}
	
	def addAdmin={
		 def msg=""
       def user = User.findByUsernameOrEmail(params.userInfos,params.userInfos)
		if(user){
			def adminRole = Role.findByAuthority('ROLE_ADMIN')
			UserRole.create(user, adminRole, true)
		   
			 def adminInfos=new AdminInfos()
			adminInfos.admin=user
		
			adminInfos.save(failOnError:true,flush: true)	
			
			springSecurityService.getCurrentUser().addToAddedAdmins(user)
			.save(failOnError:true,flush: true)
			                           
			msg= user.firstName +" "+ user.lastName+" has been added  succefuly as an  admin "
		}
		else{
			 msg= "the email or username doesn't exist"	
		}
	    flash.message =  msg
		redirect(action:'admins');
	}
	def deleteAdmin={
		def msg
		def adminRole = Role.findByAuthority('ROLE_ADMIN')
		def user=User.get(params.adminId)
		if(user != springSecurityService.getCurrentUser()){
		UserRole.remove(user, adminRole, true)
		msg=user.firstName +" "+ user.lastName+" has been   succefuly removed "
		}
		else{
			msg="Admin account can't be removed by its owner"
		}
		flash.message =  msg
		redirect(action:'admins');
	}
//	def deleteFormation={
//		def formation=Formation.getAt(params.id)
//		formation.delete(flush: true)
//		redirect(controller: "admin", action: "formation")
//	}
	
	
}
