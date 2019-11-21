Public with sharing class SimpleDemoController {
Public string recordId {get;set;}
    Public SimpleDemoController(ApexPages.StandardController controller) {
      recordID = ApexPages.CurrentPage().getparameters().get('id');
    }
}