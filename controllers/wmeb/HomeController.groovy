package wmeb

class HomeController {
      def eventService
    def index() { 
		
		[productsAmount:Product.count(),usersAmount:User.count(),
			shopsAmount:Shop.count(),upcomingEvent:eventService.upcomingEvent()]
	}
}
