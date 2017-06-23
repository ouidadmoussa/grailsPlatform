package wmeb

import grails.transaction.Transactional

@Transactional
class UserService {
     def  springSecurityService
    def serviceMethod() {

    }
	
	def  orderPaginate(String paramSort,String paramOrder, int max, int offset, def listAffiliates ){
		
      	def affiliatesCount=listAffiliates.size()

		listAffiliates.sort{ a, b ->
			if (paramOrder == 'desc') {
				b."${sort}" <=> a."${paramSort}"
			} else {
				a."${paramSort}" <=> b."${paramSort}"
			}
		}
		def affiliates=listAffiliates.subList(offset, Math.min(offset+max,affiliatesCount))
	
		
		return [affiliates,affiliatesCount]
		
		}
	def findAffiliatesByCountry_City(int countryId, String city){
        def users
		def country=Country.get(countryId)
		if(!city){
			users=User.findAllByCountry(country.name)
		}
		else{
			users=User.findAllByCountryAndCity(country.name,city)
		}
		
		return users
	}
}



//
//def user=springSecurityService.getCurrentUser()
//

//
//def affiliatesCount=user.getAllAffiliates().size()
//
//def listAffiliates=user.getAllAffiliates()
//listAffiliates.sort{ a, b ->
//	if (params.order == 'desc') {
//		b."${params.sort}" <=> a."${params.sort}"
//	} else {
//		a."${params.sort}" <=> b."${params.sort}"
//	}
//}
//def affiliates=listAffiliates.subList(params.offset, Math.min(params.offset+params.max,affiliatesCount))
//
