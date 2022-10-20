public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String name){
        List<List<sObject>> objList = [FIND :name Returning Contact(Id where LastName=:name), Lead(Id where LastName=:name)];
        return objList;
    }
}