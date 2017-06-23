import wmeb.Product
import wmeb.Profil
import wmeb.Role
import wmeb.Shop
import wmeb.User
import wmeb.Category
import grails.plugin.springsecurity.SecurityFilterPosition
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.security.core.context.SecurityContextHolder
class BootStrap {
	
	
	def sas
	def authenticationProcessingFilter
	def concurrentSessionControlAuthenticationStrategy
   

    def init = { servletContext ->

		def adminRole = Role.findByAuthority('ROLE_ADMIN') ?:
		new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
		
		SpringSecurityUtils.clientRegisterFilter('concurrencyFilter',
			SecurityFilterPosition.CONCURRENT_SESSION_FILTER) 

	    authenticationProcessingFilter.sessionAuthenticationStrategy = sas
		
//    SpringSecurityUtils.clientRegisterFilter('myAuthFilter', SecurityFilterPosition.FORM_LOGIN_FILTER)
	  
	/*	def d=new Date()
		def ouidad=new User(username:'ouidad',password:'ouid@d89',firstName:'ouidad',
		lastName:'moussa',birthDay: d,country:'morocco',city:'Al Hociema',email:'moussaouidad@gmail.com',gender:'femme',
		)
		ouidad.save(failOnError: true, flush: true)
		
		def ouidadProfil=new Profil(user:ouidad)
		ouidadProfil.save(failOnError: true, flush: true)
		
		
		
//		______________________________Ctegory_____________________________________
		
		def Biography=new Category(label:'Biography')
		Biography.save(failOnError: true, flush: true)
		
		def books=new Category(label:'books',subCategories:Biography)
		books.save(failOnError: true, flush: true)
		
		
//		______________________________shop_________________________________________________
		
		def shop1=new Shop(name:'ouidadShop',code:'shop1',logo:'ff',Address:'rue dakar',
			phoneNumber:'066259886',email:'ouidadmoussa@gmail.com',user:ouidad)
		shop1.save(failOnError: true, flush: true)
		
		
//		_______________________________Products___________________________________
		
		def product1=new Product(name:'Grey',price:'50',isInStok:'1',picture:'none',
			category:Biography,shop:shop1)
		product1.save(failOnError: true, flush: true) */
			} 
    def destroy = {
    }
}
