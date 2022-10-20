trigger ExampleTrigger on Contact (after insert, after delete) {
    if (Trigger.isInsert){
        Integer recordCount = Trigger.New.size();
        EmailManager.sendMail('leewonjong903@gmail.com', 'Trailhead Trigger Tutorial', recordCount + ' contact were inserted.');
        
    }
    else if (Trigger.isDelete){
        
    }
}