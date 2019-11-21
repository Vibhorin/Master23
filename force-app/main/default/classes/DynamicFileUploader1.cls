public class DynamicFileUploader1
{
    public string nameFile{get;set;}
    public Blob contentFile{get;set;}
    public String selectedObject {get; set;}
    String[] filelines = new String[]{};
    public List<String> headervalues {get;set;}
    List<Opportunity> recordstoupload;
      
    public Pagereference ReadFile()
    {
        try{
        
                //Convert the uploaded file which is in BLOB format into a string
                nameFile =blobToString( contentFile,'ISO-8859-1');
                 
                //Now sepatate every row of the excel file
                filelines = nameFile.split('\n');
                             
                //Iterate through every line and create a Opportunity record for each row
                recordstoupload= new List<Opportunity>();
                headerValues =new List<String>();
                headerValues = filelines[0].trim().split(',');
                for (Integer i=1;i<filelines.size();i++)
                
                {
                       String[] inputvalues = new String[]{};
                       inputvalues = filelines[i].split(',');
                       Opportunity sObj = new Opportunity() ;  
                       for(Integer j=0;j<headerValues.size();j++){
                       //To fetch the filed type which will be further used for typecasting
                       String fieldTypeName = Schema.SObjectType.Opportunity.fields.getMap().get(headerValues[j]).getDescribe().getType().name().toupperCase();
                       //Typecasting to the desired field type
                       if(fieldTypeName =='DATE')
                       sObj.put(headerValues[j],date.valueof(inputvalues[j])) ;                       
                        else if (fieldTypeName =='ID' && (inputvalues[j] != NULL && inputvalues[j] != ''))
                        sObj.put(headerValues[j],id.valueof(inputvalues[j]));
                        else if (fieldTypeName =='DECIMAL')
                        sObj.put(headerValues[j],Decimal.valueof(inputvalues[j]));
                        else if (fieldTypeName =='INTEGER')
                        sObj.put(headerValues[j],Integer.valueof(inputvalues[j]));
                        else if (fieldTypeName =='CURRENCY')
                        sObj.put(headerValues[j],Double.valueof(inputvalues[j]));
                        else if(fieldTypeName!='ID')
                        sObj.put(headerValues[j],inputvalues[j]); 
                         
                    }
                   recordstoupload.add(sObj);
                   System.debug('%%%%'+recordstoupload);
                    }
         }
         catch(Exception e){
                 ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured reading the CSV file'+e.getMessage());
                ApexPages.addMessage(errormsg);
         }       
        //Finally, Upsert the collected records on the basis of external id (Opportunilyloadexternal__c)
        try{
        upsert recordstoupload Opportunilyloadexternal__c;
        }
        catch (Exception e)
        {
            ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured inserting the records'+e.getMessage());
            ApexPages.addMessage(errormsg);
        }    
        return null;
    }
    
    public List<Sobject> getuploadedAccounts()
    {
        if (recordstoupload!= NULL)
            if (recordstoupload.size() > 0)
                return recordstoupload;
            else
                return null;                    
        else
            return null;
    }  
 
    public static String blobToString(Blob input, String inCharset){
        String hex = EncodingUtil.convertToHex(input);
        System.assertEquals(0, hex.length() & 1);
        final Integer bytesCount = hex.length() >> 1;
        String[] bytes = new String[bytesCount];
        for(Integer i = 0; i < bytesCount; ++i)
            bytes[i] =  hex.mid(i << 1, 2);
        return EncodingUtil.urlDecode('%' + String.join(bytes, '%'), inCharset);
    }         
}