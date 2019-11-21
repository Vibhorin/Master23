public class calculator {
    public integer avalue {get;set;}
    public integer bvalue {get;set;}
    public integer result {get;set;}
    public string operation {get;set;}
    public pagereference subb()
    {
        result =avalue - bvalue;
        operation ='Subtraction';
        return null;
        
    }
      public pagereference add()
    {
        result =avalue + bvalue;
        operation ='Addition';
        return null;
        
    }
    
}