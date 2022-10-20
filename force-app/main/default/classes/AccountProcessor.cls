public class AccountProcessor {
    @future 
    public static void countContacts(List<Id> account_Id_List){
        Map<Id,Integer> account_noc = new Map<Id, Integer>();
        List<Account> accountList_All = [select Id, (select Id from Contacts) from Account]; 
        for (Account a : accountList_All) {
           account_noc.put(a.Id, a.Contacts.size()); 
        }

        List<Account> account_List = new List<Account>();

        for (Id account_Id : account_Id_List) {
           if (account_noc.containsKey(account_Id)) {
                Account acc = new Account(); 
                acc.Id = account_Id;
                acc.Number_Of_Contacts__c = account_noc.get(account_Id);
                account_List.add(acc);
           } 
        }
        upsert account_List;
    }
}
