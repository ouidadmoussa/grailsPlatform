package wmeb

import grails.plugin.multitenant.core.annotation.MultiTenant;


@MultiTenant
class Product {
    String name
	int Price
	Boolean isInStok
	String picture
	static hasOne = [category: Category]
	static belongsTo = [shop: Shop]
    static constraints = {
    }

	static mapping = {
		shop lazy: false
	}
}
