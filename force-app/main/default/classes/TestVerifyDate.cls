@isTest
public class TestVerifyDate {
    
    @isTest static void greatThanDate1(){
        Date resultDate = VerifyDate.CheckDates(Date.today(), Date.today());
        System.debug(resultDate);
    }
    @isTest static void greatThanDate2(){
        Date resultDate = VerifyDate.CheckDates(Date.today(), date.newInstance(1990, 11, 21));
        System.debug(resultDate);
    }

    
}