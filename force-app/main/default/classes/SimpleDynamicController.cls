public class SimpleDynamicController { 

    public string query {get;set;}
    public list<string> fields {get;set;}
    public list<sObject> result {get;set;}
    public boolean showResult {get;set;}

    public  SimpleDynamicController(){
        showResult=false;
    }//END init

    public pageReference runQuery(){
        fields=query.toLowerCase().substringBefore('from').substringAfter('select').split(',');
        for(string f:fields){
                        f=f.deleteWhiteSpace();
        }
        try{
            result=database.query(query);
        } catch(exception e){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.ERROR,'Malformed SOQL query.  Error: '+e));
        }
        showResult=true;
        return null;
    }//END runQuery

}//END class