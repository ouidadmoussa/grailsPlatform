package register


import java.util.Date;
import org.springframework.web.multipart.commons.CommonsMultipartFile




import com.sun.org.apache.xalan.internal.xsltc.compiler.Import;

import grails.plugin.springsecurity.authentication.dao.NullSaltSource
import grails.plugin.springsecurity.ui.RegistrationCode
import grails.plugin.springsecurity.SpringSecurityUtils
import  wmeb.User
import wmeb.Profil
import wmeb.Country
import wmeb.City
import wmeb.Shop
import wmeb.Category

class RegisterController extends grails.plugin.springsecurity.ui.RegisterController {
	
	def shopService
	def tinyurlService
	def grailsLinkGenerator
	def index(){
		def copy = [:] + (flash.chainedParams ?: [:])
		['controller', 'action', 'format'].each { copy.remove it }
		def categories= Category.findAll{isParent==true}
		[command: new RegisterCommand(copy),countries: Country.listOrderByName(),categories:categories]
	}

	
	
	def cities = {
		
		def country = Country.get(params.countryId)
		
		render g.select(name:'city',id :'city' ,from: City.findAllByCountry(country, [order : "name" ]),
	   optionValue :'name')
}
	
	def getTld = {
		
		def country = Country.get(params.countryId)	
		render	g.select(name:'tld',id :'tld' ,from: [country.tld,'com','org','net'])
		
		}

	
	def mailService
	
	def register(RegisterCommand command) {
		
				if (command.hasErrors()) {
					
					render view: 'index', model: [command: command]
					return
				}
				def country=Country.get(command.country)
				def user
				
		        def d=new Date().format('yyyy-mm')
			    long i=User.last('id').id+ 1
				def userCode='WMEB'+d+i

			def userUrl = tinyurlService.tiny(grailsLinkGenerator.link(controller: 'register', 
				params: [code: userCode], absolute: true))
				
				String salt = saltSource instanceof NullSaltSource ? null : command.username
				 
					 user = lookupUserClass().newInstance(email: command.email,
					 username: command.username,birthDay:command.birthDay ,createdDate:new Date(),
					firstName: command.firstName,lastName:command.lastName,
					city:command.city, country:country.name, gender:command.gender,
					 profil: command.profil,code:userCode,link:userUrl,
						accountLocked: true, enabled: true)
					
		            if(params.parents) {  
					def parent= User.findByCode(params.parents)
					if(parent){
					parent.addToAffiliates(user)
					parent.save()
					}
		              }
					
				RegistrationCode registrationCode = springSecurityUiService.register(user, command.password, salt)
				if (registrationCode == null || registrationCode.hasErrors()) {	
					// null means problem creating the user
					flash.error = message(code: 'spring.security.ui.register.miscError')
					flash.chainedParams = params
					redirect action: 'index'
					return
				}
		
				String url = generateLink('verifyRegistration', [t: registrationCode.token])
		
				def conf = SpringSecurityUtils.securityConfig
				def body = conf.ui.register.emailBody
				if (body.contains('$')) {
					body = evaluate(body, [user: user, url: url])
				}
				mailService.sendMail {
					to command.email
					from conf.ui.register.emailFrom
					subject conf.ui.register.emailSubject
					html body.toString()
				}
		
				def shop=new Shop()
			
		        def shopCategory = Category.get(params.myCategory)
				
				shop.name=params.domainName+"."+params.tld
				shop.address=params.address
				shop.phoneNumber=params.phoneNumber
				shop.category=shopCategory
				shop.description=params.desc
				shop.user=user
				def file = request.getFile('myFile')
				
				shopService.addShop(shop, file ,user)
				render view: 'index', model: [emailSent: true]
			}
	
	def verifyRegistration() {
		
				def conf = SpringSecurityUtils.securityConfig
				String defaultTargetUrl = conf.successHandler.defaultTargetUrl
		
				String token = params.t
		
				def registrationCode = token ? RegistrationCode.findByToken(token) : null
				if (!registrationCode) {
					flash.error = message(code: 'spring.security.ui.register.badCode')
					redirect uri: defaultTargetUrl
					return
				}
		
				def user
				// TODO to ui service
				RegistrationCode.withTransaction { status ->
					String usernameFieldName = "username"
					user = lookupUserClass().findWhere((usernameFieldName): registrationCode.username)
					if (!user) {
						return
					}
					user.accountLocked = false
					user.save(flush:true)
					def UserRole = lookupUserRoleClass()
					def Role = lookupRoleClass()
					for (roleName in conf.ui.register.defaultRoleNames) {
						UserRole.create user, Role.findByAuthority(roleName)
					}
					registrationCode.delete()
				}
		
				if (!user) {
					flash.error = message(code: 'spring.security.ui.register.badCode')
					redirect uri: defaultTargetUrl
					return
				}
		
				springSecurityService.reauthenticate user.username
		
				flash.message = message(code: 'spring.security.ui.register.complete')
				redirect uri: conf.ui.register.postRegisterUrl ?: defaultTargetUrl
			}
	
	def forgotPassword() {
	
			if (!request.post) {
				// show the form
				return
			}
	
			String username = params.username



			if (!username) {
				flash.error = message(code: 'spring.security.ui.forgotPassword.username.missing')
				redirect action: 'forgotPassword'
				return
			}
	
			String usernameFieldName = "email"
			def user = lookupUserClass().findWhere((usernameFieldName): username)
			if (!user) {
				flash.error = message(code: 'spring.security.ui.forgotPassword.user.notFound')
				redirect action: 'forgotPassword'
				return
			}
	
			def registrationCode = new RegistrationCode(username: user."$usernameFieldName")
			registrationCode.save(flush: true)
	
			String url = generateLink('resetPassword', [t: registrationCode.token])
	
			def conf = SpringSecurityUtils.securityConfig
			def body = conf.ui.forgotPassword.emailBody
			if (body.contains('$')) {
				body = evaluate(body, [user: user, url: url])
			}
			mailService.sendMail {
				to user.email
				from conf.ui.forgotPassword.emailFrom
				subject  conf.ui.forgotPassword.emailSubject
				html body.toString()
			}
	
			[emailSent: true]
		}
			
	
	
}

class RegisterCommand {
	
		String username
		String email
		String password
		String password2
		String firstName
	    String lastName
		Date birthDay
		String gender
		String country
		String city
		Profil profil	
	  
		def grailsApplication
	
		static constraints = {
			  
			username blank: false, validator: { value, command ->
				if (value) {
					
					def User = command.grailsApplication.getDomainClass(
						SpringSecurityUtils.securityConfig.userLookup.userDomainClassName).clazz
					if (User.findByUsername(value)) {
						return 'registerCommand.username.unique'
					}
				}
			}
			email blank:false, validator: { value, command ->
				if (value) {
					
					def User = command.grailsApplication.getDomainClass(
						SpringSecurityUtils.securityConfig.userLookup.userDomainClassName).clazz
					if (User.findByEmail(value)) {
						return 'Email must be unique'
					}
				}
			}
			password blank: false, validator: RegisterController.passwordValidator
			password2 validator: RegisterController.password2Validator
			profil blank:true , nullable :true
			firstName blank:false
			lastName  blank:false
			}
	}
