package wmeb

import grails.plugin.multitenant.core.Tenant



/**
 * TODO: Implement me!
 *
 * @see http://multi-tenant.github.com/grails-multi-tenant-single-db/
 */

class User implements Tenant{

	transient springSecurityService
    int userTenantId
	String code
	String username
	String email
	String password
	String firstName
	String lastName
	Date birthDay
	Date createdDate
	String gender
	String country
	String city
	String link
	static hasOne = [profil: Profil,shop:Shop,adminInfos:AdminInfos]
	static hasMany = [affiliates:User,posts:Post,formations:Formation,events:Event,addedAdmins:User]
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	
	
	Integer tenantId() {
		return this.id
	}
	
	static transients = ['springSecurityService','allAffiliates']

	static constraints = {
		email blank: false, unique: true
		password blank: false
		profil nullable:true ,blank:true
		adminInfos nullable:true ,blank:true
		shop nullable:true ,blank:true
		affiliates nullable:true ,blank:true
		firstName blank:false
		lastName blank:false
//		city blank:false
//		country blank:false
	}

	def getAllAffiliates() {
		return affiliates ? affiliates*.allAffiliates.flatten() + affiliates : []
	}
	
	static mapping = {
		password column: '`password`'
		
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role }
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}
	
	
}
