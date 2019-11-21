public class AccountProcessor {
    @future
    public static void countContacts(list<Id> ids){
        Account[] acc = new Account[] {};
        for(AggregateResult ar :[Select AccountID a,count(Id) c from contact where AccountId in :ids group by AccountID]){
            acc.add(new account(Id = (Id)ar.get('a') , Number_of_Contacts__c = (Decimal)ar.get('c')));
        }update acc;}}