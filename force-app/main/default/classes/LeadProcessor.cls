global class LeadProcessor implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID,LeadSource,LastName from Lead where LeadSource = \'Dreamforce\'');
    }
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        list<Lead> leadList = new list<Lead>();
        for(Lead le :scope){
            le.lastName = le.lastName +1;
            leadList.add(le);
        }
        update leadList;
    }
    global void finish(Database.BatchableContext bc){
    }
    

}