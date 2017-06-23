package wmeb


import wmeb.Country;
import wmeb.User

class City {
	
	String name

//	static hasMany = [user:User]
	static belongsTo = [country:Country]
    static constraints = {
    }
	
	
	public String toString() {
		return name
	}
}
