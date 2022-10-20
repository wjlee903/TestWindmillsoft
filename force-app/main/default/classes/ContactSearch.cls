public class ContactSearch {
    public static List<Contact> searchForContacts(String lastName, String postal){
        Contact[] conList = [SELECT ID, Name FROM Contact where (LastName=:lastName and MailingPostalCode=:postal)];
		return conList;
    }
}