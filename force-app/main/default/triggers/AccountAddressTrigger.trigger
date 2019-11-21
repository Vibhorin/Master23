trigger AccountAddressTrigger on Account (before insert) {
    
    for (account acc : trigger.new){
        if(acc.BillingPostalCode != null && acc.Match_Billing_Address__c)
            acc.ShippingPostalCode = acc.BillingPostalCode;
    }
}