/****************************************************************************************  
* File Name   : QuotesWithControllerTest  
* Description : QuotesWithController.cls class의 Method Test
* Target      : QuotesWithController.cls 
* Author      : Romeo
* Modification Log 
* ===============================================================  
* Ver  Date        Author	 Modification 
* =============================================================== 
* 1.0  2022.10.09.  Romeo      Create 
****************************************************************************************/ 
@isTest
private class QuotesWithControllerTest {

    @isTest 
    static void testConstructor(){
        Account acc = new Account();
        acc.Name = 'Test Class Account';
        insert acc;

        Opportunity opp = new Opportunity();
        opp.AccountId = acc.Id;
        opp.Name = 'Test Class Opportunity';
        opp.StageName = 'Closed Won';
        opp.CloseDate = Date.today();
        insert opp;

        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.LastName = 'Test Class Contact';
        insert con;

        Quote qt = new Quote();
        qt.OpportunityId = opp.Id; 
        qt.Name = 'Test Class Quote';
        insert qt;

        Apexpages.StandardController sc = new Apexpages.StandardController(qt);
        QuotesWithController qwc = new QuotesWithController(sc);
        qwc.loadQuoteLineItems(qt.Id);

        qwc.getAccountId(qt.Id);
        qwc.loadContacts(acc.Id);

        qwc.getContacts();
        qwc.getQuoteLineItems();
    }

    @isTest 
    static void testGetAccountId(){
        QuotesWithController qwc = new QuotesWithController();
        String quoteId = '0Q05h000000VpbJCAS';
        // List<Quote> quote = qwc.getAccountId(quoteId);
        // System.debug(quote);
    }

    @isTest 
    static void testLoadQuoteLineItems(){
        QuotesWithController qwc = new QuotesWithController();
        String quoteId = '0Q05h000000VpbJCAS';
        // List<QuoteLineItem> results = qwc.loadQuoteLineItems(quoteId);
        // System.debug(results);
    }

    @isTest 
    static void testLoadContacts(){
        QuotesWithController qwc = new QuotesWithController();
        String accountId = '0015h00000yVWH4AAO';
        // List<Contact> results = qwc.loadContacts(accountId);
        // System.debug(results);
    }



}