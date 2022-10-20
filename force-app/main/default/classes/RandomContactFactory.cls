public class RandomContactFactory {

    public static List < Contact > generateRandomContacts (Integer conTotal, String lastNm) {
        List<Contact> conList = new List<Contact>();
        for(Integer i = 0; i<conTotal; i++){
            Contact cont = new Contact(FirstName='Test' +i, LastName = lastNm);
            conList.add(cont);
        }
        return conList;
    }
}