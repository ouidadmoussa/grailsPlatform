package wmeb



class Post {

	String description
	Date createdDate=new Date()
	String media
	String productLink
	static belongsTo = [user: User]
	
	
	static constraints = {
	}


}
