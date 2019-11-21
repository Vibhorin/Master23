public class screen3 {

    public PageReference save() {
        return null;
    }


   public account account{get;set;}
   
   public screen3()
   {
   ID id=apexpages.currentpage().getparameters().get('id');
   account =[select id,name,phone from account where id =:id];
   }

}