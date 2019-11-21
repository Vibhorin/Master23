@IsTest
private class LeadProcessorTest {
@istest
    static void tetslead(){
    List<Lead> leadList = new List<Lead>();
    
    for(Integer i=0 ; i<200 ; i++){
        lead le = new lead();
        le.lastName = 'Test' +i;
        le.LeadSource = 'Dreamforce';
        le.lastName = 'LastName';
        le.company ='abc';
        leadList.add(le);
    }
    
    insert leadList;
   
   Test.startTest();
    LeadProcessor lea = new LeadProcessor();
    Database.executeBatch(lea);
    Test.stopTest();
    } 
}