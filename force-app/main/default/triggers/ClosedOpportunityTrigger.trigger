trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> taskList = new List<Task>();
    
    for(Opportunity a : Trigger.New){
        if(a.StageName == 'Closed Won'){
            Task t = new Task(Subject=' Follow Up Test Task',
            				WhatId=a.Id);
            taskList.add(t);
        }
    }
            insert taskList;
}