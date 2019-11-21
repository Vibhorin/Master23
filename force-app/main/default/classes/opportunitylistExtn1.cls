public with sharing class opportunitylistExtn1 {
Public String csv1{get;set;}
public string c ='';
list<String> headerValues =  new list<String>();
List<Opportunity> oppList =new List<Opportunity>();
public integer abc = 0;
    public opportunitylistExtn1(ApexPages.StandardController controller)
    {
    }
    public pagereference getexport()
    {
    try
    {
    list<ExportMetadata__mdt> abc = new list<ExportMetadata__mdt>([SELECT FieldName__c,ObjectName__c,Sequence__c FROM ExportMetadata__mdt order by Sequence__c]);

for (integer i=0;i< abc.size();i++)
{
    string a = abc[i].ObjectName__c;
string b = abc[i].FieldName__c;
    if(i ==abc.size() -1)
    c+=a+'.'+b;
    else
        c+=a+'.'+b+',';
}
     csv1 = c + '\n';
    headerValues = c.trim().split(',');
 oppList = database.query('SELECT ' + c + ' FROM Opportunity');
}
catch(Exception e)
{
ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'An error occured while quering through Custom Metadata type'+e.getMessage());
            ApexPages.addMessage(errormsg);
            return null;
           
}
try{
for ( Opportunity opps : oppList ) {
        
    for(integer i=0;i<headerValues.size();i++)
    {
        String abc1 = headerValues[i];
        list <string> objectfieldname=abc1.trim().split('\\.');
      if(opps.getsobject('Account')!= NULL && (objectfieldname[0] == 'account' || objectfieldname[0] == 'Account'))
                {
                csv1 += opps.account.get(objectfieldname[1]) + ',' ;
        }
         else if(objectfieldname[0] == 'Opportunity')      
        csv1 += opps.get(objectfieldname[1]) + ',' ;
       else 
       csv1 += '' + ',' ;      
}
csv1 += '\n';
}
}
catch (Exception e)
        {
             
            ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured while displaying record'+e.getMessage());
            ApexPages.addMessage(errormsg);
             return null;
           
          }

Pagereference p = new pagereference('/apex/downloadpagecustommetadata_type4');
    return (p);
 
    }           
    }