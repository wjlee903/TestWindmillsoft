public class ExtensionTestVFPDF {
    
    public List<QuoteLineItem> quoteLineItemList {get; set;}
    public List<ContentVersion> conVer {get; set;}
    public List<Id> productIdList {get; set;}
    public List<Contact> contactList {get; set;}
    public Id accountId {get; set;}

    public ExtensionTestVFPDF(Apexpages.StandardController controller) {
        Id quoteId = ((Quote)controller.getRecord()).Id;
        loadQuoteLineItems(quoteId);

        getAccountId(quoteId);
        loadContacts(this.accountId);

        productIdList = addProductIdList(quoteLineItemList);
        loadContentVersion(productIdList);
    }

    public List<Contact> getContacts(){
        return contactList;
    }

    public void getAccountId(String quoteId){
        Quote quote = [select AccountId from Quote where Id = :quoteId];
        this.accountId = quote.AccountId;
    }

    public List<Id> addProductIdList(List<QuoteLineItem> quoteLineItemList){
        List<Id> results = new List<Id>();
        for (Integer i = 0; i < quoteLineItemList.size(); i++) {
            results.add(quoteLineItemList[i].Product2Id);
        }
        return results;
    }

    public List<ContentVersion> getContentDocument(){
        return this.conVer;
    }

    public List<QuoteLineItem> getQuoteLineItems(){
        return quoteLineItemList;
    }

    public void loadQuoteLineItems(String quoteId) {
        this.quoteLineItemList = [SELECT Id, Description, Quantity, UnitPrice,
                                ListPrice, Product2.Id, Product2Id,
                                Discount, TotalPrice, ServiceDate
                                FROM QuoteLineItem WHERE QuoteId =:quoteId];	
    }

    public void loadContentVersion(LIst<String> productId){
        this.conVer = [select ContentDocumentId, ContentBodyId, FirstPublishLocationId from ContentVersion 
            where FirstPublishLocationId IN :productId];
    }

    public void loadContacts(String quote_AccountId){
        this.contactList = [SELECT Id, Email, Phone, Name, FirstName, LastName, 
                            AccountId, OwnerId, Title
                            FROM Contact where AccountId = :quote_AccountId];
    }



}
