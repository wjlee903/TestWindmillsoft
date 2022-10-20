public with sharing class AccountController {
    //  this is quest
    public static List<Account> getAllActiveAccounts(){
        return [SELECT Id, Name, Active__c FROM Account WHERE Active__c = 'Yes'];
    }
}