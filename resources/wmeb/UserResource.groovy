package wmeb

import javax.ws.rs.GET
import javax.ws.rs.Path
import javax.ws.rs.Produces
import javax.ws.rs.core.Response
import javax.ws.rs.Consumes

@Path('/api/user')
class UserResource {
    def toolsService
    @GET
    @Produces('text/plain')
    String getUserRepresentation() {
       toolsService.usersLoction()
    }
	
	@GET
	@Path('/countries')
	String getusersLocation() {
	  toolsService.usersLoction()
	 }
	
	
}
