package wmeb

class AdminInfos {

	 Date addedDay=new Date()
	
	 static belongsTo = [admin:User]
	 
    static constraints = {
    }
}
