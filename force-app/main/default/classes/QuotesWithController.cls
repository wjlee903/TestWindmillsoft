/****************************************************************************************   
* File Name   : QuotesWithController  
* Description : VisualforceToPDF.page extensions class 
* Test Clss   : QuotesWithControllerTest.cls  
* Author      : Romeo
* Page        : Visualforce  
* Modification Log  
* ===============================================================   
* Ver  Date        Author        Modification  
* ===============================================================  
* 1.0  2022.10.03.  Romeo          Create  
****************************************************************************************
* TODO  
* - Image upload 방식 
* - PDF 저장 및 이메일 보내기
****************************************************************************************/ 
public class QuotesWithController {

    public List<QuoteLineItem> quoteLineItemList {get; set;}
    public List<Contact> contactList {get; set;}
    public Id accountId {get; set;}

    public QuotesWithController(){}

    /** 
    * @description : QuotesWithController의 Constructor, Quote의 Id를 조회하여 QuoteLineItem, Contact 조회 
    * @author ??? | 10-05-2022 
    * @param  
    * @return contactList 
    **/ 
    public QuotesWithController(Apexpages.StandardController controller){
        Id quoteId = ((Quote)controller.getRecord()).Id; 
        loadQuoteLineItems(quoteId);

        getAccountId(quoteId);
        loadContacts(this.accountId);
    }

    /** 
    * @description : Account의 Contact를 조회하기 위하여 Quote에서 AccountId 조회 
    * @author ??? | 10-05-2022 
    * @param quoteId 
    * @return  
    **/ 
    public void getAccountId(String quoteId){
        Quote quote = [select AccountId from Quote where Id = :quoteId];
        this.accountId = quote.AccountId;
    }

    /** 
    * @description : loadContacts(private) Method로 조회한 Contact를 반환하는 Method 
    * @author ??? | 10-05-2022 
    * @param  
    * @return contactList 
    **/ 
    public List<Contact> getContacts(){
        return contactList;
    }

    /** 
    * @description : loadQuoteLineItems(private) Method로 조회한 QuoteLineItem을 반환하는 Method 
    * @author ??? | 10-05-2022 
    * @param  
    * @return quoteLineItemList 
    **/ 
    public List<QuoteLineItem> getQuoteLineItems(){
            return quoteLineItemList;
        }
        
    /** 
    * @description : Quote의 Id를 조건으로 QuoteLIneItem을 조회하는 Method 
    * @author ??? | 10-05-2022 
    * @param quoteId 
    * @return 
    **/ 
    public void loadQuoteLineItems(String quoteId) {
        this.quoteLineItemList = [SELECT Id, Description, Quantity, UnitPrice,
                            ListPrice, Quote_Product_Image__c, Product2Id,
                            Discount, TotalPrice, ServiceDate    
                                FROM QuoteLineItem WHERE QuoteId =:   
                                quoteId];	
    }

    /** 
    * @description : Quote에서 조회한 Account Id를 조건으로 Contact를 조회하는 Method 
    * @author ??? | 10-05-2022 
    * @param quote_AccountId 
    * @return 
    **/ 
    public void loadContacts(String quote_AccountId){
        this.contactList = [SELECT Id, Email, Phone, Name, FirstName, LastName, 
                            AccountId, OwnerId, Title
                            FROM Contact where AccountId = :quote_AccountId];
    }


}