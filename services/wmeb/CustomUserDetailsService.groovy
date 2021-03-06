package wmeb

import grails.plugin.springsecurity.userdetails.GormUserDetailsService
import grails.plugin.springsecurity.userdetails.GrailsUser
import grails.transaction.Transactional
import org.springframework.security.core.authority.GrantedAuthorityImpl
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UsernameNotFoundException
import grails.plugin.springsecurity.SpringSecurityUtils
 
@Transactional
class CustomUserDetailsService extends GormUserDetailsService{
 
     static final List NO_ROLES = [new GrantedAuthorityImpl(SpringSecurityUtils.NO_ROLE)]
 
   UserDetails loadUserByUsername(String username, boolean loadRoles)
            throws UsernameNotFoundException {
                return loadUserByUsername(username)
   }
 
   UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
 
      User.withTransaction { status ->

      User user = User.findByUsernameOrEmail(username,username)  //enable login with either username or password
 
         if (!user) throw new UsernameNotFoundException(
                      'User not found', username)
 
         def authorities = user.authorities.collect {
             new GrantedAuthorityImpl(it.authority)
         }
 
          return new GrailsUser(user.username,
                    user.password,
                    user.enabled,
                    !user.accountExpired,
                    !user.passwordExpired,
                    !user.accountLocked,
                    authorities ?: NO_ROLES,
                    user.id)
 
      }
   }
}
