trigger ClosedOpportunityTrigger on Opportunity (after insert , after update) {
    list<Task> taskList = new list<Task>();
    for(opportunity o : trigger.new){
        if(o.StageName == 'Closed Won'){
          task t = new task();
            t.WhatId = o.id;
            t.subject = 'Follow Up Test Task';
            taskList.add(t);
        }
    }
            if(taskList.size() >0)
            insert taskList;
}