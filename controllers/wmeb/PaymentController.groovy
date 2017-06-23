package wmeb

import urn.ebay.api.PayPalAPI.PayPalAPIInterfaceServiceService
import urn.ebay.api.PayPalAPI.SetExpressCheckoutReq
import urn.ebay.api.PayPalAPI.SetExpressCheckoutRequestType
import urn.ebay.api.PayPalAPI.SetExpressCheckoutResponseType
import urn.ebay.apis.CoreComponentTypes.BasicAmountType
import urn.ebay.apis.eBLBaseComponents.PaymentDetailsItemType
import urn.ebay.apis.eBLBaseComponents.PaymentDetailsType
import urn.ebay.apis.eBLBaseComponents.SetExpressCheckoutRequestDetailsType
import urn.ebay.apis.eBLBaseComponents.PaymentActionCodeType;

import urn.ebay.apis.eBLBaseComponents.CurrencyCodeType;

class PaymentController {
	def grailsApplication
    def index() { }
	
	def pay ={
		
		PaymentDetailsType paymentDetails = new PaymentDetailsType();
		paymentDetails.setPaymentAction(PaymentActionCodeType.AUTHORIZATION)
		
		
		BasicAmountType amountTotal = new BasicAmountType(CurrencyCodeType.USD,"20.00");
        paymentDetails.setOrderTotal(amountTotal);
		

		SetExpressCheckoutRequestDetailsType setExpressCheckoutRequestDetails = new SetExpressCheckoutRequestDetailsType();
		setExpressCheckoutRequestDetails.setReturnURL("https://devtools-paypal.com/guide/expresscheckout?success=true");
		setExpressCheckoutRequestDetails.setCancelURL("https://devtools-paypal.com/guide/expresscheckout?cancel=true");
		
		
		
		SetExpressCheckoutRequestType setExpressCheckoutRequest = new SetExpressCheckoutRequestType(setExpressCheckoutRequestDetails);
		setExpressCheckoutRequest.setVersion("104.0");
		
		SetExpressCheckoutReq setExpressCheckoutReq = new SetExpressCheckoutReq();
		setExpressCheckoutReq.setSetExpressCheckoutRequest(setExpressCheckoutRequest);
		
	
		Map<String, String> sdkConfig = new HashMap<String, String>();
		sdkConfig.put("mode", "sandbox");
		sdkConfig.put("acct1.UserName", "ouidadMoussa-facilitator_api1.gmail.com");
		sdkConfig.put("acct1.Password", "VS89EPQ3DWWGKMY2");
		sdkConfig.put("acct1.Signature","AFcWxV21C7fd0v3bYYYRCpSSRl31AY9Ho5TrMCwYQylaK1q0czdS3qMa");

		
	      
		
		  
	
		def locations = grailsApplication.config.grails.config.locations
		
		def path= locations[0].split("file:")[1]
		println path
		
		  PayPalAPIInterfaceServiceService service =  new PayPalAPIInterfaceServiceService("grails-app/conf/sdk_config.properties");

		SetExpressCheckoutResponseType setExpressCheckoutResponse = service.setExpressCheckout(setExpressCheckoutReq);
		
	}
}
