trigger SoqlTriggerNotBulk on Account (after update) {
    for(Account a : Trigger.New){
        Opportunity[] opps = [SELECT Id, Name, CloseDate
                             FROM Opportunity WHERE AccountId=:a.Id];
    }
}