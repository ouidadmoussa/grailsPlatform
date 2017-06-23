package wmeb

import grails.plugin.springsecurity.annotation.Secured

class ProductController {


    def index() {redirect(action: "listProducts") }
	
	def listProducts(){
		def allProducts
		def msg
		
		
		if(params.productName){
			User.withoutTenantRestriction {
			allProducts=Shop.findAllByNameIlike("%"+params.productName+"%")
			}
			if(!allProducts) {
				msg="no products finded with name "+ params.productName
				User.withoutTenantRestriction {
				allProducts=Product.list()
				}
		}
	
		}else{
		User.withoutTenantRestriction {
			allProducts=Product.list()
		}
		}
		 def displayButton =false
		 if(Product.count>8) {displayButton=true}
		[products:allProducts,categories:Category.list(),msg:msg,displayButton:displayButton]
	
	}
	
	
	def show={
		def products
		def displayButton=false
		if(params.id){
	   def category= Category.get(params.id)
	   User.withoutTenantRestriction {
		    products=Product.findAllByCategory(category)
	   }
		}
		else{
			User.withoutTenantRestriction {
			 products=Product.list()
			}
		}
       if(products.size()>8){displayButton=true}
   render(template: "productFilter",  model: [products: products,displayButton:displayButton])
}
	
}
