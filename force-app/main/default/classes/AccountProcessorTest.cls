@IsTest
public class AccountProcessorTest {
    public static testmethod void test1(){
        Account a = new account();
        a.name = 'test1';
        insert a;
        
        contact c = new contact();
        c.firstname ='abc';
        c.lastname = 'bcd';
        c.accountId = a.id;
        insert c;
        
        list<Id> accId = new list<Id>();
        accid.add(a.Id);
        
        Test.startTest();
        AccountProcessor.countContacts(accid);
        Test.stopTest();
        Account acc = [Select Number_of_Contacts__c from account where id =: a.id];
        system.assertEquals((Decimal)acc.Number_of_Contacts__c ,1);
    }

}