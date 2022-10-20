global class LeadProcessor implements Database.Batchable<sObject>{
    Integer count = 0;
    
    //start
    global Database.QueryLocator start(Database.BatchableContext bc) {
        //collect all Lead update
        return Database.getQueryLocator('SELECT ID, LeadSource FROM Lead');
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        LIST<Lead> leads = new LIST<Lead>();
       
        for (Lead lead : scope) {
            lead.LeadSource = 'Dreamforce';
            leads.add(lead);
            count += 1;
        }
        update leads;
    }
    global void finish(Database.BatchableContext bc){
		System.debug('count = ' + count);        
    }
}