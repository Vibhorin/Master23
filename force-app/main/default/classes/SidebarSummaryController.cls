public with sharing class SidebarSummaryController {

    public Map<String,integer> oppstages { get; set; }
    
    public SidebarSummaryController(){
    oppstages = new Map<String,integer>();
    for( AggregateResult ar :[select stageName,count(id) cnt from opportunity Group by stageName])
    {
       oppstages.put((String) ar.get('stageName'), (Integer) ar.get('cnt'));
    }
    
    }
}