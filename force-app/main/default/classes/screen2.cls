public class screen2 {

    public account account{get;set;}
   
   public screen2()
   {
   ID id=apexpages.currentpage().getparameters().get('id');
   account =[select id,name,phone from account where id =:id];
   }
 public pagereference save()
 {
 update account;
 pagereference pr = new pagereference('/apex/page3?id='+account.id);
 return pr;
 }
}