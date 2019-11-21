trigger Opportunityupdate on Account (before update) {

set<ID> accountid1 = new set<id>();
list<Opportunity> lstOpportunily = new list<Opportunity>();
for( account a : trigger.new)
{
if(a.Sic != Trigger.oldMap.get( a.id ).Sic )
accountid1.add(a.id);
}
lstOpportunily= [select id,accountid from opportunity where accountid =: accountid1];
if(lstOpportunily.size() > 0) {
        for(Opportunity opp : lstOpportunily) {
            opp.Shipping_street__c  = (trigger.newmap.get(opp.AccountId).Sic);
            
        }
        update lstOpportunily;
    }
}