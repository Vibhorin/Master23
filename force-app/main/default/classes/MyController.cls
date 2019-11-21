Public class MyController {
Public string MyString_From_Methode{get;set;}
Public string a{get;set;}
    public MyController(ApexPages.StandardController controller) {

    }

    public string ActionFunMethode(){
    if(a=='True'){
    
     MyString_From_Methode = 'Method called from js using Action function';
     }
     else
     {
     MyString_From_Methode ='';
     }
     
     return null;
    }
}