@isTest
public class LeadProcessorTest {
    
    @isTest
    public static void testit() {
        List<Lead> leads = new List<Lead>();
        
        // insert 200 Lead records
        for (Integer i=0;i<200;i++) {
            Lead l = new Lead();
            l.LastName = 'name' + i;
            l.Company = 'Company';
            l.Status = 'Random Status';
          	leads.add(l);
        }
        insert leads;
        
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();
    }  
}