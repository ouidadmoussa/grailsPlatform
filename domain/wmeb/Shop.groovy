package wmeb

import grails.plugin.multitenant.core.annotation.MultiTenant


@MultiTenant
class Shop implements Comparable<Shop> {

   	String name
	String logo
	String Address
	String phoneNumber
	String description
	static belongsTo = [user: User]
	static hasOne = [category: Category]
	static hasMany = [products:Product]
	static constraints = {
    name unique: 'tenantId', blank: false
		logo nullable:true , blanck: false
		
	}
	static mapping = {
		sort "name"
	}
	
	int compareTo(Shop other) {
		name <=> other.name
	}
	

  
}
