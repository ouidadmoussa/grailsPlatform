package wmeb

import grails.transaction.Transactional
import twitter4j.Twitter
import twitter4j.TwitterFactory
import twitter4j.auth.AccessToken
import twitter4j.conf.ConfigurationBuilder

@Transactional
class SocialService {

    def serviceMethod() {

    }
	
	def sendDirectMessage(){
		println "good service"
		String consumerKey = '8IChH0v3L4XJit9LyT8AMmqM9'
		String consumerSecret ='Jx8p6mAHK3JeeXtktpnAmphD9ZdOkBNN3JnorLx5gLQmYaB8TE'
		String twitterToken = '260978187-ZbTZtwSmHeuV9mKiGzfjPQuzCfvEiGuqv2Ogq2Sc'	
		String twitterSecret= '6l705MbtkERBCQ1Vtewrj6odN0fNgspKYCmPt8R4bIYXr'
	
//		String directMessage='Hi, this is just a test message.'
		
//		TwitterFactory factory = new TwitterFactory()
//		Twitter twitter = factory.getInstance()
//		twitter.setOAuthConsumer(consumerKey, consumerSecret)
//		AccessToken accessToken = new AccessToken(twitterToken, twitterSecret)
//		twitter.setOAuthAccessToken(accessToken)
//		
//		
//	    twitter.sendDirectMessage(twitterName, directMessage)
		
		
	        	Twitter twitter = new TwitterFactory().getInstance();
	
					twitter.setOAuthConsumer(consumerKey, consumerSecret);
				AccessToken accessToken = new AccessToken(twitterToken,
							twitterSecret);
		
					twitter.setOAuthAccessToken(accessToken);
	
					twitter.updateStatus("Post using Twitter4J Again");
		
					System.out.println("Successfully updated the status in Twitter.");
				
			
		
	}
}
