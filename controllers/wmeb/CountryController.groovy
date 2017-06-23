package wmeb

import grails.converters.JSON

class CountryController {
	
	def ajaxGetCities = {
		def country = Country.get(params.id)
		render country?.cities as JSON
	}
	
	def cities = {
		
		def country = Country.get(params.countryId)
		def allCities
		 println params.countryId
		allCities = City.findAllByCountry(country, [order : "name" ])
		render g.select(name:'city',id :'city' ,from: allCities, optionValue :'name')
			
		}
	
    def index() { }
}
