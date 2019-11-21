public with sharing class returnUrl {
    public string nameQuery{get;set;}
    public list<account> account{get;set;}
    public boolean torender{get;set;}
    public returnUrl() {
        torender= False;
    }
    public PageReference executeSearch() {
        String queryStr='%' + nameQuery + '%';
        account=[select id, Name, BillingStreet from Account where name like :queryStr];
        return null;
    }
    
    public void recordDisplay() {
        // if query appears in URL, execute it
        torender =true;
        System.debug('******'+torender);
        // return null;
    }
}