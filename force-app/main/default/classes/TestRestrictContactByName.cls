@IsTest
public class TestRestrictContactByName {
    @IsTest
    private static void TestContactName(){
        Account acc = new account(Name ='Acme');
        insert acc;
        Contact con = new contact(Firstname ='ContactTest',lastname ='Vibhor');
        insert con;
        
        Test.startTest();
        con.lastName ='INVALIDNAME';
        Database.upsertResult upp = Database.upsert(con,false);
        System.assert(!upp.isSuccess());
        Test.stopTest();
    }

}