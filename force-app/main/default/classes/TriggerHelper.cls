public class TriggerHelper {
 
    public static boolean isExecuting = false;
 
    public static void updateValues(list<Contact> ct){
 
        if( TriggerHelper.isExecuting ){
            // if was executed during the same context 
            // avoid recursion
            return;
        }
 
        TriggerHelper.isExecuting = true; 
    // Only do work when the field has changed
  //  Map<Id, Accoount> changed = new Map<Id, Accoount>();
  
    List<Contact> Con = new List<Contact>();
    
    set<Id> parentIds=new set<Id>();
for(Contact c:ct)
parentIds.add(c.Accountid);

  Map<Id,Account> parentMap=new Map<Id,Account>([select id,Sic from Account where id IN:parentids]);
    for (Contact oso : ct) {
      
                Account p= parentMap.get(oso.Accountid);
                Contact c=new contact(Id = oso.Id);
                c.Distributer__c=p.Sic;
                Con.add(c);
            }
            Update(Con);
        }
        }