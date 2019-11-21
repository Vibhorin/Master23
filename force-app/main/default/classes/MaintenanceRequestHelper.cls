public class MaintenanceRequestHelper {
    
    public static void updateWorkOrders(){
        List<Case> grabList = [select id, Vehicle__c, Type, Date_reported__c, Status,
                               Date_due__c, Equipment__c, Equipment__r.Maintenance_Cycle__c
                               FROM Case 
                               WHERE Id IN :Trigger.New limit 200];
        
        List<Case> listToInsert = new List<Case>();
        
        //Attempting to typecast MIN value of Maintenance_cycle to be used as parameter for due_date__c.
        //https://help.salesforce.com/articleView?id=000181326&type=1   <--One of my pages referenced
        List<AggregateResult> minCycle = [SELECT MIN(Maintenance_Cycle__c) cy FROM Product2];
        Integer myInt =  Integer.valueOf(minCycle[0].get('cy')); 

        for (Case c :grabList){
            if(c.Status =='Closed' && c.Type == 'Routine Maintenance'){
            Case newCase = new Case();           
            newCase.Subject = 'AutoGenerated Request';
            newCase.Vehicle__c = c.Vehicle__c;
            newCase.Equipment__c = c.Equipment__c;
            NewCase.Type = 'Routine Maintenance';
            newCase.Date_Reported__c = System.today();
            newCase.Origin = 'Web';
            newCase.Date_Due__c = System.today().addDays(myInt);
            listToInsert.add(newCase);
            }
        } 
    insert listToInsert;    
    } 
}