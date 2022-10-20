trigger AccountAddressTrigger on Account (before insert, before update) {
    
    Account a = Trigger.New[0];
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            if(a.Match_Billing_Address__c){
                a.BillingPostalCode=a.ShippingPostalCode;
                
            }
        }
    }
}