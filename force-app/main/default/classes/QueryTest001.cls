public class QueryTest001 {
    public static List<Account> testAccountList(){
        List<Account> accList = new List<Account>();
		accList = [select Name from Account where Name like '%for%'];
		return accList;
    }
    
}