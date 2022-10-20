public class AccountUtils {
    public static List<Account> accountsByState(String state){
        List<Account> accList =[select Id, Name from Account where BillingState =:state];
        return accList;
    }
}
