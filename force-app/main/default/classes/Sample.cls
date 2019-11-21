public class Sample {

    public PageReference switch() {
        return null;
    }

    public List<    To_Test__mdt> listEmpSettings {get;set;}
      
       public List<WrapperClass> listWrapper {get;set;}
    
    public Sample() {
    listEmpSettings = [SELECT DeveloperName, Name__c FROM   To_Test__mdt];
        List<Account> listAcct = [SELECT Name, Industry FROM Account LIMIT 1000];
        
        if(listAcct.size() > 0) {
            listWrapper = new List<WrapperClass>();
            
            for(Account a : listAcct) {
                listWrapper.add(new WrapperClass(a));
            }
        }
    }
    
    public class WrapperClass {
        public Boolean checkBool {get;set;}
        public Account acct {get;set;}
        public WrapperClass(Account acct) {
            this.acct = acct;
            checkBool=false;
        }        
    }

}