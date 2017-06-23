package wmeb

class Event {
    String title
	Date   startedDay
	Date   endDay
	String description
	String local
	String picture
	int MaxGuest
	String findTicketUrl
	static belongsTo = [admin: User]
    static constraints = {
    }
}
