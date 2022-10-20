@isTest
public class AccountProcessorTest {

    @isTest
    public static void testFunction(){
        Account acc = new Account();
        acc.Name = 'Main Inc';
        insert acc;

        Contact con = new Contact();
        con.LastName = 'test';
        con.AccountId = acc.Id;
        insert con;
        Contact con1 = new Contact();
        con1.LastName = 'test1';
        con1.AccountId = acc.Id;
        insert con1;

        List<Id> acc_List = new List<Id>();
        acc_List.add(acc.Id);
        Test.startTest();
        AccountProcessor.countContacts(acc_List);
        Test.stopTest();
        List<Account> accList_Result = new List<Account>([select Number_Of_Contacts__c from Account where Id = :acc.Id]);
        System.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@@'+accList_Result);
    }
}
