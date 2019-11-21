public with sharing class opportunitylistExtn {
Public String csv1{get;set;}

    public opportunitylistExtn(ApexPages.StandardController controller)
    {
    }
    public pagereference getexport()
    {
     csv1 = Label.Opp_Field + '\n';
    list<String> headerValues = Label.Opp_Field.trim().split(',');
List<Opportunity> oppList = database.query('SELECT ' + label.Opp_Field + ' FROM Opportunity');

for ( Opportunity opps : oppList ) {
    system.debug('####'+opps);
    
    for(integer i=0;i<headerValues.size();i++)
    {
        String abc = headerValues[i];
        list <string> objectfieldname=abc.trim().split('\\.');
        if(opps.getSobject('account')!= NULL)
        {
        if(objectfieldname[0] == 'account' || objectfieldname[0] == 'Account')
        {
        //sobject asd =opps.getSobject('account');
        csv1 += opps.getSobject('account').get(objectfieldname[1]) + ',' ;
        }
        else 
        {
        //sobject asdf =opps.opportunity;
        csv1 += opps.get(objectfieldname[1]) + ',' ;
                }
    }    
     
  }
  csv1 += '\n';
}
    return new pagereference('/apex/downloadpage4');
    }   
    
    }