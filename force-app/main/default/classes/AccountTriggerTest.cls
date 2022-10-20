@isTest
public class AccountTriggerTest {

    @isTest
    static void accountTest(){
        List<Account> accList = new List<Account>();
        for (Integer i = 0; i < 200; i++) {
            Account acc = new Account();
            acc.Name = 'TestName'+i; 
            acc.BillingState = 'CA';
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        Test.stopTest();

        List<Account> accList2 = [select BillingState, ShippingState from Account];
        for (Account a : accList2) {
           System.assertEquals(a.BillingState, a.ShippingState, 'ERROR'); 
        }
    }
}
