package wmeb



class Category {
	
    String label
	Boolean isParent
	static hasMany = [products:Product,subCategories: Category,shop:Shop]
    static constraints = {
    }
}
