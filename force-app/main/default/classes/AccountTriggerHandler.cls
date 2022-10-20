public with sharing class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> accList){
        List<Account> accs = new List<Account>();
        for (Account acc : accList) {
           if (acc.ShippingState != acc.BillingState) {
                acc.ShippingState = acc.BillingState;

           } 
        }
    }
}
