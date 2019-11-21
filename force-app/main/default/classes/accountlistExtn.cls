public with sharing class accountlistExtn {
 public static list<opportunity> acc = null;
 
 
     public accountlistExtn(ApexPages.StandardController controller) {

    }
public static list<opportunity> getallaccount()
{
//isExport= false;
string customLabelValue;
if(acc == null)
customLabelValue =System.Label.For_Export_Purpose;
acc=Database.query(customLabelValue);

return acc;
}
public pagereference getexport()
{
return new pagereference('/apex/downloadpage2');
}
}