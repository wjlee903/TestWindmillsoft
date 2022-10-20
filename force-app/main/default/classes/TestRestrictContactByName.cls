@isTest
private class TestRestrictContactByName {
    @isTest static void test(){
        
    
    List<Contact> conList = new List<Contact>();
    Contact con1 = new Contact(LastName='INVALIDNAME');
    Contact con2 = new Contact(LastName='TestName');
    conList.add(con1);
    conList.add(con2);
    
    Test.startTest();
    Database.insert(conList);
    Test.stopTest();
    }
}