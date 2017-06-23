package wmeb



import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.sun.org.apache.bcel.internal.generic.RETURN;

import grails.converters.JSON
import grails.transaction.Transactional
import groovy.json.JsonBuilder

@Transactional
class ToolsService {

    def serviceMethod() {

    }
     
	def uplodFile(CommonsMultipartFile file,String destinationDir){
		def	filename
		if(file.empty) {
			flash.message = "File cannot be empty"
		} else {

			filename = file.originalFilename
		
		file.transferTo(new File(destinationDir +filename))

		}
		
	return filename
	}   
	def usersLoction(){

		def countries=Country.list()
		def usersMap = [:]
		
		for (c in countries)  {
			def amount=User.countByCountry(c.name)
			def subMap=[:]
			def mapContent=[:]
			subMap.put('value', amount)
			subMap.put('href','')
			mapContent.put('content', '<span style=\"font-weight:bold;\">'+c.name+'</span><br /> '+ amount + ' registred users' )
			subMap.put('tooltip',mapContent)
			usersMap.put(c.cc_iso, subMap)
		}
		
		return usersMap as JSON
}
}