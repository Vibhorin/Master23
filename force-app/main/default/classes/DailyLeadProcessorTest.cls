@istest
public class DailyLeadProcessorTest{
public static String CRON_EXP = '0 0 0 15 3 ? 2022';
static testmethod void testScheduledJob() {
list<Lead> lds = new list<Lead>();
    for(Integer i=0;i<200;i++){    
    lead l = new lead(FirstName = 'Lead ' + i,LastName='LastName'+i,Company ='demo'+i);
    lds.add(l);
    }
    insert lds;
    Map<id,lead> ledMap = new map<id,lead>(lds);
    List<id> lstIds = new list<id>(ledMap.keyset());
    Test.startTest();
    String jobId = System.schedule('ScheduledApexTest',CRON_EXP, new DailyLeadProcessor());
    List<lead> lt =[ select Id from lead where leadSource=null and id in :lstIds];
    System.assertEquals(200,lt.size());
    Test.stopTest();
    List<lead> l =[ select Id from lead where leadSource=null and id in :lstIds];
    system.assertEquals(0,l.size());
  }
}