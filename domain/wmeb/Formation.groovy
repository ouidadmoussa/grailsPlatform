package wmeb

class Formation {

	 String title
	 String type
	 String path 
	 String description
	 Date   uplaodedDate=new Date()
	 static belongsTo = [user: User]
	 
    static constraints = {
    }
}
