package wmeb


class Country {
    String cc_fips
	String cc_iso
	String tld	
	String name
	static hasMany = [cities:City]
    static constraints = {
    }
	
	public String toString() {
		return name
	}
}
