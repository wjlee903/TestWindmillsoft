public class AddPrimaryContact implements Queueable {

    private Contact con;
    private String state;

    public AddPrimaryContact(Contact con, String state){
        this.con = con;
        this.state = state;
    }

    public void execute(QueueableContext context){
        List<Account> ListAccount = [SELECT ID, Name ,
                            (Select id,FirstName,LastName from contacts ) 
                            FROM ACCOUNT WHERE BillingState = :state LIMIT 200];
        
        List<Contact> list_Contact = new List<Contact>();
        for (Account acc : ListAccount) {
            Contact contact = con.clone(); 
            contact.AccountId = acc.Id;
            list_Contact.add(contact);
        }
        if (list_Contact.size() > 0) {
           insert list_Contact; 
        }
    }


}
