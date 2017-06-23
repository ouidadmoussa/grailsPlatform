package wmeb

import grails.plugin.springsecurity.annotation.Secured

@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
class UserController {
	def springSecurityService
	def userService
	def socialService
	def index(){
		
	}

	def dashboard(){
		
	def user=springSecurityService.getCurrentUser()
	
	def userCountry=Country.findByName(user.country)
	def userCity=City.findByName(user.city)
	def cities=City.findAllByCountry(userCountry)
	
	[user:user,countries: Country.listOrderByName(),cities:cities,
	userCountry:userCountry,userCity:userCity,categories:Category.findAll{ isParent == true },
	shopCategory:user.shop.category]
	}
	

	
	
	def cities = {

		def country = Country.get(params.countryId)

		def allCities = City.findAllByCountry(country, [order : "name" ])
		render g.select(name:'city',id :'city' ,from: allCities, optionValue :'name')
	}

	def listAffiliates(){
		def displayButton=false
		if(User.count()>8){displayButton=true}
		[countries: Country.listOrderByName(),users:User.list(),msg:params.msg,displayButton:displayButton]
	}
	
	

	def myProfil(){
			def displayButton=false
			def posts=Post.findAllByUser(springSecurityService.getCurrentUser())
			if(posts.size()>8){displayButton=true}
		[user:springSecurityService.getCurrentUser(),posts:posts,displayButton:displayButton]
		
	}
	
	def userProfil(){
		println "nnn"
		def affiliate=User.get(params.affiliateId)
		def displayButton=false
		def posts=Post.findAllByUser(affiliate)
		if(posts.size()>8){displayButton=true}
			[affiliate:affiliate,user:springSecurityService.getCurrentUser(),
				posts:posts,displayButton:displayButton]
		
	}
//	def show={
//		println params.country
//		println params.state
//		
//	   def users=User.findAllByCountryAndCity(params.country, params.state)
//	   
//   render(template: "affiliateFilter",  model: [users:users])
//	}
	
	
	def searcheByCode={
		def user=User.get(params.affiliateNumero)
		if(user==null){
			redirect(action: "listAffiliates",params: [msg:"the affiliate Number that you entered does not exist"])
		}
		else{
		
		redirect(action: "userProfil", params: [affiliateId: user.id])
		}
}

	def updateUser={
		def user=springSecurityService.getCurrentUser()

		user.username=params.username
		user.firstName=params.firstName
		user.lastName =params.lastName
		user.email =params.email
		user.birthDay=params.birthDay
		def country=Country.get(params.country)
		def city=City.get(params.city)
		user.country  =country.name
		user.city =city.name

		user.save(failOnError:true,flush: true)
		def userCountry=Country.findByName(user.country)
		def userCity=City.findByName(user.city)
		def cities=City.findAllByCountry(userCountry)
		render(template: "general",  model: [user:user,countries: Country.listOrderByName(),cities:cities,
			userCountry:userCountry,userCity:userCity,categories:Category.findAll{ isParent == true },
			shopCategory:user.shop.category])
	}
	

	def updateShop={
		def user=springSecurityService.getCurrentUser()
		def shop=Shop.findByUser(user)
		shop.Address=params.address
		shop.phoneNumber=params.phoneNumber
		shop.description=params.desc
		def cat=Category.get(params.category)
		shop.category=cat
		shop.save(failOnError:true,flush: true)
		
		def userCountry=Country.findByName(user.country)
		def userCity=City.findByName(user.city)
		def cities=City.findAllByCountry(userCountry)
		render(template: "general",  model: [user:user,countries: Country.listOrderByName(),cities:cities,
			userCountry:userCountry,userCity:userCity,categories:Category.findAll{ isParent == true },
			shopCategory:user.shop.category])
	} 

	
	def generalData={
		def user=springSecurityService.getCurrentUser()
		def shop=Shop.findByUser(user)	
		def userCountry=Country.findByName(user.country)
		def userCity=City.findByName(user.city)
		def cities=City.findAllByCountry(userCountry)
		render(template: "general",  model: [user:user,countries: Country.listOrderByName(),cities:cities,
			userCountry:userCountry,userCity:userCity,categories:Category.findAll{ isParent == true },
			shopCategory:user.shop.category])
	}
	
	def formation ={
		render(template: "formation")
	}
	
	def  directAffiliates={

		def user=springSecurityService.getCurrentUser()
		if (params.sort == null) {
			params.sort = "id"
		}

		params.max = Math.min(params.max ? params.int('max') : 10, 100)

		params.offset = params.int('offset')?:0

			def allAffiliates=user.affiliates
			List<User> listAffiliates = new ArrayList<User>(allAffiliates);
			
		def(affiliates,affiliatesCount)= userService.orderPaginate(params.sort,params.order,
				params.max,params.offset ,listAffiliates)

 render(template: "affiliates",model: [affiliates:listAffiliates,affiliatesCount:affiliatesCount,selectValue:"Direct"])
		}
	
	def myAffiliates={
		println 'wssal'
		if (params.sort == null) {
			params.sort = "id"
		}
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.offset = params.int('offset')?:0
		def user=springSecurityService.getCurrentUser()
		def listAffiliates=user.getAllAffiliates()
	
		def(affiliates,affiliatesCount)= userService.orderPaginate(params.sort,params.order,
				params.max,params.offset ,listAffiliates)

		render(template: "affiliates",model: [affiliates:affiliates,
			affiliatesCount:affiliatesCount,selectValue:"All"])
	}
	
	def paiment={
		render(template: "paiment")
	}
	
	def statistic={
		render(template: "statistic")
	}
   
	def sendTweetMessage={
		socialService.tweetMessage()
	}
	def findAffiliates={
		def users
		if(!params.int('country')){users=User.list()}
	     else{
		 users=userService.findAffiliatesByCountry_City(params.int('country'), params.state)
	     }
		render(template: "affiliateFilter",  model: [users:users])
	}
}
