Public with sharing class ErrorDisplayDemoController {
 Public string accountname{get;set;}
 Public string accountnumber{get;set;}
   Public ErrorDisplayDemoController(ApexPages.StandardController controller) {
   }
   
   Public void UpdateAccount(){
    if(accountname == '' || accountname == null)
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please enter Account name'));
    
    if(accountnumber == '' || accountnumber == null)
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.error,'Please enter Account number'));
   }
}