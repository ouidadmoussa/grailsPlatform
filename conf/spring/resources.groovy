// Place your Spring DSL code here

import org.springframework.security.core.session.SessionRegistryImpl
import org.springframework.security.web.session.ConcurrentSessionFilter
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter
import org.springframework.security.web.authentication.session.CompositeSessionAuthenticationStrategy
import org.springframework.security.web.authentication.session.ConcurrentSessionControlAuthenticationStrategy
import org.springframework.security.web.authentication.session.RegisterSessionAuthenticationStrategy
import org.springframework.security.web.authentication.session.SessionFixationProtectionStrategy


beans = {
	userDetailsService(wmeb.CustomUserDetailsService)
	
	
	
// Activate these bean definitions
// Documentation http://grails.org/doc/latest/guide/single.html#14.2%20Configuring%20Additional%20Beans
 tenantResolver(wmeb.SpringSecurityTenantResolver) {
	springSecurityService = ref('springSecurityService')
 }
 tenantRepository(wmeb.SpringSecurityTenantRepository)
 
 //spring configuration
 sessionRegistry(SessionRegistryImpl)
 
  sessionFixationProtectionStrategy(SessionFixationProtectionStrategy)
 
  registerSessionAuthenticationStrategy(RegisterSessionAuthenticationStrategy,sessionRegistry)
 
  concurrencyFilter(ConcurrentSessionFilter) {
	  sessionRegistry = ref('sessionRegistry')
	  logoutHandlers = [ref("rememberMeServices"), ref("securityContextLogoutHandler")]
	  expiredUrl='/login/auth'
  }
 
  concurrentSessionControlAuthenticationStrategy(ConcurrentSessionControlAuthenticationStrategy,sessionRegistry){
	  maximumSessions= -1
	  exceptionIfMaximumExceeded=true
  }
 
 sas(CompositeSessionAuthenticationStrategy,[concurrentSessionControlAuthenticationStrategy,
	 sessionFixationProtectionStrategy,registerSessionAuthenticationStrategy])
  
  
 
  myAuthFilter(UsernamePasswordAuthenticationFilter){
	  sessionAuthenticationStrategy=ref('sas')
	  authenticationManager=ref('authenticationManager')
	   }
}

// Activate these bean definitions
// Documentation http://grails.org/doc/latest/guide/single.html#14.2%20Configuring%20Additional%20Beans
// tenantResolver(wmeb.DomainTenantResolver)
// tenantRepository(wmeb.CachingTenantRepository)


// Activate these bean definitions
// Documentation http://grails.org/doc/latest/guide/single.html#14.2%20Configuring%20Additional%20Beans
// tenantResolver(wmeb.SpringSecurityTenantResolver) {
//	springSecurityService = ref('springSecurityService')
// }
// tenantRepository(wmeb.SpringSecurityTenantRepository)
