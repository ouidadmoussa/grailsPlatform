package wmeb

class ShopController {
      def springSecurityService
      def index() {redirect(action: "listShops") }
	  
	def listShops(){
		def allShops
		def msg
		
		
		if(params.shopName){
			User.withoutTenantRestriction {
			allShops=Shop.findAllByNameIlike("%"+params.shopName+"%")
			}
			
			if(!allShops) {
				msg="no shops finded with name "+ params.shopName
				
				User.withoutTenantRestriction {
				allShops=Shop.list()
				}
		}
			println allShops
		}	
		else{
			User.withoutTenantRestriction {
			allShops=Shop.list()
			}

			}
	
		def displayButton=false
		if(Shop.count()>8){displayButton=true}
		[shops:allShops,categories:Category.list(),msg:msg,displayButton:displayButton]
	}
	  
	 def show={
		 def  shops
		 def displayButton=false
		if(params.id){
		def category= Category.get(params.id)
		User.withoutTenantRestriction {
			  shops=Shop.findAllByCategory(category)
		}
		}	
		else{
			User.withoutTenantRestriction {
			shops=Shop.list()
			}
			}
		if(shops.size()>8){displayButton=true}
	
	render(template: "shopFilter",  model: [shops: shops,displayButton:displayButton])
		   
		 } 
	 
	
	 
	  def createShop(){}
}
