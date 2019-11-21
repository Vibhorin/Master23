trigger SendConfirmationEmail on Session_Speaker__c (after insert) {
    
    List<Id> idList = new List<Id>();
    
    for(Session_Speaker__c sp : trigger.new){
        idList.add(sp.Id);
    }
    List<Session_Speaker__c> sessionSpeakerList = [Select Session__r.Name,
                    Session__r.Session_Date__c,
                    Speaker__r.First_Name__c,
                    Speaker__r.Last_Name__c,
                    Speaker__r.Email__c
             FROM Session_Speaker__c WHERE Id In :idList AND Speaker__r.Email__c <> NULL];
    List<String> addresses = new List<String>();
    List<String> subjects = new List<String>();
    List<String> messages = new List<String>();
    
    for(Session_Speaker__c sp :sessionSpeakerList){
        addresses.add(sp.Speaker__r.Email__c);
        subjects.add('Session Confirmation');
        messages.add('Dear '+ sp.Speaker__r.First_Name__c +',\nYour Session is confirmed.');
    }
     EmailManager.sendMail(addresses,subjects,messages);   
  
    }